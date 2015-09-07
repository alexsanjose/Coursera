library(dplyr)
# June 2012
incidents = read.table("../Data/Internet/ImpactCoding/SFPD_Incidents_-_from_1_January_2003.csv", header=T, sep=",", 
                       as.is=T)

head(incidents)
incidents$PdDistrict %>% table
# Create violent indicator
incidents$violent = with(incidents, Category %in% c("ASSAULT", "ROBBERY", "SEX OFFENSES, FORCIBLE", "KIDNAPPING") 
                         | Descript %in% c("GRAND THEFT PURSESNATCH", "ATTEMPTED GRAND THEFT PURSESNATCH"))

table(incidents$violent)/length(incidents$violent)
# FALSE      TRUE 
# 0.8733564 0.1266436