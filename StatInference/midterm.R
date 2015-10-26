library("dplyr")
library("ggplot2")

# Ex 1

mean = 9.51
SD = 4.65
n = 40
Ho = 10

SE = SD/sqrt(n)

Z = (Ho - mean)/SE

pnorm(Z)
pnorm(1.96)
