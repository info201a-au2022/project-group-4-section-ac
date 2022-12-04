# BAR GRAPH

# Load packages
library(tidyverse)
library(ggplot2)
library("lintr")

# Remember: if not working, do the following in your top bar in RStudios...
#           [Session -> Set Working Directory -> To Source File Location]
setwd("~/Documents/info201/project-group-4-section-ac/source/charts")
olympic_medals <- read.csv("../../data/olympic_medals.csv")

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

# Try to create ggplot barplot

g <- ggplot(data = cummulative_medals_all_data, aes(x = country_3_letter_code, y = cummulative_medals), na.rm = TRUE) +
  geom_bar(stat="identity", width=0.5) + 
  labs(x = "Countries", y = "Total Olympic Volleyball Medals Won", title = "Total Number of Olympic Volleyball Medals Ever Won by Each Country")

# for the shiny app
build_bar <- function(gender.var, xvar = "Countries", yvar = "Total Olympic Volleyball Medals Won") {
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

# Come up with all extra pretty chart stuff

# Reference: 
# http://www.sthda.com/english/wiki/ggplot2-barplots-quick-start-guide-r-software-and-data-visualization
# https://ggplot2.tidyverse.org/reference/geom_bar.html

# ABOVE: bar width set to 0.5

# lint("chart_one.R")
