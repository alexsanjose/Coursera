## This Script does Quicksort 

A = read.csv("http://spark-public.s3.amazonaws.com/algo1/programming_prob/QuickSort.txt", header = F)
Array = A$V1

Comparisons = 0

# Multiporpose merge function
# Array = c(2, 5, 4, 3, 0, 9, 8, 6, 1, 20,17)
# Array = c(2,1)


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


