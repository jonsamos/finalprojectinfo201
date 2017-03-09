source("server.R")

ui <- fluidPage(
  titlePanel("Child Mortality Rates"),
  h4("Every day, twenty-one children under the age of five die each minute. Although this number has decreased 
    by almost half since 1990, the world still has a long way to go in reducing the rate of child
    mortality. However, two thirds of child deaths are preventable. By giving children vaccines, oral rehydration
    therapy, and improved education in developing countries. Our goal is to bring awareness to child mortality
    and what you can do to help stop it."),
  
  
  #Random part  
  sidebarLayout(
    sidebarPanel(
      selectInput("gender","Gender", choices=list("Male", "Female")),
      selectInput("country2", "Country", choices=countries),
      selectInput("yearRandom", "Year", choices=list(1990,2000,2010,2015))
    ), mainPanel(
      p("This simulator will randomly generate, based on the probability of the information to the left, whether a child born will survive past the age of five."),
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
  plotOutput("dpt"),
  plotlyOutput("scatter3d")
)

shinyApp(ui,server, options=list(height=2000))