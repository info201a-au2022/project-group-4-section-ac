# server.R
library(shiny)
library(ggplot2)
library(plotly)
library(tidyverse)

olympic_medals <- read.csv("data/olympic_medals.csv")

###############################################################################
## CHART 1
###############################################################################

olympic_volleyball_medals <- olympic_medals %>% 
  filter((discipline_title == "Volleyball") | (discipline_title == "Beach Volleyball")) %>% 
  # only get columns that we for sure need
  select(discipline_title, event_gender, country_name, country_3_letter_code)

# FILTER DATA
# need: 
#    country (name and code) versus number of medals (num of rows)
# for interaction: 
#    how many are for M v. F AND how many are for indoor v. beach volleyball

num_medals_per_country <- olympic_volleyball_medals %>% 
  # group by country code
  group_by(country_3_letter_code) %>% 
  # add cumulative medal row since each row represents 1 medal right now
  mutate(num_medals = 1)

# basic needs
cummulative_medals_per_country <- num_medals_per_country %>% 
  # group by country code
  group_by(country_3_letter_code) %>% 
  # compute cumulative medal row from num_medals row
  summarize(cummulative_medals = sum(num_medals))

# add MF data
cummulative_medals_Men <- num_medals_per_country %>% 
  # only look at Males
  filter(event_gender == "Men") %>% 
  # group by country code
  group_by(country_3_letter_code) %>% 
  # compute cumulative medal row for Males from num_medals row
  summarize(cummulative_medals_Men = sum(num_medals))

cummulative_medals_Women <- num_medals_per_country %>% 
  # only look at Women
  filter(event_gender == "Women") %>% 
  # group by country code
  group_by(country_3_letter_code) %>% 
  # compute cumulative medal row for Women from num_medals row
  summarize(cummulative_medals_Women = sum(num_medals))

cummulative_medals_per_country_MW <- 
  full_join(cummulative_medals_Men, cummulative_medals_Women, by = "country_3_letter_code")

# add indoor/beach volleyball data
cummulative_medals_Indoor <- num_medals_per_country %>% 
  # only look at indoor
  filter(discipline_title == "Volleyball") %>% 
  # group by country code
  group_by(country_3_letter_code) %>% 
  # compute cumulative medal row for indoor from num_medals row
  summarize(cummulative_medals_Indoor = sum(num_medals))

cummulative_medals_Beach <- num_medals_per_country %>% 
  # only look at beach
  filter(discipline_title == "Beach Volleyball") %>% 
  # group by country code
  group_by(country_3_letter_code) %>% 
  # compute cumulative medal row for indoor from num_medals row
  summarize(cummulative_medals_Beach = sum(num_medals))

cummulative_medals_per_country_IB <- 
  full_join(cummulative_medals_Indoor, cummulative_medals_Beach, by = "country_3_letter_code")

# join all and filter to cumulative rows, country names, country codes
cummulative_medals_all_data <- cummulative_medals_per_country %>% 
  inner_join(cummulative_medals_per_country_MW, by = "country_3_letter_code") %>%
  inner_join(cummulative_medals_per_country_IB, by = "country_3_letter_code")

# for the shiny app
build_bar <- function(gender.var) {
  if (gender.var == "all") {
    g <- ggplot(data = cummulative_medals_all_data, aes(x = country_3_letter_code, y = cummulative_medals), na.rm = TRUE) +
      geom_bar(stat="identity", width=0.5) + 
      labs(x = "Countries", y = "Total Olympic Volleyball Medals Won", title = "Total Number of Olympic Volleyball Medals Ever Won by Each Country")
    return(g)
  } else if (gender.var == "women") {
    g <- ggplot(data = cummulative_medals_Women, aes(x = country_3_letter_code, y = cummulative_medals_Women), na.rm = TRUE) +
      geom_bar(stat="identity", width=0.5) + 
      labs(x = "Countries", y = "Total Olympic Volleyball Medals Won", title = "Total Number of Olympic Volleyball Medals Ever Won by Each Country")
    return(g)
  } else {
    g <- ggplot(data = cummulative_medals_Men, aes(x = country_3_letter_code, y = cummulative_medals_Men), na.rm = TRUE) +
      geom_bar(stat="identity", width=0.5) + 
      labs(x = "Countries", y = "Total Olympic Volleyball Medals Won", title = "Total Number of Olympic Volleyball Medals Ever Won by Each Country")
    return(g)
  }
}

###############################################################################
## CHART 2
###############################################################################
# dataframe for discipline, year, gender, medal type, participant,
# country name, and country code
olympic_volleyball_medals2 <- olympic_medals %>%
  filter((discipline_title == "Volleyball") |
           (discipline_title == "Beach Volleyball")) %>%
  select(
    discipline_title, slug_game, event_gender, medal_type,
    participant_title, country_name, country_3_letter_code
  )

# filters for year, country code, and medals won that year
medals_over_years <- olympic_volleyball_medals2 %>%
  # takes which olympics ang country code
  select(slug_game, country_3_letter_code) %>%
  # creates year won only
  mutate(year_oly = str_sub(slug_game, -4)) %>%
  # remove location of olympics
  select(-slug_game) %>%
  # create column for each medal won
  mutate(medals_per_year = 1) %>%
  # grouping by year and medals won in that year
  group_by(country_3_letter_code, year_oly) %>%
  summarize(total_medals = sum(medals_per_year))

# dataframe for only one country USA
chosen_country <- medals_over_years %>%
  filter(country_3_letter_code == "USA")

# Shiny Stuff :)
shiny_line <- function(countries.var) {
  country_df <- medals_over_years %>%
    filter(country_3_letter_code %in% countries.var)
  
  shiny_f <- ggplot(
    data = country_df,
    aes(x = year_oly, y = total_medals, group=country_3_letter_code),
    na.rm = TRUE) +
    geom_line(aes(color = country_3_letter_code)) +
    geom_point(aes(color = country_3_letter_code)) +
    labs(x = "Year", y = "Medals Earned",
         title = "Medals Earned each Olympic Games")
  return(shiny_f)
}

new_choices <- medals_over_years %>%
  group_by(country_3_letter_code) %>%
  summarize(cumul_medals = sum(total_medals)) %>%
  arrange(desc(cumul_medals)) %>%
  head(5) %>%
  pull(country_3_letter_code)

###############################################################################
## CHART 3
###############################################################################
olympic_volleyball_medals3 <- olympic_medals %>% 
  filter((discipline_title == "Volleyball") | (discipline_title == "Beach Volleyball")) %>% 
  select(discipline_title, slug_game, event_gender, medal_type, participant_title, country_name, country_3_letter_code)

# Filter Data
# Need just G, S, B metals and the countries
# Get a specific country's row

shiny_pie <- function(country.var) {
  pi_chart_data <- olympic_volleyball_medals3 %>% 
    select(country_name, medal_type) %>% 
    filter(country_name %in% country.var)
  
  
  num_gold <- sum(str_count(pi_chart_data$medal_type, "GOLD"))
  num_silver <- sum(str_count(pi_chart_data$medal_type, "SILVER"))
  num_bronze <- sum(str_count(pi_chart_data$medal_type, "BRONZE"))
  
  Medal_Type = c("Gold", "Silver", "Bronze")
  Medal_Count = c(num_gold, num_silver, num_bronze)
  
  plot_data <- data.frame(Medal_Type, Medal_Count)
  
  plot <- ggplot(plot_data, aes(x = "", y = Medal_Count, fill = Medal_Type)) +
    geom_bar(stat="identity", width = 1, size = 1) +
    coord_polar("y", start = 0) +
    geom_text(aes(label = ifelse(Medal_Count > 0, Medal_Count, "")),
              position = position_stack(vjust = 0.5)) +
    labs(title = paste(country.var, "'s Medals in Volleyball")) +
    scale_fill_manual(values = c("#663300", "#ffff33", "grey")) +
    theme_void()
  
  return(plot)
}

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
  output$plot <- renderPlot({
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
    selection_list <- olympic_volleyball_medals3 %>%
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