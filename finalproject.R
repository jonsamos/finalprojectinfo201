library(dplyr)

data <- read.csv("data/Sex-specific U5MR estimates-Table 1.csv",stringsAsFactors = FALSE)
countries <- unique(data$X[8:592])
countries.m <- list("m1990"=as.numeric(data$X.2[8:592][seq(2,584,3)]),"m2000"=data$X.3[8:592][seq(2,584,3)],"m2010"=data$X.4[8:592][seq(2,584,3)],"m2015"=data$X.5[8:592][seq(2,584,3)])
countries.f<- list("f1990"=as.numeric(data$X.6[8:592][seq(2,584,3)]),"f2000"=data$X.7[8:592][seq(2,584,3)],"f2010"=data$X.8[8:592][seq(2,584,3)],"f2015"=data$X.9[8:592][seq(2,584,3)])
countries.sexratio <- list("sexratio1990"=data$X.10[8:592][seq(2,584,3)],"sexratio2000"=data$X.11[8:592][seq(2,584,3)],"sexratio2010"=data$X.12[8:592][seq(2,584,3)],"sexratio2015"=data$X.13[8:592][seq(2,584,3)])
countries.iso <- data$Child.Mortality.Estimates[8:592][seq(2,584,3)]

cleaned.data <- data.frame(countries.iso,countries,countries.m,countries.f,countries.sexratio)
cleaned.data <- mutate(cleaned.data,avg.1990=((m1990+f1990)/2),avg.2000=((m2000+f2000)/2),avg.2010=((m2010+f2010)/2),avg.2015=((m2015+f2015)/2))

measles.data <- read.csv("measles/WHS8_110.csv")
cols <- colnames(measles.data)
measles.data <- measles.data[,cols[c(1,2,7,17,27)]]
colnames(measles.data)<- c("Country","2015","2010","2000","1990")
measles.data <- measles.data[2:195,]
