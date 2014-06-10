## This Script finds the shortest distance from source to end using Dijkstra's algorithm
library("data.table")
library("stringr")
library("plyr")
source("Algo1/fnsAlgorithms01.R")
options(stringsAsFactors = F)
## Loading data

Array = fread("../Data/ShortestPath/dijkstraData.txt", sep="\n", header = F)$V1
# Array = fread("../Data/ShortestPath/testCase2.txt", sep="\n", header = F)$V1
# Array = fread("../SCC/testCase3.txt", sep=" ", header = F)

sep = "\t"
# sep = " "
a = Array[1]
Array_distance_DF = ldply(Array, function(a)
{
  split_element = str_split(a, sep)[[1]]
  node = split_element[1]
  temp = unlist(lapply(split_element[-1], str_split, ","))
    temp = temp[temp!=""]
  distances = matrix(temp, ncol=2, byrow=T )
  data.frame(node, distances)
})
names(Array_distance_DF) = c("node", "edge", "dist")
Array_distance_DF$dist = as.numeric(Array_distance_DF$dist)

str(Array_distance_DF)

source_vertex = "1"

# source_vertex = nodes[[source_vertex_num]]
conquered = source_vertex
nodes = unique(Array_distance_DF$node)

final_distances = rep(NA, length(nodes))
final_distances[nodes == source_vertex] = 0

i = 1

edges[[i]]

for(i in 2:length(nodes))
{
  print(i)
  unseen = setdiff(nodes, conquered)
  
  current_boundary = subset(Array_distance_DF, node %in% conquered)
  current_boundary = subset(current_boundary, edge %in% unseen)
  
  current_distances = ddply(current_boundary, "node", function(x) x[which.min(x$dist),])
  current_distances$acc_dist = sapply(current_distances$node, function(x) final_distances[nodes==x])
  
  current_distances$total_dist = current_distances$acc_dist + current_distances$dist
  
  new_node = current_distances[which.min(current_distances$total_dist),]$edge
  final_distances[nodes == new_node] = min(current_distances$total_dist)
  final_distances
  conquered = c(conquered, new_node)
  
}
final_distances[c(7,37,59,82,99,115,133,165,188,197)]
