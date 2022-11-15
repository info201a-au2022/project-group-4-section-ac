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
**Note:** Not for the project proposal; for final report only.

# Discussion
**Note:** Not for the project proposal; for final report only.

# Conclusion
**Note:** Not for the project proposal; for final report only.

# Acknowledgements
Thank you to Petro, who created all of the extremely detailed, accurate, and interlinked `.csv` files for the _"Olympic Summer & Winter Games, 1986-2022"_ that we are using for the basis of our project.

# References
- Bird, Marc. “4 Ways Technology Has Changed the World of Volleyball.” VolleyCountry, 28 Jan. 2020, https://volleycountry.com/news/4-ways-technology-has-changed-the-world-of-volleybal.
- Dangrey. “Olympic Volleyball: Disciplines, Teams, Rules, Balls and More.” Volleyverse, 17 Sept. 2020, https://hub.volleyverse.com/volleyball-tips/olympic-volleyball-disciplines-teams-rules-balls/#:~:text=Olympic%20Volleyball%20Teams,-Since%201988%20.
- Wee, Rolando Y. “Countries Hosting the Greatest Number of Olympic Games.” WorldAtlas, WorldAtlas, 18 Mar. 2019, https://www.worldatlas.com/articles/countries-hosting-the-greatest-number-of-olympic-games.html.

See **Dataset**, Part 2 table for `\data`'s .csv file references.

# Appendix A: Questions
- Is there a 1:1 ratio of **research question** to data visual that we will be implementing in later parts of the assignment?