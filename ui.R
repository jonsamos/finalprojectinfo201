source("server.R")

ui <- fluidPage(
  titlePanel("Child Mortality Rates"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("country","Country", choices=countries)
    )
  )
)



shinyApp(ui,server)