
## This Script tries to solve TSP using dynamic programming
source("Algo2/fnsAlgorithms02.R")
library("hash")

tspData = read.table("../Data/Algo2/Ass05/tsp.txt", sep = " ", skip=1, col.names = c("x", "y"))
# tspData = read.table("../Data/Algo2/Ass05/test5.txt", sep = " ", skip=1, col.names = c("x", "y"))
# tspData = read.table("../Data/Algo2/Ass05/test4.txt", sep = " ", skip=1, col.names = c("x", "y"))
# tspData = read.table("../Data/Algo2/Ass05/test35.txt", sep = " ", skip=1, col.names = c("x", "y"))
# tspData = read.table("../Data/Algo2/Ass05/test3.txt", sep = " ", skip=1, col.names = c("x", "y"))
# tspData = read.table("../Data/Algo2/Ass05/test2.txt", sep = " ", skip=1, col.names = c("x", "y"))
tspData = read.table("../Data/Algo2/Ass05/test1.txt", sep = " ", skip=1, col.names = c("x", "y"))

# Normalizing
tspData_test = tspData
plot(tspData)
text(tspData$x, tspData$y, rownames(tspData))
tspData[,3] = 1:nrow(tspData)

tour = TST(tspData_test, set1 = c(12:1, 13), set2 = c(13:25, 12))

Rprof(NULL)
summaryRprof("test.out")

A
A1
tour

