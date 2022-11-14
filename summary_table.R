# Load the tidyverse package
library(tidyverse)

# Remember: if not working, do the following in your top bar in RStudios...
#           [Session -> Set Working Directory -> To Source File Location]
olympic_medals <- read.csv("../data/olympic_medals.csv")

olympic_volleyball_medals <- olympic_medals %>% 
  filter((discipline_title == "Volleyball") | (discipline_title == "Beach Volleyball")) %>% 
  select(discipline_title, slug_game, event_gender, medal_type, participant_title, country_name, country_3_letter_code)

# TODO: Summary Information Script (B.2 above)
# groupby() medals
# calculate and condense data

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

# Summary Information

summary_info <- list()



# TODO: Aggregate Table Script (B.3 above)
# make the table