# PIE CHART

# Load the tidyverse package
library(tidyverse)
library(stringr)
library(ggplot2)
library("lintr")

# Remember: if not working, do the following in your top bar in RStudios...
#           [Session -> Set Working Directory -> To Source File Location]
olympic_medals <- read.csv("../../data/olympic_medals.csv")

olympic_volleyball_medals <- olympic_medals %>% 
  filter((discipline_title == "Volleyball") | (discipline_title == "Beach Volleyball")) %>% 
  select(discipline_title, slug_game, event_gender, medal_type, participant_title, country_name, country_3_letter_code)

# Filter Data
  # Need just G, S, B metals and the countries
  # Get a specific country's row

#country_input can be whatever the user wants to input.
country_input <- "Germany"
  
  
pi_chart_data <- olympic_volleyball_medals %>% 
                 select(country_name, medal_type) %>% 
                 filter(country_name == country_input)
 

num_gold <- sum(str_count(pi_chart_data$medal_type, "GOLD"))
num_silver <- sum(str_count(pi_chart_data$medal_type, "SILVER"))
num_bronze <- sum(str_count(pi_chart_data$medal_type, "BRONZE"))
country_input

Medal_Type = c("Gold", "Silver", "Bronze")
Medal_Count = c(num_gold, num_silver, num_bronze)

plot_data <- data.frame(Medal_Type, Medal_Count)
  
# Try to create ggplot
plot <- ggplot(plot_data, aes(x = "", y = Medal_Count, fill = Medal_Type)) +
               geom_bar(stat="identity", width = 1, size = 1) +
               coord_polar("y", start = 0) +
               geom_text(aes(label = ifelse(Medal_Count > 0, Medal_Count, "")),
                        position = position_stack(vjust = 0.5)) +
               labs(title = paste(country_input, "'s Medals in Volleyball")) +
               scale_fill_manual(values = c("#663300", "#ffff33", "grey")) +
  
  
# Change Later
theme_void()
  
# lint("chart_three.R")
  