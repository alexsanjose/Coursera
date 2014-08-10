
## This Script tries to solve TSP using dynamic programming
source("Algo2/fnsAlgorithms02.R")
library("hash")

tspData = read.table("../Data/Algo2/Ass05/tsp.txt", sep = " ", skip=1, col.names = c("x", "y"))
tspData = read.table("../Data/Algo2/Ass05/test5.txt", sep = " ", skip=1, col.names = c("x", "y"))
tspData = read.table("../Data/Algo2/Ass05/test4.txt", sep = " ", skip=1, col.names = c("x", "y"))
tspData = read.table("../Data/Algo2/Ass05/test35.txt", sep = " ", skip=1, col.names = c("x", "y"))
tspData = read.table("../Data/Algo2/Ass05/test3.txt", sep = " ", skip=1, col.names = c("x", "y"))
tspData = read.table("../Data/Algo2/Ass05/test2.txt", sep = " ", skip=1, col.names = c("x", "y"))
tspData = read.table("../Data/Algo2/Ass05/test1.txt", sep = " ", skip=1, col.names = c("x", "y"))

# Normalizing
tspData_test = tspData

Rprof("test.out")
A = TST(tspData_test)
Rprof(NULL)
summaryRprof("test.out")

A

