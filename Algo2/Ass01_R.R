
## This Script schedules jobs
jobsData = read.csv('C:/Users/Alex/Learning/Data/Algo2/jobs.txt', sep = "", header = F)[2:10001,]
names(jobsData) = c("weight", "length")
jobsData$greed = jobsData$weight - jobsData$length
jobsData$greed2 = jobsData$weight/jobsData$length
jobsData$weighted = jobsData$weight * jobsData$length

jobsData_ordered = jobsData[order(jobsData$greed, jobsData$weight, decreasing=T), ]

elapsed_time = weighted_elapsed_time = 0
for(i in 1:nrow(jobsData_ordered))
{
  end_time = elapsed_time + jobsData_ordered$length[i]
  elapsed_time = end_time
  weighted_elapsed_time = weighted_elapsed_time + (jobsData_ordered$weight[i] * elapsed_time)
}
elapsed_time
weighted_elapsed_time

jobsData_ordered2 = jobsData[order(jobsData$greed2, jobsData$weight, decreasing=T), ]

elapsed_time = weighted_elapsed_time = 0
for(i in 1:nrow(jobsData_ordered2))
{
  end_time = elapsed_time + jobsData_ordered2$length[i]
  elapsed_time = end_time
  weighted_elapsed_time = weighted_elapsed_time + (jobsData_ordered2$weight[i] * elapsed_time)
}
elapsed_time
weighted_elapsed_time