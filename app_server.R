# server.R
library(dplyr)

source("source/charts/chart_one.R")
source("chart_two.R")
source("chart_three.R")

# Harman

# Katherine

# Sabrina

# value --- which country has earned the most medals
most_medals <- medals_over_years %>%
  group_by(country_3_letter_code) %>%
  summarize(cumul_medals = sum(total_medals)) %>%
  arrange(desc(cumul_medals)) %>%
  head(1) %>%
  pull(country_3_letter_code)

# ctry_choices <- medals_over_years %>% pull(country_3_letter_code) %>%  unique()

ctry_choices <- medals_over_years %>%
  group_by(country_3_letter_code) %>%
  summarize(cumul_medals = sum(total_medals)) %>%
  arrange(desc(cumul_medals)) %>%
  head(5) %>%
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
  output$countryCheck <- renderPlotly({
    country_df <- medals_over_years %>%
      filter(country_3_letter_code %in% input$countryCheck)
    f <- ggplot(
      data = country_df, aes(
        x = year_oly, y = total_medals,
        group = 1
      ),
      na.rm = TRUE
    ) +
      geom_line(aes(color = country_3_letter_code))
    labs(title = "Medals Earned each Olympic Games") +
      xlab("Year") + ylab("Medals Earned")
    return(f)
  })

  output$ctryChoices <- renderUI({
    choices <- medals_over_years %>%
      group_by(country_3_letter_code) %>%
      summarize(cumul_medals = sum(total_medals)) %>%
      arrange(desc(cumul_medals)) %>%
      head(5) %>%
      pull(country_3_letter_code)
    checkboxGroupInput("countryCheck", label = h4("Country"),
                       choices = ctry_choices, selected = ctry_choices)
  })
}