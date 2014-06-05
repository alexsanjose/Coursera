## This contains all the functions for the Assignments

#### Ass01 ####
# Multipurpose merge function
Merge <- function(x, y){
  z = rep(NA, length(x) + length(y))
  i = j = k = 1
  lx = length(x) 
  ly = length(y) 
  inversions = 0
  
  while( i <= lx & j <= ly ){
    if(x[i] < y[j]){
      z[k] = x[i] 
      i = i + 1 
    }else{
      z[k] = y[j] 
      inversions = inversions + (lx + 1 - i)
      j = j + 1
    }
    k = k + 1
  }
  
  if(i > lx)  z[(i+j-1):(lx+ly)] = y[j:ly]  else {
    z[(i+j-1):(lx+ly)] = x[i:lx] 
  }
  output = list()
  output$array = z
  output$inversions = inversions
  
  output
}

MergeSort <- function(r){
  if(length(r) == 1) return(list(array = r, inversions = 0)) else  {
    halflength = floor(length(r)/2)
    x = MergeSort(r[1:halflength])
    y = MergeSort(r[(halflength+1):length(r)])
    output = (Merge(x$array, y$array))
  }
  finaloutput = list()
  finaloutput$array = output$array
  finaloutput$inversions = output$inversions + x$inversions + y$inversions
  finaloutput
  
}

#### Ass02 ####

SwapArray <- function(Array, index1, index2)
{
  temp = Array[index1]
  Array[index1] = Array[index2]
  Array[index2] = temp
  Array
}

Partition <- function(Array)
{
  pivot = Array[1]
  j = i = 2
  for(j in 1:length(Array)) 
  {
    if(Array[j] < pivot){
      Array = SwapArray(Array, i , j)
      i = i + 1
    }
  }
  Array
  Array = SwapArray(Array, 1, i - 1)
  return(list(Array = Array, index = i))
  
}


QuickSort <- function(Array, type = "first")
{
  l = length(Array)
  
  #   message("Array Before :", paste(Array, collapse=","))
  #   print(l - 1)
  Comparisons <<- Comparisons + l - 1
  
  
  if(l == 1 ) return(Array)
  left_half = right_half = integer(0)
  
  if(type == "last") Array = SwapArray(Array, 1, l)
  if(type == "median")
  {
    med = median(c(Array[1], Array[l], Array[ceiling(l/2)]))
    med_index = which(Array == med)
    Array = SwapArray(Array, 1, med_index)
  }
  
  #   message("Array After:", paste(Array, collapse=","))
  Partitioned = Partition(Array)
  Array_partitioned = Partitioned$Array
  i = Partitioned$index
  
  
  if(i > 2) left_half = QuickSort(Array_partitioned[1:(i-2)], type)
  if(i <= l) right_half = QuickSort(Array_partitioned[i:l], type)
  Output = c(left_half, Array[1], right_half)
  
}

#### Ass03 ####

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

#### Ass04 ####