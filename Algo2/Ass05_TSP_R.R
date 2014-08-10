
## This Script tries to solve TSP using dynamic programming
source("Algo2/fnsAlgorithms02.R")
tspData = read.table("../Data/Algo2/Ass05/tsp.txt", sep = " ", skip=1, col.names = c("x", "y"))
tspData = read.table("../Data/Algo2/Ass05/test4.txt", sep = " ", skip=1, col.names = c("x", "y"))
tspData = read.table("../Data/Algo2/Ass05/test35.txt", sep = " ", skip=1, col.names = c("x", "y"))
tspData = read.table("../Data/Algo2/Ass05/test3.txt", sep = " ", skip=1, col.names = c("x", "y"))
tspData = read.table("../Data/Algo2/Ass05/test2.txt", sep = " ", skip=1, col.names = c("x", "y"))
tspData = read.table("../Data/Algo2/Ass05/test1.txt", sep = " ", skip=1, col.names = c("x", "y"))

# Normalizing
# tspData[,1] = tspData[,1] - min(tspData[,1])
# tspData[,2] = tspData[,2] - min(tspData[,2])

plot(tspData)



ed(tspData[1,], tspData[2,])

tspData_test = tspData

plot(tspData)


Rprof("test.out")
A = TST(tspData_test)
Rprof(NULL)

A

