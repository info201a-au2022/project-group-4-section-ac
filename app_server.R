# server.R
library(tidyverse)
library(shiny)

source("source/charts/chart_one.R")
source("source/charts/chart_two.R")
source("source/charts/chart_three.R")

###############################################################################
## CHART 2
###############################################################################

new_choices <- medals_over_years %>%
  group_by(country_3_letter_code) %>%
  summarize(cumul_medals = sum(total_medals)) %>%
  arrange(desc(cumul_medals)) %>%
  head(5) %>%
  pull(country_3_letter_code)

###############################################################################
## SUMMARY
###############################################################################
most_medals <- medals_over_years %>%
  group_by(country_3_letter_code) %>%
  summarize(cumul_medals = sum(total_medals)) %>%
  arrange(desc(cumul_medals)) %>%
  head(1) %>%
  pull(country_3_letter_code)

# Start shinyServer
server <- function(input, output) {
  #############################################################################
  ## CHART 1
  #############################################################################
  output$Plot <- renderPlot({
    return(build_bar(input$gender))
  })
  
  #############################################################################
  ## CHART 2
  #############################################################################
  output$lineGraph <- renderPlot({
    return(shiny_line(input$countries))
  })
  
  output$countryChoices <- renderUI({
    checkboxGroupInput("countries", 
                       label = "Select Countries to Display",
                       choiceNames = new_choices, 
                       choiceValues = new_choices,
                       selected = new_choices)
  })
  
  #############################################################################
  ## CHART 3
  #############################################################################
  output$chooseCountry <- renderUI({
    selection_list <- olympic_volleyball_medals %>%
      select(country_name)
    selectInput("County", "Select a Country", choices = selection_list)
  })

  output$pieChart <- renderPlot({
    return(shiny_pie(input$County))
  })
  
  #############################################################################
  ## SUMMARY
  #############################################################################
  output$mostMedals <- renderText(most_medals)
}