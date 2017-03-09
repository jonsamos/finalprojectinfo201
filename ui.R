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
  h6("These six scatter plots show the relationship between Measles/DPT vaccines and mortality rates in each country,
     faceted by the years 1990, 2000, and 2010. There is a general trend that shows that in countries that have higher
     vaccine rates, the mortality rate is lower, and countries with a lower vaccine rate have a higher mortality rate. The high 
     concentration of countries in the lower right hand corner of each graph could be developed countries, 
     where citizens are more likely to have access to these vaccines and other solutions to child mortality."),
  plotlyOutput("scatter3d"),
  h4("While child mortality rates have decreased tremendously in the last 25 years, there is more work 
     to be done. Many of these deaths could be completely preventable if the family and community of these
     children were given the proper resources. Organizations like World Vision and UNICEF seek to help end child mortality
     by working with communities to improve the resources governments give to families and hoispitals, as well as
     educating families  to be aware of the signs of diseases and how to prevent them altogether."
  )
  
)

shinyApp(ui,server, options=list(height=2000))