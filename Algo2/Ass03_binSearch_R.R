## This Script makes the binary search tree

l = 7
elements = 1:l
probs = c(0.05,0.4,0.08,0.04,0.1,0.1,0.23)

left_node = right_node = rep(NA, l)

i = 1


binTree(elements, weights)
test_matrix = matrix(NA, 7, 7)


for(i in 1:l)
  for(j in 1:(l - i + 1))
  {
    current = NA
    if(i == 1)  current = probs[j] else
      current = min
    test_matrix[i, j] = current
  }


