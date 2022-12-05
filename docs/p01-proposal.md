# Code Name
The Olympic Acers

# Project Name
Olympic Volleyball Stats Over the Years

## Authors
- Katherine Murphy (kate2001@uw.edu)
- Harman Zhang (harmaz@uw.edu)
- Sabrina Jahed (sjahed7@uw.edu)
- Karina Wang (karinaw1@uw.edu)

## Affiliation
INFO-201: Technical Foundations of Informatics - The Information School - University of Washington

## Date
Autumn 2022

# Abstract
Our main question is how has Volleyball changed over time? In other words, how does this data show trends in success amongst different Volleyball players and teams.
This question is important because this can help shape the success of the future of Volleyball (teams and players) by having the data be more accessible to all future athletes.
To address the question, we will compile, organize, and visualize Volleyball data from Olympics Volleyball games to allow the data to be more accessible to those who are unable to do this themselves.


We are concerned with how unorganized and scattered professional Volleyball data is, because success in sports is often determined and influenced by sports data, which is often unavailable to the smaller players. To address this concern, we plan to make this data available to the smaller players, giving them the chance to use this data to their advantage.

# Keywords
1. Olympic Volleyball
2. Professional Athletes
3. Sport growth over time
4. Country power influencing sport success
5. Equitable sports information access

# Introduction
In the world of professional sports, data on even the most popular sports can be confusing to find.  Trying to search for sports statistics can lead to loads of information and different statistics on the sports. However, the information can often be scattered and not easy to comprehend. The information for tournaments around the world might be in one place, where the stats for specific players might be in another. If someone wanted to easily access a comprehensive amount of data on a sport they would have to go searching in multiple places. Our goal for the project was to be able to create a place where athletes, coaches, or even spectators of Olymppic Volleyball could go and find most of the information they were looking for. We not only wanted this project to have the data they were looking for, but to also have it be more easily comprehensible for its use for the more casual fan.

# Problem Domain
The current designs for information technology on sport statistics is inaccessible to the average person. Finding data on current and past players of professional/Olympic-level Volleyball can be challenging. Creating a single place for viewing the statistics of Olympic-level Volleyball results can help people in using this data for reports, articles, analysis, etc.

## Human Values:
Some human values directly tied to our problem domain are guiding others towards the right action, achievement, and self-direction. By creating an active archive of data of Olympic Volleyball, we record history for current and future generations to view. It recalls past achievements for people to look back on. If for example, a young child wanted to be successful in professional volleyball, they could access the data easily and find individuals who were successful in the field.

> “In the men’s tournament, Brazil are the current defending champions and have won the gold medal three times – a record equalling tally alongside the USA” (Dangrey, 22).

Using data such as this allows other individuals to research that person further for better insight. Then using that data, research that person further for better insight. These values originate from self-fulfillment and this concept that a person has the power to pursue what they want in life. A value tension could be seen with humility. When one achieves their desired endeavors in life, sometimes the ego can clash with humbleness.

## Stakeholders:
The direct stakeholders include all volleyball athletes, analyzers, coaches, players, and professional teams. It is assumed they have a general interest in volleyball and desire to continually engage in it. It is also assumed they know how the game operates as well as the different levels of competition. Some of the values they hold include self-fulfillment and action. A desire to learn more and know what is happening within the world of volleyball is their motivation.

An indirect stakeholder would be the professional teams and their athletes. Their career is playing volleyball, so they may never see the statistics written about them; However, it indirectly affects them because the data is written about them.

Countries hosting the olympics are often affect as well. In terms of hosting this event,

> “In the past, hosting an Olympic event was seen as a privilege that brought positive economic and development changes to the host country. Today, the cost of hosting the Olympics has deterred many nations from bidding for that privilege. Some nations have even withdrawn their bids.” (Wee, 18).

Statistically, when we view which countries host the most, we can begin to examine economic trends.

## Benefits and Harms:
If interventions are taken with data and technology, a potential benefit could be live statistics. For example, if the intervention in technology is more updated information systems that can easily load in new data then any viewer would have the most current information. This would benefit any people viewing the datasets because they are seeking and receiving desired information. On the opposite side, if the intervention was adding additional information on players, it could also become an invasion of privacy. For example, an unanticipated consequence could be that because a player had a bad game a report could be linked to their poor performance, in addition to the loss, and harm to their reputation. For instance,
> “As more data and information gets recorded during a game, it is possible to come up with a detailed analysis of how a team performed, including their specific strengths and weaknesses” (Bird, 8).

# Research Questions
## 1. What are the country’s cumulative sum of the medals when accounting for gender, and discipline?
This question is important because we can see how it is able to show a good general growth of the sport in certain areas. People might want to know which countries to follow styles from.
## 2. What is the medal winning trend of the USA?
This question helps us determine if external factors behind an athlete have any effect on their performance. Athletes might want to keep these factors in the back of their mind. We can correlate world/national events or other sports-related training styles to the trends in this graph in an attempt to help ourselves improve.
## 3. What is the total medal distribution of medals of Germany?
With this question we would be able to see how Germany is skill-wise in comparison to other top medal-winners. There is a difference between winning all Bronze or all Gold medals, and this might be considered by officials of events to analyze different advantages.

# The Dataset
1. Our datasets are related to our problem domain because the first one encompasses data on all medals, athletes, and hosts in the Summer and Winter Olympic games from 1986-2002 and the second provides data on all Summer and Winter Olympic medalists from 1896 Athens to Rio 2016. Our project is oriented around Volleyball in the Olympics, so these datasets on sports and medalists at the Olympics relate back to Volleyball which is a sport at the Olympics which athletes win medals in. More specifically, our datasets focus on the following:
    -  Which countries won each medal (gold, silver, or bronze) in each category.
    - Which athletes won each medal for each country.
    - Whether a specific event is a single or multi-gender sport.
    - Whether a specific event is a team or individual player sport.
    - What variation of the event the medal is for (i.e. beach or on-court Volleyball).
2. Summary of data set:

| Data File Name | Number of Observations | Number of Variables | Citation (MLA) | URL |
| ---- | ---- | ---- | ---- | ---- |
| [olympic_athletes.csv](../data/olympic_athletes.csv) | 75900 | 7 | Petro. “Olympic Summer & Winter Games, 1986-2022.” Kaggle, 11 Apr. 2022, https://www.kaggle.com/datasets/piterfm/olympic-games-medals-19862018?select=olympic_athletes.csv. | https://www.kaggle.com/datasets/piterfm/olympic-games-medals-19862018?select=olympic_athletes.csv |
| [olympic_hosts.csv](../data/olympic_hosts.csv) | 53 | 7 | Petro. “Olympic Summer & Winter Games, 1986-2022.” Kaggle, 11 Apr. 2022, https://www.kaggle.com/datasets/piterfm/olympic-games-medals-19862018?select=olympic_hosts.csv. | https://www.kaggle.com/datasets/piterfm/olympic-games-medals-19862018?select=olympic_hosts.csv |
| [olympic_results.csv](../data/olympic_results.csv) | 162804 | 16 | Petro. “Olympic Summer & Winter Games, 1986-2022.” Kaggle, 11 Apr. 2022, https://www.kaggle.com/datasets/piterfm/olympic-games-medals-19862018?select=olympic_results.csv. | https://www.kaggle.com/datasets/piterfm/olympic-games-medals-19862018?select=olympic_results.csv |
| [olympic_medals.csv](../data/olympic_medals.csv) | 21697 | 12 | Petro. “Olympic Summer & Winter Games, 1986-2022.” Kaggle, 11 Apr. 2022, https://www.kaggle.com/datasets/piterfm/olympic-games-medals-19862018?select=olympic_medals.csv. | https://www.kaggle.com/datasets/piterfm/olympic-games-medals-19862018?select=olympic_medals.csv |

3. Citation, and urls: see above table.
4. Describe the dataset:
    - (a) For all of the above `.csv` files, Petro was the official (or main) author. Petro had some collaborators, Kalilur Rahman and Niek van der Zwaag, but they were not listed as official authors. The data can be estimated to have been collected from https://olympics.com/ by Petro around November 2021, as that is when the downloads of this data set started (there is no official start recording date anywhere on the data set FAQs. However, the data on https://olympics.com/ has been being recorded since 12/31/1899 up until 04/29/2022. Petro did not record any specific purpose behind their decision to create this dataset themself. However, we can suppose that this data was collected as a part of their own personal project due to the Python scripts of visualizations that they attached in the description of the dataset.
    - (b) The data collection effort by Petro was not funded, or at least he does not disclose that it was funded. The Olympics organization (and the host nation of the Olympics game for that year) funds the collection and recording of data on the Olympic games. Future host nations, historians, and future athletes (non-Olympic athletes as well) all benefit from the data. Sports organizations, corporations, and future host nations will most likely benefit monetarily from data on the past games.
    - (c) The data was validated by the Olympics organization. Since Petro pulled the data only from the Olympics organization, then the data was pulled from the one true source (and authority) on what happened during previous Olympic games. Therefore, the data is trustworthy.
    - (d) We obtained the data by downloading the `.csv` files that Petro organized the data in from the links included in the above table. We credited the source of the data, Petro, who credited (in his own sources), the Olympics organization.

# Expected Implications
Assuming we answered all of our research questions, there are two main implications:
1. The first implication is that players who want to get better at the sport can look at and understand the data better. For example, if someone wants to easily find the best player or best region to adopt a style form, they would be easily able to look them up with our project.
2. The second implication with our project would be for the average fan. Someone who is just getting into volleyball might want to do research on a specific player and their stats. Or they might be interested in the general trend of popularity of the sport. The average person would be much more comfortable with using or project than trying to scour the internet for the information.

# Limitations
The first of the two main limitations of the project is that we can only collect data that is entered online. Because most of the data addition is done with a program, the data we find is only from what is given to us. We are given the data we are using, not going out and observing the games that go on. Even though we can only use data given to us, we can find the data sets which are the most comprehensive and leave very little out. The second limitation of the project is how far back in volleyball history we can go. There is only so far we can realistically go back without it being too much of a hassle. So, we are only able to realistically obtain the data from “modern” volleyball. We could spend more time digging for the data, however, so we can encompass most of volleyball history.

# Findings
What are the country’s cumulative sum of the medals when accounting for gender?

  - We originally asked this question because we thought that medals were an effective metric to base a countries’ performance on. Being able to check between the genders playing, lets the user get a clearer picture of a country’s performance. One conclusion we were able to find with our data set was that there is a lot of consistency between when looking at specific genders vs. when adding them all up. If a country is performing at, lets say, female beach volleyball, then that country will probably perform well at male court volleyball. The trend is that a country is a good volleyball country and not specific areas of their volleyball; if certain areas are able to perform, then other areas from that same country also tend to perform.
  
What is the Olympic Volleyball medal winning trend of the top 5 medal-winning countries?

  - When looking at this data, we are trying to find if there was a specific year a country, performed exceptionally well. This way a person would be able to easily find which years they would want to follow as an example. In the case of the USA, a player would want to look at the USA’s performance in 2008 because in that year they won 6 medals. Looking at more of the general trend of the US’s performance, they also had another, shorter peak before in 1996 with 4 medals. They have had a rise and fall in medals earned each Olympic game, a consistent middle to higher performing team. We can do this for any country and see which year they performed the best in.
  
What is the total Olympic Volleyball medal distribution for each country that has won a medal?

  - This question was designed to look more specifically at how “well” a country performs at the Olympics. Instead of just looking at the total medals and counting them, we gather which medals are won over the course of them participating in the Olympics. In the case of Germany, they have won 2 bronze medals and 4 gold which is fairly good considering how many teams have participated in the Olympics, and how many get close to no medals. Germany’s disruption of medals is definitely more impressive than some of the other participants. However, they are far from the top team, other countries are able to far overshadow their performance.

# Discussion
Based on our data visualizations, we found that certain countries did perform better overall than other countries. A few countries have consistently placed every (other) year, while other countries have not placed at all. The Olympics are commonly hosted in countries with strong economic standings. This demonstration of abundant resources can bring to light how other countries with lower economical standings contrast drastically. Hosting the Olympics astronomically increases a country's GDP. We made multiple data visualizations to reveal different patterns among countries that have placed, the years of the Olympics, and the types of medals each country has received. The importance of creating the pie chart was to give a visual summary of how many different golds, silver, and bronze medals they were awarded. This implication can be seen when only 31 countries were ever rewarded medals in history. This lack of data brings to light how the status of countries, and their resources, can affect how much value is placed on volleyball as a professional sport. When certain inequities become apparent, it is difficult to prioritize fulfilling tasks. Another implication can be how pie charts show only ratios. For example, a country could win three times as many medals as another country, yet seemingly do worse because they have a lower gold-to-silver or gold-to-bronze ratio. The importance of our bar chart is observing which countries won the most amount of cumulative medals; Countries that received more cumulative medals can be seen as more successful in terms of volleyball athletics. An implication for this kind of data could potentially be how, again, we only have 31 countries that have ever placed. For the line graph, we can compare how many medals were won by a country in a certain year. This enables us to further examine which years a country performed its best. Some implications of this become apparent when we compare a country that has won significantly fewer medals in one year and a country that places in almost every Olympics. The disparity is large, and the data would be seemingly very scarce since the values represent annual medals won. Another implication could be how filtering down the already small set of countries would give less data than before, but this also helps to focus on comparisons between a few specific well-performing countries. Overall Brazil, The United States, The Soviet Union, China, and Japan have the most medals earned in beach and indoor volleyball Olympic history.

# Conclusion
In an age of data and information overload, it can be difficult to find a singular place to answer all of your questions on a specific subject. This concept applies very well to the world of sports analysis, and in this instance’s case, Volleyball. In this project, we have accumulated a variety of data points on Volleyball being played at the Olympic level. In doing so, we have been able to organize, synthesize, and present the accumulated data to the users in a way they have never seen before by allowing users to interact with the data in order to customize their viewing experience. This allows the public to be able to view the data on their own terms and to customize the data visuals to their individual wants and needs.

We decided to focus on Volleyball at the Olympic level as it provided a worldwide lens of Volleyball that was consistent, as the same rules apply to every country participating in the Olympic games. Additionally, the Olympics is an event where all countries are playing each other at the same exact venue, which cuts down on some external factors that may vary results. This, however, does not mean that there are no inequities present, as we will have explored throughout our data analysis. To create a well-rounded suite of data visualizations of Volleyball, we decided to focus on several aspects of the Olympic games.  We explored the total number of Olympic Volleyball medals that every country has ever received, the number of Olympic Volleyball medals a country has won per year, and of the total number of Olympic Volleyball medals a country has won the distribution of these medals amongst Gold, Silver, and Bronze. Through these data visualizations, which are customizable by country and other heuristics (i.e. event type and gender), we allow each user to take their own unique investigative dive into the world of Olympic Volleyball.

This data visualization is important for future generations as it will allow them to gain a greater understanding of the world of professional Volleyball. Access to data is crucial, as it can be the difference between success and failure. If we cannot look at our past and learn from our mistakes, we will never reach our full potential. It is our hope that these Volleyball data visualizations can be used to better serve the Volleyball community and allow a greater variety of people to find their way to success in the sport.

# Acknowledgements
Thank you to Petro, who created all of the extremely detailed, accurate, and interlinked `.csv` files for the _"Olympic Summer & Winter Games, 1986-2022"_ that we are using for the basis of our project.

# References
- Bird, Marc. “4 Ways Technology Has Changed the World of Volleyball.” VolleyCountry, 28 Jan. 2020, https://volleycountry.com/news/4-ways-technology-has-changed-the-world-of-volleybal.
- Dangrey. “Olympic Volleyball: Disciplines, Teams, Rules, Balls and More.” Volleyverse, 17 Sept. 2020, https://hub.volleyverse.com/volleyball-tips/olympic-volleyball-disciplines-teams-rules-balls/#:~:text=Olympic%20Volleyball%20Teams,-Since%201988%20.
- Wee, Rolando Y. “Countries Hosting the Greatest Number of Olympic Games.” WorldAtlas, WorldAtlas, 18 Mar. 2019, https://www.worldatlas.com/articles/countries-hosting-the-greatest-number-of-olympic-games.html.

See **Dataset**, Part 2 table for `\data`'s .csv file references.

All photos were taken from Google photos under fair usage premises.

# Appendix A: Questions
- Is there a 1:1 ratio of **research question** to data visual that we will be implementing in later parts of the assignment?
