## This Script caclulates the ith order statistic

A = read.csv("http://spark-public.s3.amazonaws.com/algo1/programming_prob/QuickSort.txt", header = F)
Array = A$V1
order = 2

# Multiporpose merge function
# Array = c(2, 5, 4, 3, 0, 9, 8, 6, 1, 20,17)
# Array = c(2,1)
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

IthOrder <- function(Array, order = 1, Comparisons = 0)
{
  l = length(Array)
  Comparisons = Comparisons + l - 1
  
  if(l == 1 ) return(list(stat = Array[1], Comparisons = Comparisons))
  
  pivot_index = 9
  pivot_index = sample(1:l, 1)
  #   print(pivot_index)
  
  Array = SwapArray(Array, 1, pivot_index)

  #   message("Array After:", paste(Array, collapse=","))
  Partitioned = Partition(Array)
  Array_partitioned = Partitioned$Array
  i = Partitioned$index - 1
  
  if(i == order) stat_comparisons = list(stat =  Array_partitioned[i], Comparisons = Comparisons)
  if(i > order) stat_comparisons =  IthOrder(Array_partitioned[1:(i-1)], order, Comparisons)
  if(i < order) stat_comparisons = IthOrder(Array_partitioned[(i+1):l], order - i, Comparisons)
  stat_comparisons
}

iterations = 200
all_stats = lapply(1:iterations, function(i)
{
  print(i)
  x = sample(1:length(Array), 1)
  output = IthOrder(Array, x, 1)
  print(output)
  output
})

Array= rep(Array, 10)
A = IthOrder(Array, 100)
Q = sapply(all_stats, function(x) x$Comparisons)

min(Q)
max(Q)
mean(Q)

all_stats
all_stats[[1]]
