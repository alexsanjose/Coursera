library("dplyr")
library("ggplot2")

# Ex 1
load(url("http://www.openintro.org/stat/data/ames.RData"))
head(ames)

area = ames$Gr.Liv.Area
price = ames$SalePrice

ames_new = ames %>% select(area = Gr.Liv.Area, price = SalePrice)
summary(ames_new$area)

ggplot(ames_new, aes(x = area)) + geom_histogram() + geom_vline(aes(xintercept = 1500))

samp0 <- sample(ames_new$area, 50)

# Ex2
population <- ames$Gr.Liv.Area
size = 6

samp <- sample(population, size)
sample_mean <- mean(samp)

se <- sd(samp)/sqrt(size)
lower <- sample_mean - 1.96 * se
upper <- sample_mean + 1.96 * se
c(lower, upper)
mean(population)
