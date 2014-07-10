
library("plyr")
## This Script implements Prims
primsData = read.csv('C:/Users/Alex/Learning/Data/Algo2/Ass01/edges.txt', sep = "", header = F)
names(primsData) = c("start", "end", "weight")
graphData = primsData[2:2185,]

graphData_full = rbind(graphData, data.frame(start = graphData[,2], end = graphData[,1], weight = graphData$weight) )
graphData_full = graphData
all_vertices = unique(graphData_full$start)
all_vertices = 1:500
in_vertices = data.frame(start = 500, acc_weight = 0)
out_vertices = setdiff(all_vertices, in_vertices$start)
i = 1

for(i in 1:499)
{
  current_boundary = subset(graphData_full, (graphData_full$start %in% in_vertices$start & graphData_full$end %in% out_vertices) |
                              (graphData_full$end %in% in_vertices$start & graphData_full$start %in% out_vertices) )
  current_boundary_weights = merge(current_boundary, in_vertices)
  current_boundary_weights$total = current_boundary_weights$weight + current_boundary_weights$acc_weight
  min_index = which.min(current_boundary_weights$total)
  in_vertices = rbind(in_vertices, c(current_boundary_weights$end[min_index], current_boundary_weights$total[min_index]))
  out_vertices = setdiff(all_vertices, in_vertices$start)
  
}
