# server.R
library(dplyr)

source("source/charts/chart_one.R")
source("chart_two.R")
source("chart_three.R")

# Harman
<<<<<<< HEAD

# Katherine
=======
olympic_medals <- read.csv("../../data/olympic_medals.csv")

olympic_volleyball_medals <- olympic_medals %>%
  filter((discipline_title == "Volleyball") | (discipline_title == "Beach Volleyball")) %>%
  select(discipline_title, slug_game, event_gender, medal_type, participant_title, country_name, country_3_letter_code)
>>>>>>> 7680ea13afe3675bb3dfd77a9237d00899d28848

# Sabrina

# value --- which country has earned the most medals
most_medals <- medals_over_years %>%
  group_by(country_3_letter_code) %>%
  summarize(cumul_medals = sum(total_medals)) %>%
  arrange(desc(cumul_medals)) %>%
  head(1) %>%
  pull(country_3_letter_code)

# Start shinyServer
server <- function(input, output) {
  # Harman
  output$chooseCountry <- renderUI({
    selection_list <- olympic_volleyball_medals %>%
      select(country_name)
    selectInput("County", "Select a Country", choices = selection_list)
  })

  output$pieChart <- renderPlot({
    return(shiny_pie(input$County))
  })

  # Katherine
  output$Plot <- renderPlot({
    return(build_bar(input$gender))
  })

  # Sabrina
  output$mostMedals <- renderText(most_medals)
  
  output$countryCheck <- renderPlot({
    country_df <- medals_over_years %>%
      filter(country_3_letter_code %in% input$ctryChoices)
    f <- ggplot(
      data = country_df, 
            aes(x = year_oly, y = total_medals, group = input$ctryChoices),
            na.rm = TRUE) +
      labs(title = "Medals Earned each Olympic Games") +
      geom_line(aes(color = input$ctryChoice)) +
      geom_point() +
      labs(
        x = "Year",
        y = "Medals Earned",
        title = "Medals Earned each Olympic Games"
      )
    return(f)
  })
  # geom_line(aes(color = country_3_letter_code)) +

  output$ctryChoices <- renderUI({
    new_choices <- medals_over_years %>%
      group_by(country_3_letter_code) %>%
      summarize(cumul_medals = sum(total_medals)) %>%
      arrange(desc(cumul_medals)) %>%
      head(5) %>%
      pull(country_3_letter_code)
    checkboxGroupInput("countryCheck", label = "Countries",
                       choices = new_choices, selected = new_choices)
  })
}