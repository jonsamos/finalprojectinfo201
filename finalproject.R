library(dplyr)

data <- read.csv("data/Sex-specific U5MR estimates-Table 1.csv")
colnames(data)
typeof(data)
countries <- unique(data$X[8:592])
countries
data$X.6
countries.male <- list("1990"=data$X.2[8:592],"2000"=data$X.3[8:592],"2010"=data$X.3[8:592],"2015"=data$X.3[8:592])
countries.femmale<- list("1990"=data$X.6[8:592],"2000"=data$X.7[8:592],"2010"=data$X.8[8:592],"2015"=data$X.9[8:592])
countries.sexratio <- list("1990"=data$X.10[8:592],"2000"=data$X.11[8:592],"2010"=data$X.12[8:592],"2015"=data$X.13[8:592])
unique(data$X[8:592])
countries.lower.male <- c(data$X.2[8:592][seq(1,584,3)],data$X.3[8:592][seq(1,584,3)],data$X.4[8:592])
k <- c(1,2,3,4,5)
k[seq(1,6,2)]
typeof(countries.male["1990"])
countries.male$"1990"
