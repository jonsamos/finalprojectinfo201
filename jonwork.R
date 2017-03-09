library(ggplot2)
library(dplyr)
library(readr)
#load data sets

infant.mortality <- read.csv("infantmortality.csv")
under.five.mortality <- read.csv("infantmortality.csv")

#clean data sets
world <- map_data("world")
world <- mutate (world, ISO3 = iso.alpha(region, n = 3))
world <- world[world$region != "Antarctica",]
world <- left_join (world, cleaned.data, by = c("ISO3" = "countries.iso"))

selectInput("year", "Select a year for the map.", choices = "1990, 2000, 2010, 2015")

map <- ggplot() + 
       geom_map(data = world, map = world, aes(x = long, y = lat, map_id = region, fill = paste0("avg." , input$year))) +
       scale_fill_gradient(low = "green", high = "red")+
       theme(panel.background = element_rect(color = "black", fill = "white"))+
       labs (x = "", y = "") + 
       theme(axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank()) + 
       theme(axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank())

"Every day, twenty-one children under the age of five die each minute. Although this number has decreased 
by almost half since 1990, the world still has a long way to go in reducing the rate of child
mortality. However, two thirds of child deaths are preventable. By giving children vaccines, oral rehydration
therapy, and improved education in developing countries. Our goal is to bring awareness to child mortality
and what you can do to help stop it."

"This world map shows the child mortality rate per country in a given year. In 1990, some countries
had under five child deaths reach numbers as high as 332 per every 1000 children. However, 
as the year of the map gets closer to the present, one can see that child mortality overall
decreases by a substantial amount."

"These line graphs show the child mortality rates for females and males in a given country throughout
the last 25 years. Each country has a general trend of a decline in deaths from 1990 to 2015,
which could be caused by increased vaccinations and treatment for pneumonia, among other factors."

"While the child mortality rates have decreased tremendously in the last 25 years, there is more work 
to be done. Many of these deaths could be completely preventable if the family and community of these
children were given the proper resources. Organizations like World Vision and UNICEF seek to help end child mortality
by working with communities to improve the resources governments give to families and hoispitals, as well as
educating families  to be aware of the signs of diseases and how to prevent them altogether."
