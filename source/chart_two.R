# SCATTER PLOT

# Load the tidyverse package
library("tidyverse")
library("ggplot2")
library("stringr")

# Remember: if not working, do the following in your top bar in RStudios...
#           [Session -> Set Working Directory -> To Source File Location]
olympic_medals <- read.csv("../data/olympic_medals.csv")

olympic_volleyball_medals <- olympic_medals %>% 
  filter((discipline_title == "Volleyball") | (discipline_title == "Beach Volleyball")) %>% 
  select(discipline_title, slug_game, event_gender, medal_type, participant_title, country_name, country_3_letter_code)

View(olympic_volleyball_medals)

# Filter Data
# filtered out discipline title, participant title

medals_over_years <- olympic_volleyball_medals %>% 
  select(slug_game, medal_type, country_name, country_3_letter_code) %>% 
  mutate(year_oly = str_sub(slug_game, -4)) %>% 
  
  #### make column for cumulative medals, do this by putting in 
  #### year order and adding one for every medal, account for same year medals
  mutate(cum_medals = )

# if (year_oly > )  

View(medals_over_years)

# chosen <- "ROC"

# given_country <- medals_over_years$country_3_letter_code

# num_medals() <- function(given_country) {
#   medal_count <- sum(str_count(given_country), chosen)
#   return(medal_count)
# }
  
#### put cumulative medals in medals_over_years first
num_medals <- medals_over_years %>%
#  select(-slug_game) %>% 
  group_by(year_oly) %>% 
  group_by(country_3_letter_code) %>%
#  mutate(cum_medals_total = cumsum(length(medal_type)))
  summarize(year = year_oly, total_medals = (length(medal_type)))
  

  

# year x axis, metals received y axis 
# Try to create ggplot
scatterplot <- ggplot(data = medals_over_years, mapping = aes(x = year,
                                                              y = medals))

# try this from demo?
g + geom_point(aes(alpha = 0.7), # useful to turn this down if you have a lot of points in the same area
      color = "red",
      shape = 3, # I've almost never used shape and advise against it, in general
      size = 10, # relative size
      stroke = 1) + # boldness
# or 
g + geom_jitter(height = 2, width = 2) 

?geom_point()


# Come up with all extra pretty chart stuff


