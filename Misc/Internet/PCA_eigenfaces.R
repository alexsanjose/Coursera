library(RCurl)
library('httr')
library('XML')


imgdir = "../Data/Internet/EigenFaces"

url.stub = 'https://stripe.com/'

cafile <- system.file('CurlSSL', 'cacert.pem', package = 'RCurl')
# Read page
page <- GET(
  url.stub, 
  path='about', 
  config(cainfo = cafile)
)

x <- content(page, as='text')

#########################
# Parse HTML
#########################
doc <- htmlTreeParse(x, asText=TRUE, useInternal=TRUE)

#########################
# Get face URLs
#########################
stub = "//div[@id = 'about']"
urls = xpathSApply(doc, 
                   path=paste0(stub, '//img'), 
                   xmlGetAttr, 'src')

img.urls = paste0(url.stub, urls)
out.imgs = file.path(imgdir, basename(img.urls))

stopifnot(!any(duplicated(img.urls)))
have = file.exists(out.imgs)
img.urls = img.urls[!have]
out.imgs= out.imgs[!have]
###########
# Download images
##########
for (iimg in seq_along(img.urls)){
  download.file(url=img.urls[iimg], destfile = out.imgs[iimg], 
                method='curl')
}

#===========================
library(png)
library(pixmap)
library(matrixStats)
imgs = list.files(imgdir, pattern='.png$', full.names = TRUE)
n_imgs = length(imgs)

img.list = vector(mode= 'list', length = n_imgs)
iimg = 2
for ( iimg in seq(n_imgs)){
  img.f = imgs[iimg]
  img.list[[iimg]] = readPNG(img.f)[, , 1:3]
}


dims = lapply(img.list, dim)

################################
# Don't feel like interpolating - only keeping 200x200x3
################################
dimg = c(200, 200, 3)

keep = sapply(dims, function(x) all(x == dimg))
img.list = img.list[keep]
imgs = imgs[keep]
dims = dims[keep]

################################
# Making Matrix: P x N
################################
mat = t(sapply(img.list, c))
cmeans = apply(mat, 2, median)
sds = colSds(mat)


makeimg = function(x, trunc = FALSE, ...){
  x = array(x, dim = dimg)
  if (trunc){
    x[x < 0] = 0
    x[x > 1] = 1
  }
  plot(pixmapRGB(x), ...)
}

makeimg(cmeans, main = 'Average Striper')


# #############
# # Centering and scaling matrix
# #############
X = t(t(mat) - cmeans)
X = t(t(X) / sds)
pca = prcomp(X, center=FALSE)

devs = pca$sdev^2 / sum(pca$sdev^2)
plot(1-devs, main='Percent Variance Explained', type='l')

V <- pca$rotation #sample PCs from PCA
################################
# Plotting Mean Image and PCs
################################

par(mfrow=c(2, 5))
par(oma = rep(2, 4), mar=c(0, 0, 3, 0))
makeimg(cmeans, main = 'Average Striper')

for (i in 1:9){
  makeimg(V[,i],main = paste0('PC ', i))  #PCs from sample data
}