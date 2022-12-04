# server.R
library(dplyr)

source("source/charts/chart_one.R")
source("chart_two.R")
source("chart_three.R")

# Harman
olympic_medals <- read.csv("../../data/olympic_medals.csv")

olympic_volleyball_medals <- olympic_medals %>%
  filter((discipline_title == "Volleyball") | (discipline_title == "Beach Volleyball")) %>%
  select(discipline_title, slug_game, event_gender, medal_type, participant_title, country_name, country_3_letter_code)


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

  distPlot <- reactive({
    country_input <- input$selection_list

  pi_chart_data <- olympic_volleyball_medals %>%
    select(country_name, medal_type) %>%
    filter(country_name == country_input)

  num_gold <- sum(str_count(pi_chart_data$medal_type, "GOLD"))
  num_silver <- sum(str_count(pi_chart_data$medal_type, "SILVER"))
  num_bronze <- sum(str_count(pi_chart_data$medal_type, "BRONZE"))

  Medal_Type = c("Gold", "Silver", "Bronze")
  Medal_Count = c(num_gold, num_silver, num_bronze)

  plot_data <- data.frame(Medal_Type, Medal_Count)

  # Try to create ggplot
  ggplot(plot_data, aes(x = "", y = Medal_Count, fill = Medal_Type)) +
    geom_bar(stat="identity", width = 1, size = 1) +
    coord_polar("y", start = 0) +
    geom_text(aes(label = ifelse(Medal_Count > 0, Medal_Count, "")),
              position = position_stack(vjust = 0.5)) +
    labs(title = paste(country_input, "'s Medals in Volleyball"),
         caption = paste("Pie chart representing the amount of each medals ",
                         country_input, " has ever earned.")) +
    scale_fill_manual(values = c("#663300", "#ffff33", "grey")) +


    # Change Later
    theme_void()
  })

  output$pieChart <- renderPlot({
    distPlot()
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