## This Script does merge sort and finds the number of Inversions as a by product

A = read.csv("http://spark-public.s3.amazonaws.com/algo1/programming_prob/IntegerArray.txt", header = F)

system.time({R = MergeSort(A$V1[1:100000])})
R$inversions