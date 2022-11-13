# PIE CHART

# Load the tidyverse package
library(tidyverse)
library(stringr)
library(ggplot2)

# Remember: if not working, do the following in your top bar in RStudios...
#           [Session -> Set Working Directory -> To Source File Location]
olympic_medals <- read.csv("../data/olympic_medals.csv")

olympic_volleyball_medals <- olympic_medals %>% 
  filter((discipline_title == "Volleyball") | (discipline_title == "Beach Volleyball")) %>% 
  select(discipline_title, slug_game, event_gender, medal_type, participant_title, country_name, country_3_letter_code)
View(olympic_volleyball_medals)
# Filter Data
  # Need just G, S, B metals and the countries
  # Get a specific country's row

  #country_input can be whatever the user wants to input.
  country_input <- "Germany"
  
  
  pi_chart_data <- olympic_volleyball_medals %>% 
                   select(country_name, medal_type) %>% 
                   filter(country_input)
   
  
  num_gold <- sum(str_count(pi_chart_data$medal_type, "GOLD"))
  num_silver <- sum(str_count(pi_chart_data$medal_type, "SILVER"))
  num_gold <- sum(str_count(pi_chart_data$medal_type, "BRONZE"))
  country_input
  
  
  View(pi_chart_data)

# Try to create ggplot

# Come up with all extra pretty chart stuff
  # 