## This Script finds the Strongly connected components
library("data.table")
source("Algo1/fnsAlgorithms01.R")
## Loading data

Array = fread("../SCC/SCC.txt", sep=" ", header = F)
# Array = fread("../SCC/testCase3.txt", sep=" ", header = F)


revArray = Array[order(Array$V2),]
revArray2 = data.frame(revArray$V2, revArray$V1)

# plot(graph.data.frame(data.frame(revArray2)))

node_size = length(unique(c(Array$V1, Array$V2)))


Adj_list =  MakeAdjacencyList(revArray$V1, revArray$V2, node_size)
# Array = Array[!which(Array$V1 == Array$V2),]
vertex_check = rep(FALSE, node_size)
vertex_fin_time = rep(NA, node_size)
vertex_edge_number = rep(2, node_size)

vertex_stack = integer()

fin_count = 1
i = 2


for(i in 1:node_size)
{
  current_element = i

  if(vertex_check[current_element]) next else
  {
    vertex_stack = append(vertex_stack, current_element)
    vertex_check[current_element] = T
  }

  while(length(vertex_stack) != 0)
  {
    next_element = Adj_list[[current_element]][vertex_edge_number[[current_element]]]
    if(is.na(next_element))
    {
      vertex_fin_time[current_element] = fin_count
      fin_count = fin_count + 1
      if(fin_count%%10000 == 0) print(fin_count)
      vertex_stack = vertex_stack[-length(vertex_stack)]
      current_element = last(vertex_stack)
    }else
    {
      if(vertex_check[next_element]){
        vertex_edge_number[[current_element]] = vertex_edge_number[[current_element]] + 1
      }else{
        current_element = next_element
        vertex_stack = append(vertex_stack, current_element)
        vertex_check[current_element] = T
      }
    }
  }
}

vertex_fin_time_order = order(vertex_fin_time, decreasing=T)

Adj_list = MakeAdjacencyList(Array$V2, Array$V1, node_size)

vertex_check = rep(FALSE, node_size)
vertex_edge_number = rep(2, node_size)

SCC = NULL

for(i in vertex_fin_time_order)
{
  current_SCC = 0
  
  current_element = i
  
  if(vertex_check[current_element]) next else
  {
    vertex_stack = append(vertex_stack, current_element)
    vertex_check[current_element] = T
    current_SCC = current_SCC + 1
  }
  
  while(length(vertex_stack) != 0)
  {
    next_element = Adj_list[[current_element]][vertex_edge_number[[current_element]]]
    if(is.na(next_element))
    {
      vertex_fin_time[current_element] = fin_count
      fin_count = fin_count + 1
      vertex_stack = vertex_stack[-length(vertex_stack)]
      current_element = last(vertex_stack)
    }else
    {
      if(vertex_check[next_element]){
        vertex_edge_number[[current_element]] = vertex_edge_number[[current_element]] + 1
      }else{
        current_element = next_element
        vertex_stack = append(vertex_stack, current_element)
        vertex_check[current_element] = T
        current_SCC = current_SCC + 1
      }
    }
  }
#   print(current_SCC)
  SCC = append(SCC, current_SCC)
}

tail(sort(SCC))

