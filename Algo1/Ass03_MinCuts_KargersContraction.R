## This Script finds the min cut for a graph using contraction algorithm 
# install.packages("stringr")
# install.packages("igraph")
install.packages("plyr")

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


# A = read.csv("http://spark-public.s3.amazonaws.com/algo1/programming_prob/kargerMinCut.txt", header = F)
Array = as.character(A$V1)

Adj_list = sapply(Array, strsplit, "\t")
# Adj_list = test_array

### Creating Adjacency list
names(Adj_list) = sapply(Adj_list, function(x) x[[1]])
Adj_list = sapply(Adj_list, function(x) x[-1])

### Plotting
# test = stack(Adj_list)
# test1 = graph.data.frame(test)
# plot(test1)

### Finding min cuts
PlotAdjList <- function(Adj_list)
{
  test = stack(Adj_list)
  test1 = graph.data.frame(test)
  plot(test1)
}

ContractAdjList <- function(Adj_list, rand_node, rand_edge)
{
  target_node = Adj_list[[rand_node]][rand_edge]
  
  Adj_list[[rand_node]] = c(Adj_list[[rand_node]], Adj_list[[target_node]])

  Adj_list[[target_node]] = NULL
  
  Adj_list = sapply(Adj_list, function(x) 
  {
    x[x == target_node] = rand_node
    x
  })
  
  Adj_list[[rand_node]] = Adj_list[[rand_node]][Adj_list[[rand_node]]!=rand_node] 
  
  Adj_list
}

FindminCuts <- function(Adj_list)
{
  Adj_list_dummy = Adj_list
  Adj_list = Adj_list_dummy

  while(length(Adj_list) > 2)
  {
    rand_node = sample(names(Adj_list), 1)
    rand_edge = sample(1:length(Adj_list[[rand_node]]), 1)
    Adj_list = ContractAdjList(Adj_list, rand_node, rand_edge)
  }
  
  Adj_list
#   PlotAdjList(Adj_list)
#   PlotAdjList(Adj_list_new)
#   PlotAdjList(test)
#   
}

Q = sapply(1:100, function(i)
{
  print(i)
  min_cuts = length(FindminCuts(Adj_list)[[1]])
})


min(sapply(Adj_list, length))

Adj_list[[1]]


Adj_list[[4]]

