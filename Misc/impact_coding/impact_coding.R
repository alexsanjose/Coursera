# June 2012
incidents = read.table("Sfpd_Incident_Last_Month.csv", header=T, sep=",", 
                       as.is=T)

# violent - LARCENY/THEFT: 
#           -- Descript = "GRAND THEFT PURSESNATCH" 
#                         "ATTEMPTED GRAND THEFT PURSESNATCH"
#           ASSAULT
#           ROBBERY
#           SEX OFFENCES, FORCIBLE
#           KIDNAPPING


# Create violent indicator
incidents$violent = with(incidents, 
                         Category %in% c("ASSAULT", "ROBBERY", 
                                         "SEX OFFENSES, FORCIBLE", "KIDNAPPING") 
                         | Descript %in% 
                           c("GRAND THEFT PURSESNATCH", 
                             "ATTEMPTED GRAND THEFT PURSESNATCH"))

table(incidents$violent)/length(incidents$violent)
# FALSE      TRUE 
# 0.8733564 0.1266436