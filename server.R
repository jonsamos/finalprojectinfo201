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
  output$plot1 <- renderPlotly({
    plot_ly(selectedData(),x=year,type="scatter",y=male.data,name="Male",mode="lines+Markers")%>%
      add_trace(y= ~female.data,name="Female")%>%
      layout(title="Male and Female U5 Mortality Rate",
             xaxis=list(title="Year"),
             yaxis=list(title="Mortality Rates"))
  })
}