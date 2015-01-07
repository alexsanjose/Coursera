library(RCurl)
library(XML)
library(ggmap)
library (plotGoogleMaps)

webpage=getURL("http://en.wikipedia.org/wiki/List_of_elements", .opts = opts)
table=readHTMLTable(webpage)[[1]]
table=table[nchar(as.character(table$Element))>2,c("Sym", "Element")]
i = 2

for (i in 1:nrow(table)) {
  valor=geocode(as.character(table$Element[i]))
  table$lon[i]=valor$lon;
  table$lat[i]=valor$lat
}

table2paint=na.omit(table[, c("lat", "lon", "Sym", "Element")])
coordinates(table2paint)=~lon+lat
proj4string(table2paint)=CRS('+proj=longlat +datum=WGS84')
plotGoogleMaps(table2paint, col="yellow", control.width="0%", control.height="0%", mapTypeId='ROADMAP', legend=FALSE)plotGoogleMaps(table2paint, col="yellow", control.width="0%", control.height="0%", mapTypeId='ROADMAP', legend=FALSE)
