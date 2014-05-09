## This Script does merge sort and finds the number of Inversions as a by product

A = read.csv("http://spark-public.s3.amazonaws.com/algo1/programming_prob/IntegerArray.txt", header = F)

# Multiporpose merge function
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


system.time({R = MergeSort(A$V1[1:100000])})
R$inversions