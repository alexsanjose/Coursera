library("dplyr")
library("ggplot2")
library(randomForest)

temp = read.csv("../Data/temp_measurement/temo.csv")
names(temp) = str_replace_all(names(temp), pattern = "\\.", replacement = "")
str(temp)

temp_temp = temp[1:200, c(3, 6:14)] %>% na.omit()

temp_new = temp[201:317, c(3, 6:14)] %>% na.omit()
A = randomForest::randomForest(y = temp_temp$CorebodytemperatureC ,
                               x = temp_temp %>% select(-CorebodytemperatureC)%>% as.matrix() )

temp_new$prediction = predict(A, temp_new %>% select(-CorebodytemperatureC)%>% as.matrix())

ggplot(temp, aes(x = CorebodytemperatureC, y = Pulseratebpm)) + geom_point() + 
  geom_smooth()

ggplot(temp, aes(x = CorebodytemperatureC, y = AmbientTemerature)) + geom_point() + 
  geom_smooth()

?predict
?randomForest
summary(A)


sqrt(sum(   (temp_new$CorebodytemperatureC - mean(temp_new$CorebodytemperatureC))^2))
sqrt(sum(   (temp_new$CorebodytemperatureC - temp_new$prediction)^2))

