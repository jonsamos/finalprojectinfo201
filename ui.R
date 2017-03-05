source("server.R")

ui <- fluidPage(
  titlePanel("Child Mortality Rates"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("country","Country", choices=countries)
    ),
    mainPanel()
  ),
  
  #Random part  
  
  
  selectInput("gender","Gender", choices=list("male", "female")),
  selectInput("country2","Country", choices=countries),
  selectInput("year","Year", choices=list(1990,2000,2010,2015)),
  actionButton("generate", "Will you live past the age of five?"),
  textOutput("result")
 
)

shinyApp(ui,server)