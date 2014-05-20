## This Script does Quicksort 

A = read.csv("http://spark-public.s3.amazonaws.com/algo1/programming_prob/QuickSort.txt", header = F)
Array = A$V1

Comparisons = 0

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

Comparisons = 0
system.time({
Q_first = QuickSort(Array, "first")
})
Comparisons

Comparisons = 0
system.time({
Q_last = QuickSort(Array, "last")
})
Comparisons

Comparisons = 0
system.time({
Q_med = QuickSort(Array, "median")
})
Comparisons


