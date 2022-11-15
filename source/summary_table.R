# Load the tidyverse package
library(tidyverse)

# Remember: if not working, do the following in your top bar in RStudios...
#           [Session -> Set Working Directory -> To Source File Location]
olympic_medals <- read.csv("../data/olympic_medals.csv")

olympic_volleyball_medals <- olympic_medals %>% 
  filter((discipline_title == "Volleyball") | (discipline_title == "Beach Volleyball")) %>% 
  select(discipline_title, slug_game, event_gender, medal_type, participant_title, country_name, country_3_letter_code)

# Summary Information Script (B.2 above)

# groupby() volleyball type
medals_by_discipline <- olympic_volleyball_medals %>% 
  # group by country code
  group_by(discipline_title) %>% 
  # add cumulative medal row since each row represents 1 medal right now
  mutate(num_medals = 1)

# calculate and condense data
cummulative_medals_per_country_Indoor <- medals_by_discipline %>% 
  # only look at indoor Volleyball
  filter(discipline_title == "Volleyball") %>% 
  # group by country code
  group_by(country_3_letter_code) %>% 
  # compute cumulative medal row for indoor Volleyball from num_medals row
  summarize(cummulative_medals_Indoor = sum(num_medals))

cummulative_medals_per_country_Outdoor <- medals_by_discipline %>% 
  # only look at outdoor/beach Volleyball
  filter(discipline_title == "Beach Volleyball") %>% 
  # group by country code
  group_by(country_3_letter_code) %>% 
  # compute cumulative medal row for outdoor/beach Volleyball from num_medals row
  summarize(cummulative_medals_Beach = sum(num_medals))

cummulative_medals_Indoor_Beach <- cummulative_medals_per_country_Indoor %>% 
  full_join(cummulative_medals_per_country_Outdoor, by = "country_3_letter_code") 

# replace all NA values with 0
cummulative_medals_Indoor_Beach[is.na(cummulative_medals_Indoor_Beach)] = 0

