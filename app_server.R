# server.R
library(dplyr)

source('./source/charts/chart_one.R')
source('./source/charts/chart_two.R')
source('./source/charts/chart_three.R')

# Harman

# Katherine

# Sabrina

# Start shinyServer
server <- function(input, output) { 
  # Harman
    output$chooseCountry <- renderUI({
      selectInput("County", "Select a Country", choices = selection_list)
    })
    
    distPlot <- reactive({
      country_input <- selection_list
      dis_Plot
    })
    
    output$pieChart <- renderPlot({
      distPlot()
    })
  
  # Katherine
  
  # Sabrina
}