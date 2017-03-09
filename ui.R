source("server.R")

ui <- fluidPage(
  titlePanel("Child Mortality Rates"),
  h4("Every day, twenty-one children under the age of five die each minute. Although this number has decreased 
    by almost half since 1990, the world still has a long way to go in reducing the rate of child
    mortality. However, two thirds of child deaths are preventable. By giving children vaccines, oral rehydration
    therapy, and improved education in developing countries. Our goal is to bring awareness to child mortality
    and what you can do to help prevent the deaths of children throughout the world."),
  
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
  h5("This world map shows the child mortality rate per country in a given year. In 1990, some countries
     had under five child deaths reach numbers as high as 332 per every 1000 children. However, 
     as the year of the map gets closer to the present, one can see that child mortality overall
     decreases by a substantial amount."),
  sidebarLayout(
    sidebarPanel(
      selectInput("country","Country",cleaned.data$countries)
    ),
    mainPanel(
      plotlyOutput("plot1"),
      h5("This line graph shows the child mortality rates for females and males in a given country throughout
         the last 25 years. Each country has a general trend of a decline in deaths from 1990 to 2015,
         which could be caused by increased vaccinations and treatment for pneumonia, among other factors.")
    )
  ),
  
  
  plotOutput("measles"),
  plotOutput("dpt"),
  plotlyOutput("scatter3d")
)

shinyApp(ui,server, options=list(height=2000))