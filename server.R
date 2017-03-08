library(shiny)
source("finalproject.R")

library(dplyr)
library(ggplot2)
library(plotly)
library(maps)


server<- function(input,output){
  selectedData <- reactive({
    year <- c("1990","2000","2010","2015")
    country.specific<-filter(cleaned.data,countries==input$country)
    m.data <- c(country.specific$"m1990",country.specific$"m2000",country.specific$"m2010",country.specific$"m2015")
    f.data <- c(country.specific$"f1990",country.specific$"f2000",country.specific$'f2010',country.specific$"f2015")
    return(data.frame(year,m.data,f.data))
  })
  
  mapData <- reactive ({
    world <- map_data("world")
    world <- mutate (world, ISO3 = iso.alpha(region, n = 3))
    world <- world[world$region != "Antarctica",]
    world <- left_join (world, cleaned.data, by = c("ISO3" = "countries.iso"))
    return(world)
  })
  
  output$map <- renderPlot ({
  ggplot() + 
      geom_map(data=mapData(), map=mapData(), aes_string(x = "long", y = "lat", map_id="region", fill=paste0("avg.", input$year))) +
      scale_fill_gradient2(low = "green", mid="yellow", high = "red", na.value="white",limits=c(0,332))+
      theme(panel.background = element_rect(color = "black", fill = "white"))+
      labs (x = "", y = "") + 
      theme(axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank()) + 
      theme(axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank())
    
  })
  output$plot1 <- renderPlotly({
    plot_ly(selectedData(),x=selectedData()$year,type="scatter",y=selectedData()$m.data,name="Male",mode="lines+Markers")%>%
      add_trace(y=selectedData()$f.data,name="Female")%>%
      layout(title="Male and Female U5 Mortality Rate",
             xaxis=list(title="Year"),
             yaxis=list(title="Mortality Rates"))
  })
  
  
  observeEvent(input$generate, {
    gender <- input$gender %>% tolower() %>% substr(1, 1)
    rate <- cleaned.data[[paste0(gender, input$yearRandom)]][min(which(countries == input$country2))]
    output$result <- renderPrint(rate)
    random <- runif(1, 1, 1000)
    if (random > rate) {
      output$result <- renderText("Yes, you have survived past the age of five.")
    } else {
      output$result <- renderText("No, you have died before the age of five.")
    }
  })
  
  output$measles <- renderPlot({
    measles <- ggplot(data=measles.mort, mapping=aes(x=measles, y=mort)) + geom_point() + facet_wrap(~year) + geom_smooth()
    return(measles)
  })
  output$dpt <- renderPlot({
    dpt <- ggplot(data=dpt.mort, mapping=aes(x=dpt, y=mort)) + geom_point() + facet_wrap(~year) + geom_smooth()
    return(dpt)
  })
}
