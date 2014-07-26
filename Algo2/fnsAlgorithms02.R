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