library(dplyr)

data <- read.csv("data/Sex-specific U5MR estimates-Table 1.csv",stringsAsFactors = FALSE)
countries <- unique(data$X[8:592])
countries.male <- list("male1990"=as.numeric(data$X.2[8:592][seq(2,584,3)]),"male2000"=data$X.3[8:592][seq(2,584,3)],"male2010"=data$X.3[8:592][seq(2,584,3)],"male2015"=data$X.3[8:592][seq(2,584,3)])
countries.female<- list("female1990"=as.numeric(data$X.6[8:592][seq(2,584,3)]),"female2000"=data$X.7[8:592][seq(2,584,3)],"female2010"=data$X.8[8:592][seq(2,584,3)],"female2015"=data$X.9[8:592][seq(2,584,3)])
countries.sexratio <- list("sexratio1990"=data$X.10[8:592][seq(2,584,3)],"sexratio2000"=data$X.11[8:592][seq(2,584,3)],"sexratio2010"=data$X.12[8:592][seq(2,584,3)],"sexratio2015"=data$X.13[8:592][seq(2,584,3)])
countries.iso <- data$Child.Mortality.Estimates[8:592][seq(2,584,3)]

cleaned.data <- data.frame(countries.iso,countries,countries.male,countries.female,countries.sexratio)
cleaned.data <- mutate(cleaned.data,avg.1990=((male1990+female1990)/2),avg.2000=((male2000+female2000)/2),avg.2010=((male2010+female2010)/2),avg.2015=((male2015+female2015)/2))


