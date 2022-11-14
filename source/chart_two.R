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


  ##############
  groupbyyear
  groupbycoutry
  ifcountry is that and that year then add one 
  
  #### make column for cumulative medals, do this by putting in 
  #### year order and adding one for every medal, account for same year medals
  
cumulative_medals <- medals_over_years %>% 
  group_by(country_3_letter_code, year_oly) %>% 
  summarize(cum_medals = total_medals + lag(total_medals))

#  mutate(cum_medals = min(year_oly)) %>% 
#  if (year_oly >= lag(year_oly)) { 
#    cum_medals = cum_medals + 1 
#  }

#alt solution
# cumulative_medals <- medals_over_years %>% 
#   mutate(cum_medals = ifelse(country_3_letter_code == lag(country_3_letter_code) && year_oly > lag(year_oly), cum_medals = 
#                                total_medals + lag(total_medals)))  
#      
# another

  
  # min(year_oly)) %>% 
  

View(medals_over_years)

# chosen <- "ROC"

# given_country <- medals_over_years$country_3_letter_code

# num_medals() <- function(given_country) {
#   medal_count <- sum(str_count(given_country), chosen)
#   return(medal_count)
# }
  
#### put cumulative medals in medals_over_years first
##num_medals <- medals_over_years %>%
##  group_by(country_3_letter_code) %>% 
#  group_by(country_3_letter_code) %>%
#  mutate(cum_medals_total = cumsum(length(medal_type)))
##  summarize(year_oly, total_medals = sum(medals_per_year))
              
               #(length(country_3_letter_code)))
  

  

# year x axis, cumulative metals received y axis 
# creating scatterplot
g <- ggplot(data = medals_over_years, aes(x = year_oly, y = total_medals), 
            na.rm = TRUE) + geom_point()
# use if not rendering
dev.off() 
g
# geom_point(aes(alpha = 0.3), # useful to turn this down if you have a lot of points in the same area
  #     color = "red",
  #     shape = 3, # I've almost never used shape and advise against it, in general
  #     size = 10, # relative size
  #     stroke = 1) + # boldness
# or 
  
scatterplot 
g + geom_jitter(height = 2, width = 2) 

?geom_point()


# Come up with all extra pretty chart stuff


