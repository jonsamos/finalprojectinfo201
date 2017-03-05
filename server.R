library(shiny)
source("finalproject.R")

server<- function(input,output){
  
  observeEvent(input$generate, {
    print(input$country2)
    rate <- cleaned.data[[paste0(input$gender, input$year)]][min(which(countries == input$country2))]
    output$result <- renderPrint(rate)
    random <- runif(1, 1, 1000)
    if (random > rate) {
      output$result <- renderPrint("Yes, you have survived past the age of five.")
    } else {
      output$result <- renderPrint("No, you have died before the age of five.")
    }
  })
}
