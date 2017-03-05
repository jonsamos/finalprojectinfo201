library(ggplot2)
library(dplyr)
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

