## This contains all the functions for the Assignments

#### Ass03 ####
# Binary Search Tree


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