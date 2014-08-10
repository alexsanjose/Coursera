## This contains all the functions for the Assignments


#### Ass02 ####
# Convert Matrix to decimal
toDecimal <- function(clusterData)
{
  colSize = ncol(clusterData) -1
  hash = rep(0, nrow(clusterData))
  for(i in 0:colSize)
  {
    hash = hash + clusterData[,(i+1)]*(2^i)
  }
  hash
}
#
### Ass03 ####
# Binary Search Tree

binTree <- function(elements, probs){
  
  l = length(elements)
  i = 1
  distance = rep(NA, l)
  for(i in 1:l){
    
    left_node = right_node = 0
    if(i != 1)
      left_node = binTree(elements[1:(i-1)], probs[1:(i-1)])
    if(i != l)
      right_node = binTree(elements[(i+1):l], probs[(i+1):l])
    
    distance[i] = left_node + right_node 
  }
  min(distance) + sum(probs)
}


## Ass03 - Knapsack
knapsack <- function(size, item_value, item_size){
  dummy_value = item_value
  dummy_size = item_size
  
  item_value = item_value[order(-dummy_size, dummy_value )]
  item_size = item_size[order(-dummy_size, dummy_value )]
  
  knap_vector_prev = rep(0, size)
  i = 1
  
  for(i in 1:length(item_value)){
    print(i)
    knap_vector_current = knap_vector_prev
    for(j in item_size[i]: (size))
    {
      if(item_value[i] >= knap_vector_current[j]){
        knap_vector_current[j] = item_value[i]
        if(j<size){
          # next_values = cbind(knap_vector_current[ (j+1):(size)], item_value[i] + knap_vector_prev[ (j-item_size[i] +1): (size-j) ])
          # knap_vector_current[ (j+1):(size)] = apply(next_values, 1, max)
          
          vec1 = knap_vector_current[ (j+1):(size)]
          vec2 = item_value[i] + knap_vector_prev[ (j-item_size[i] +1): (size-j) ]
          
          max_indices = which(vec2<vec1)
          vec2[max_indices] = vec1[max_indices]

          knap_vector_current[ (j+1):(size)] = vec2
          
        }
        break()
      }
    }
    i = i +1
    print(tail(knap_vector_current , 1))
    knap_vector_prev = knap_vector_current 
    
  }
  
  tail(knap_vector_current, 1)
}

## String DIstance

.actualMatch <- function(string1, string2, gap_score = 1, match_score = 0, sub_score = 1)
{
  
  l1 = length(string1) ;  l2 = length(string2)
  A <<- A + 1
  
  final_dist <- dist_matrix[l1 + 1, l2 + 1]
  matching <- match_matrix[l1 + 1, l2 + 1]
  
  if(!is.na(final_dist)) return(list(matching = matching, dist = final_dist))
  
  A1 <<-  A1 + 1
  if(l1 == 0 & l2 == 0) 
  {
    final_dist = 0
    matching = ""
    dist_matrix[l1 +1, l2+1] <<- final_dist
    match_matrix[l1 +1, l2+1] <<- matching
    return(list(matching = matching, dist = final_dist))
        
  }
  
  if(l1 == 0) 
  {
    final_dist = (l2)* gap_score
    matching = paste0(rep("G1", l2), collapse = "-")
    dist_matrix[l1 +1, l2+1] <<-final_dist
    match_matrix[l1 +1, l2+1] <<- matching
    return(list(matching = matching, dist = final_dist))
    
  }
  if(l2 == 0) 
  {
    final_dist = (l1) * gap_score
    matching = paste0(rep("G2", l1), collapse = "-")
    dist_matrix[l1 +1, l2+1] <<- final_dist
    match_matrix[l1 +1, l2+1] <<- matching
    return(list(matching = matching, dist = final_dist))
  }
  
  
  
  distances_list = list(.actualMatch(string1[-l1], string2, gap_score, match_score, sub_score), 
                        .actualMatch(string1[-l1], string2[-l2], gap_score, match_score, sub_score),
                        .actualMatch(string1, string2[-l2], gap_score, match_score, sub_score)
  )
  
  
  distances = c(distances_list[[1]]$dist + gap_score, 
                distances_list[[2]]$dist + as.numeric(!(string1[l1] == string2[l2]))*sub_score,
                distances_list[[3]]$dist + gap_score
                )
  
  min_dist_index = which.min(distances)
  final_dist = distances[min_dist_index]
  matching = distances_list[[min_dist_index]]$matching
  
  if(min_dist_index == 1) matching = paste0(c(matching, "G2"), collapse = "-")
  if(min_dist_index == 2) matching = paste0(c(matching, string2[l2]), collapse = "-")
  if(min_dist_index == 3) matching = paste0(c(matching, "G1"), collapse = "-")
  
  dist_matrix[l1 +1, l2+1] <<- final_dist
  match_matrix[l1 +1, l2+1] <<- matching
  
  return(list(matching = matching, dist = final_dist))
}

MatchVectors <- function(string1, string2, gap_score = 1, match_score = 0, sub_score = 1)
{
  dist_matrix <<- matrix(NA, length(string1) + 1, length(string2) +1)
  
  match_matrix <<- (matrix(list(), length(string1) + 1, length(string2) +1))
  
  
  output = .actualMatch(string1, string2, gap_score, match_score, sub_score)
  
}

ed <- function(x1, x2)
{
  sqrt(sum((x1 - x2)^2))
}

TST <- function(tspData)
{
  tspData$index = 1:nrow(tspData)
  full_dist <<- NULL
  
  distances = rep(Inf, nrow(tspData) - 1)
  i = 2
  for(i in 2:nrow(tspData))
  {
    print(i)
    distances[i-1] = TSP(tspData, i) + ed(tspData[1,], tspData[i,])
  }
  min(distances)
}

TSP <- function(tspData, i)
{
  id = paste(paste0(rownames(tspData), collapse = ""), i, sep = "_")
  
  min_dist = full_dist[id]
  if(is.null(min_dist)) min_dist = NA
  
  if(!is.na(min_dist)) return(min_dist)
  
  # print(id)
  
  if(nrow(tspData) == 2){
    
    min_dist = ed(tspData[1,], tspData[2,])
    full_dist[paste(paste0(rownames(tspData), collapse = ""), i, sep = "_")] <<- min_dist
    
    return(min_dist)
    
  }
  distances = rep(Inf, nrow(tspData))
  
  k = 2
  tspData_1 = tspData[-i,]
  for(k in 2:nrow(tspData_1) )
  {
    # print(tspData_1)
    # print(k)
    distances[k] = TSP(tspData_1, k) + ed(tspData[i,], tspData_1[k,])
  }
  
  min_dist = min(distances)
  full_dist[id] <<- min_dist
  
  min_dist
  
}