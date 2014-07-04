## This Script do the median maintenantce, but then I don't like heaps
library("data.table")
library("stringr")
library("plyr")
source("Algo1/fnsAlgorithms01.R")
options(stringsAsFactors = F)
## Loading data

Array = fread("../Data/HashTable/Median.txt", sep="\n", header = F)$V1
# Array = fread("../SCC/testCase3.txt", sep=" ", header = F)
i = 3

Q = sapply(1:length(Array), function(i)
  if(i%%2 == 1)  median(Array[1:i]) else median(c(-Inf, Array[1:i])))
    
sum(Q)%%10000

install.packages("RJSONIO")
library("RJSONIO")
library("RPushbullet")
detach("RPushbullet")
sink("~/.rpushbullet.json")
cat(RJSONIO::toJSON(list(key="v1T6KJw2nWVo76r7HUoc1feGQy94nfeBU1ujBoqyotexw", devices=c("ujBoqyotexwdjzWIEVDzOK", "ujBoqyotexwdjAsoeMFET6"))))
sink()

pbPost("note", "Job Done!", "", device=1)
pbGe
pbPost("link", "Pushbullet home page", url="http://www.pushbullet.com", deviceind=2)
A = fromJSON(pbGetDevices("v1T6KJw2nWVo76r7HUoc1feGQy94nfeBU1ujBoqyotexw"))

