library("stringr")
library("plyr")
options(stringsAsFactors = F)
file_list = list.files("/media/alex/Backups/Alex_backup/WorldHistoryCourse/")


fileNames_order = read.csv("/home/alex/Desktop/WorldHistory.csv")

i = 5
list_to_rename = ldply(1:nrow(fileNames_order), function(i){
  print(i)
  tolower(file_list)
  tolower(fileNames_order$Order[i])
  
  order_match = str_detect(tolower(file_list), tolower(fileNames_order$Order[i]))
  renamed_files = paste(formatC(i, width = 2, flag = '0'), file_list[order_match], sep = "_")
  
  original_name = file_list[order_match]
  if(length(original_name) == 0) original_name = ""
  data.frame(original_name = original_name, renamed_files, fileNames_order$Order[i])
  
})

file.rename(paste0("/media/alex/Backups/Alex_backup/WorldHistoryCourse/", list_to_rename$original_name), paste0("/media/alex/Backups/Alex_backup/WorldHistoryCourse/", list_to_rename$renamed_files))

for(i in 1:nrow(list_to_rename)){
  original_name = paste0("/media/alex/Backups/Alex_backup/WorldHistoryCourse/", list_to_rename$original_name[i])
  new_name = paste0("/media/alex/Backups/Alex_backup/WorldHistoryCourse/", list_to_rename$renamed_files[i])
  file.rename(original_name, new_name)
}