library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)

source("finalproject.R")


server<- function(input,output){
  selectedData <- reactive({
    year <- c("1990","2000","2010","2015")
    country.specific<-filter(cleaned.data,countries==input$country)
    male.data <- c(country.specific$"male1990",country.specific$"male2000",country.specific$"male2010",country.specific$"male2015")
    female.data <- c(country.specific$"female1990",country.specific$"female2000",country.specific$'female2010',country.specific$"female2015")
    return(data.frame(year,male.data,female.data))
  })
  
  mapData <- reactive ({
    world <- map_data("world")
    world <- mutate (world, ISO3 = iso.alpha(region, n = 3))
    world <- world[world$region != "Antarctica",]
    cleaned.data <- cleaned.data[ ,c("countries.iso", "countries", input$year)]
    world <- left_join (world, cleaned.data, by = c("ISO3" = "countries.iso"))
    return(world)
  })
  
  output$map <- renderPlot ({
  ggplot() + 
      geom_map(data = world, map = world, aes_string(x = "long", y = "lat", map_id = "region", fill = input$year)) +
      scale_fill_gradient(low = "green", high = "red")+
      theme(panel.background = element_rect(color = "black", fill = "white"))+
      labs (x = "", y = "") + 
      theme(axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank()) + 
      theme(axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank())
    
  })
  output$plot1 <- renderPlotly({
    plot_ly(selectedData(),x=year,type="scatter",y=male.data,name="Male",mode="lines+Markers")%>%
      add_trace(y= ~female.data,name="Female")%>%
      layout(title="Male and Female U5 Mortality Rate",
             xaxis=list(title="Year"),
             yaxis=list(title="Mortality Rates"))
  })
  
  
}