source("server.R")


ui <- fluidPage(
  titlePanel("Child Mortality Rates"),
  selectInput("year", "Select a year for the map.", choices = c("avg.1990", "avg.2000", "avg.2010", "avg.2015"), selected = "avg.1990"),
  plotOutput ("map"),
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