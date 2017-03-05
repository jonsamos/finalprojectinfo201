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

map <- ggplot() + 
       geom_map(data = world, map = world, aes(x = long, y = lat, map_id = region, fill = avg.1990))

