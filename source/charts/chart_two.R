# LINE/POINT GRAPH

# Load the tidyverse package
library("tidyverse")
library("ggplot2")
library("stringr")
library("lintr")

# Remember: if not working, do the following in your top bar in RStudios...
#           [Session -> Set Working Directory -> To Source File Location]
olympic_medals <- read.csv("../../data/olympic_medals.csv")

# dataframe for discipline, year, gender, medal type, participant,
# country name, and country code
olympic_volleyball_medals <- olympic_medals %>% 
  filter((discipline_title == "Volleyball") | (discipline_title == "Beach Volleyball")) %>% 
  select(discipline_title, slug_game, event_gender, medal_type, participant_title, country_name, country_3_letter_code)

# filters for year, country code, and medals won that year
medals_over_years <- olympic_volleyball_medals %>% 
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

# year x axis, cumulative metals received y axis 
# creating line graph for USA
g <- ggplot(data = chosen_country, aes(x = year_oly, y = total_medals, group = 1), 
            na.rm = TRUE) + 
    geom_line() + 
    geom_point() +
    labs(x = "Year", 
         y = "Olympic Volleyball Medals Won", 
         title = "Number of Olympic Volleyball Medals Won per Year by the USA")

# line graph for all the countries 
f <- ggplot(data = medals_over_years, aes(x = year_oly, y = total_medals, group = 1), 
            na.rm = TRUE) + geom_line(aes(color = country_3_letter_code))

# lint("chart_two.R")