source("server.R")


ui <- fluidPage(
  titlePanel("Child Mortality Rates"),
  sidebarLayout(
    sidebarPanel(
      selectInput("country","Country",cleaned.data$countries)
    ),
    mainPanel(
      plotlyOutput("plot1")
    )
  )
)

shinyApp(ui,server)