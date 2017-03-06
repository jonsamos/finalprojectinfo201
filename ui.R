source("server.R")

ui <- fluidPage(
  titlePanel("Child Mortality Rates"),

  
  
  #Random part  
  sidebarLayout(
    sidebarPanel(
      selectInput("gender","Gender", choices=list("male", "female")),
      selectInput("country2", "Country", choices=countries),
      selectInput("yearRandom", "Year", choices=list(1990,2000,2010,2015))
    ), mainPanel(
      actionButton("generate", "Will you live past the age of five?"),
      textOutput("result")
    )
    
  ),
  
  selectInput("year", "Select a year for the map.", choices = c("1990", "2000", "2010", "2015"), selected = "1990"),
  plotOutput ("map"),
  sidebarLayout(
    sidebarPanel(
      selectInput("country","Country",cleaned.data$countries)
    ),
    mainPanel(
      plotlyOutput("plot1")
    )
  ),
  
  
  plotOutput("measles"),
  plotOutput("dpt")
)

shinyApp(ui,server, options=list(height=2000))