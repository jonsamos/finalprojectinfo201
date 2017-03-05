source("server.R")

ui <- fluidPage(
  titlePanel("Child Mortality Rates")
  
  sidebarLayout(
    sidebarPanel(
      selectInput("country","Country",)
    )
  )
  
)

shinyApp(ui,server)