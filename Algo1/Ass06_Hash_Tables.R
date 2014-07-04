## This Script solves the two sum problem using hash tables
library("data.table")
library("stringr")
library("plyr")
require("matlab")
source("Algo1/fnsAlgorithms01.R")
options(stringsAsFactors = F)
## Loading data

Array = read.csv("../Data/HashTable/algo1_programming_prob_2sum.txt", sep="\n", header = F)$V1
# Array = fread("../SCC/testCase3.txt", sep=" ", header = F)
n = 2e6 + 3

hash_push = function(hash_table, hash, n)
{
#   system.time({a = append(hash_table$index, x)})
#   system.time({hash_table$index})
#   system.time({hash_table$index = a})
#   
#   
#   
#   system.time({hash_table[[index]] = append(hash_table[[index]], x)})
#   system.time({append(hash_table[[index]], x)})
  hash_table[[hash]] = append(hash_table[[hash]], x)
  hash_table
}

hash_select = function(hash_table, x, n)
{
  index = x%%n
  which(hash_table$index == x)
}

hash_table = new.env()
i = 1
ls(hash_table)
hash_table[[index[1]]] = 5

assign("index", "12341", envir=hash_table)
ls(hash_table)

hash_table$index

hashes = as.character(Array%%n)

for(i in 1:length(Array))
{
  if(i %% 1e4 == 0) print(i)
  hash_table = hash_push(hash_table, hashes[i], n)
}

## lookup

