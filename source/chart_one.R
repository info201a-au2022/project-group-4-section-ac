# BAR GRAPH

# Load the tidyverse package
library(tidyverse)

# Remember: if not working, do the following in your top bar in RStudios...
#           [Session -> Set Working Directory -> To Source File Location]
olympic_medals <- read.csv("../data/olympic_medals.csv")

olympic_volleyball_medals <- olympic_medals %>% 
  filter((discipline_title == "Volleyball") | (discipline_title == "Beach Volleyball")) %>% 
  select(discipline_title, slug_game, event_gender, medal_type, participant_title, country_name, country_3_letter_code)

# Filter Data

# Try to create ggplot

# Come up with all extra pretty chart stuff