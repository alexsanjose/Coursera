
## This Script tries to solve TSP using dynamic programming
source("Algo2/fnsAlgorithms02.R")
library("data.table")

# Array = read.table("https://spark-public.s3.amazonaws.com/algo2/datasets/2sat1.txt", sep = " ", skip=1, col.names = c("V1", "V2"))
# Array = read.table("https://spark-public.s3.amazonaws.com/algo2/datasets/2sat2.txt", sep = " ", skip=1, col.names = c("V1", "V2"))
# Array = read.table("https://spark-public.s3.amazonaws.com/algo2/datasets/2sat3.txt", sep = " ", skip=1, col.names = c("V1", "V2"))
# Array = read.table("https://spark-public.s3.amazonaws.com/algo2/datasets/2sat4.txt", sep = " ", skip=1, col.names = c("V1", "V2"))
# Array = read.table("https://spark-public.s3.amazonaws.com/algo2/datasets/2sat5.txt", sep = " ", skip=1, col.names = c("V1", "V2"))
# Array = read.table("https://spark-public.s3.amazonaws.com/algo2/datasets/2sat6.txt", sep = " ", skip=1, col.names = c("V1", "V2"))

Array = read.table("../Data/Algo2/Ass06/test5.txt", sep = " ", skip=1, col.names = c("V1", "V2"))
Array = read.table("../Data/Algo2/Ass06/test4.txt", sep = " ", skip=1, col.names = c("V1", "V2"))
Array = read.table("../Data/Algo2/Ass06/test3.txt", sep = " ", skip=1, col.names = c("V1", "V2"))
Array = read.table("../Data/Algo2/Ass06/test2.txt", sep = " ", skip=1, col.names = c("V1", "V2"))


single_SCC = TwoSat_Kosaraju(Array)
test = sapply(single_SCC, function(x){
  x[x%%2 == 1] = x[x%%2 == 1] + 1
  max(table(x))
})
test > 1


#
ass_no = 2:6
i = 1

SCC_full = lapply(ass_no, function(i){
  message("Starting Assignment: ", i)
  Array =  read.table(paste0("https://spark-public.s3.amazonaws.com/algo2/datasets/2sat", i, ".txt"), sep = " ", skip=1, col.names = c("V1", "V2"))
  single_SCC = TwoSat_Kosaraju(Array)
  
  test = sapply(single_SCC[[3]], function(x){
    x[x%%2 == 1] = x[x%%2 == 1] + 1
    max(table(x))
  })
  print(any(test > 1))
  
  single_SCC
})


Output = sapply(SCC_full, function(single_SCC)
{
  test = sapply(single_SCC[[3]], function(x){
    x[x%%2 == 1] = x[x%%2 == 1] + 1
    max(table(x))
  })
  any(test > 1)
  
})

which(test > 1)

c(FALSE, FALSE