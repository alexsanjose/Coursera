
## This Script implements Knapsacking
source("Algo2/fnsAlgorithms02.R")
# clusterData = read.table("../Data/Algo2/Ass03/knapsack1.txt", sep = " ", skip=0)
clusterData = read.table("../Data/Algo2/Ass03/knapsack_big.txt", sep = " ", skip=0)
# clusterData = read.table("../Data/Algo2/Ass03/test1.txt", sep = " ", skip=0)


size = clusterData$V1[1]
item_list = clusterData[-1,]
item_value = item_list$V1
item_size = item_list$V2

# 
# size = 165
# item_size = c(23, 31, 29, 44, 53, 38, 63, 85, 89, 82)
# item_value = c(92, 57, 49, 68, 60, 43, 67, 84, 87, 72)
# 

system.time({
A = knapsack(size, item_value, item_size)
})
A

4243395