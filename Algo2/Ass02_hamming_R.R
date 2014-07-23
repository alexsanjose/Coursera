## This Script implements Max space K clustering

clusterData = read.table("../Data/Algo2/Ass02/clustering_big.txt", sep = " ", skip=1)
clusterData$V25 = NULL
clusterData$V25 = apply(clusterData, 1, sum)
clusterData = unique(clusterData)

plot(sort(clusterData$V25))
# clusterData = read.table("../Data/Algo2/Ass02/testCase1.txt", sep = " ", skip=1)

clusterData = clusterData[order(clusterData$V3),]

nodes = unique(c(clusterData$V1, clusterData$V2))

head_data = rep(1:length(nodes))
i = 1

# while(length(unique(head_data)) >= 5)
repeat
{
  start_node = clusterData$V1[i]
  end_node = clusterData$V2[i]
  
  start_head = head_data[start_node]
  end_head = head_data[end_node]
  
  if(length(unique(head_data)) < 5 & start_head != end_head) break
    
  if(start_head != end_head) 
    head_data[head_data == end_head] = start_head
  
#   print(i)
  if(!(i %% 10000)) print(i)
  i = i+1
  
}

print(clusterData$V3[i])

