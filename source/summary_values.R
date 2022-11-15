# num countries, max/min indoor, max/min outdoor

# Load the tidyverse package
library(tidyverse)
library("lintr")

# Remember: if not working, do the following in your top bar in RStudios...
#           [Session -> Set Working Directory -> To Source File Location]
olympic_medals <- read.csv("../data/olympic_medals.csv")

olympic_volleyball_medals <- olympic_medals %>% 
  filter((discipline_title == "Volleyball") | (discipline_title == "Beach Volleyball")) %>% 
  select(discipline_title, slug_game, event_gender, medal_type, participant_title, country_name, country_3_letter_code)

# Summary Information Script (B.2 above)

# NUMBER 1
# figure out the num of countries who ever won a medal
num_medals_per_country <- olympic_volleyball_medals %>% 
  # group by country code
  group_by(country_3_letter_code) %>% 
  # add cumulative medal row since each row represents 1 medal right now
  mutate(num_medals = 1)

cummulative_medals_per_country <- num_medals_per_country %>% 
  # group by country code
  group_by(country_3_letter_code) %>% 
  # compute cumulative medal row from num_medals row
  summarize(cummulative_medals = sum(num_medals))

number_winner_countries <- nrow(cummulative_medals_per_country)

# NUMBER 2/3
# figure out the average number of medals a country wins in indoor volleyball
# not including  countries who have never won a medal
medals_by_discipline <- olympic_volleyball_medals %>% 
  # group by country code
  group_by(discipline_title) %>% 
  # add cumulative medal row since each row represents 1 medal right now
  mutate(num_medals = 1)

# calculate and condense data
cummulative_medals_per_country_Indoor <- medals_by_discipline %>% 
  # only look at Males
  filter(discipline_title == "Volleyball") %>% 
  # group by country code
  group_by(country_3_letter_code) %>% 
  # compute cumulative medal row for Males from num_medals row
  summarize(cummulative_medals_Indoor = sum(num_medals))

cummulative_medals_per_country_Outdoor <- medals_by_discipline %>% 
  # only look at Males
  filter(discipline_title == "Beach Volleyball") %>% 
  # group by country code
  group_by(country_3_letter_code) %>% 
  # compute cumulative medal row for Males from num_medals row
  summarize(cummulative_medals_Beach = sum(num_medals))

cummulative_medals_Indoor_Beach <- cummulative_medals_per_country_Indoor %>% 
  full_join(cummulative_medals_per_country_Outdoor, by = "country_3_letter_code") 

# replace all NA values with 0
cummulative_medals_Indoor_Beach[is.na(cummulative_medals_Indoor_Beach)] = 0

# NUMBER 2
# get average indoor
total_num_indoor_medals <- sum(cummulative_medals_Indoor_Beach$cummulative_medals_Indoor)
avg_indoor_medals_won <- ceiling(total_num_indoor_medals / number_winner_countries)

# NUMBER 3
# get average beach
total_num_beach_medals <- sum(cummulative_medals_Indoor_Beach$cummulative_medals_Beach)
avg_beach_medals_won <- ceiling(total_num_beach_medals / number_winner_countries)

# NUMBER 4
# most indoor
max_indoor_medals_won <- max(cummulative_medals_Indoor_Beach$cummulative_medals_Indoor)

# NUMBER 5
# most beach
max_beach_medals_won <- max(cummulative_medals_Indoor_Beach$cummulative_medals_Beach)

# FINAL ANSWER
answer <- c(number_winner_countries, avg_indoor_medals_won, avg_beach_medals_won, max_indoor_medals_won, max_beach_medals_won)

# lint("summary_values.R")
