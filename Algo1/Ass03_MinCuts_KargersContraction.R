## This Script finds the min cut for a graph using contraction algorithm 
# install.packages("stringr")
# install.packages("igraph")
library("igraph")
library("stringr")
library("plyr")

## Loading data
test_array = list(c(1, 2, 3, 4),
                  c(2, 1, 3, 4, 5),
                  c(3, 1, 2, 4),
                  c(4, 2, 3, 1, 7),
                  c(5, 6, 7, 8, 2),
                  c(6, 5, 7, 8),
                  c(7, 8, 5, 6, 4),
                  c(8, 5, 7, 6)
                  )


A = read.csv("http://spark-public.s3.amazonaws.com/algo1/programming_prob/kargerMinCut.txt", header = F)
Array = test_array
Array = as.character(A$V1)

Adj_list = sapply(Array, strsplit, "\t")
# Adj_list = test_array

### Creating Adjacency list
names(Adj_list) = sapply(Adj_list, function(x) x[[1]])
Adj_list = sapply(Adj_list, function(x) x[-1])

PlotAdjList(Adj_list)
### Plotting
# test = stack(Adj_list)
# test1 = graph.data.frame(test)
# plot(test1)


Q = sapply(1:100, function(i)
{
  print(i)
  min_cuts = length(FindminCuts(Adj_list)[[1]])
})


min(sapply(Adj_list, length))

Adj_list[[1]]


Adj_list[[4]]

