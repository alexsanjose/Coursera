## This Script implements Max space K clustering
<<<<<<< HEAD
# install.packages("hash")
library(hash)

source("Algo2/fnsAlgorithms02.R")
temp = unique(read.table("../Data/Algo2/Ass02/clustering_big.txt", sep = " ", skip=1))
clusterData = (as.matrix((temp[1:50000,])))

clusterData = clusterData[,1:24]

dec_hash = toDecimal(clusterData)

# ?hash

test1 = hash(key = dec_hash[1:10], values = 1:length(dec_hash))
test = hash(dec_hash[1:10], 1:10)
# test1 = hash(key = dec_hash[1:10])
as.list(test)

test$key$'351000'

test$'351000'


A = hash( 1:26, 1:26 )
A$'1'

hash_num = rawToBits(hash_string)
hash_string[1,]



matrix_sum = apply(clusterData,1, sum)

as.raw(clusterData[1,])
# which(hash == hash[123123])
# clusterData = read.table("../Data/Algo2/Ass02/testCase1.txt", sep = " ", skip=1)

i = j = 1 
len = 1:nrow(clusterData)

system.time(
{
  for(j in 1:24)
  {
    temp_matrix = clusterData
    temp_matrix[,j] = 1 - temp_matrix[,j]
    temp_sum_matrix = apply(temp_matrix, 1, sum)
    hash2 = apply(temp_matrix, 1, paste0, collapse = "")
#     
    for(i in 1:nrow(clusterData)){
    #       which(hash2[i] == hash)
    }
    print(j)
  }

}
)


A = matrix(data = NA, nrow = 100000, ncol = 10000)
=======

clusterData = read.table("../Data/Algo2/Ass02/clustering_big.txt", sep = " ", skip=1)
clusterData$V25 = NULL
clusterData$V25 = apply(clusterData, 1, sum)
clusterData = unique(clusterData)

plot(sort(clusterData$V25))
# clusterData = read.table("../Data/Algo2/Ass02/testCase1.txt", sep = " ", skip=1)

clusterData = clusterData[order(clusterData$V3),]

nodes = unique(c(clusterData$V1, clusterData$V2))
