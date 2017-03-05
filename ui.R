source("server.R")


ui <- fluidPage(
  titlePanel("Child Mortality Rates"),

  #Random part  
  
  selectInput("gender","Gender", choices=list("male", "female")),
  selectInput("country2","Country", choices=countries),
  selectInput("yearRandom","Year", choices=list(1990,2000,2010,2015)),
  actionButton("generate", "Will you live past the age of five?"),
  textOutput("result"),
  
  
 
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

shinyApp(ui,server, options=list(height=1080))