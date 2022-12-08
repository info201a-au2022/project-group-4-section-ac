# ui.R
library(shiny)
library(ggplot2)
library(plotly)
library(tidyverse)

###############################################################################
## INTRO
###############################################################################

intro_panel <- tabPanel(
  "Overview",
  titlePanel("Introduction"),
  p(strong("By: Harman Zhang, Katherine Murphy, and Sabrina Jahed")),
  p(),
  p("The Olympic games are for determining the athelticism of different countries 
    at the highest level of competitive play. In this investigation, we set out to 
    find the statistics of which countries performed the best in Olympic indoor and 
    beach volleyball. We found the ratios of gold, silver, and bronze finishes for 
    each country, their respective cumulative and annual number of medals won, and 
    compared this data to opposing countries."),
  img(src="mistymay.png", class = "intro"),
  p("Exploring this data is crucial in understanding what it takes to be a 
    successful volleyball athlete. Looking further into what these countries do 
    for trainings, diet, etc. can influence anyone looking to pursue this life-path 
    further. The current designs for information technology on sport statistics 
    is inaccessible to the average person. Finding data on current and past players 
    or professional volleyball history overall can be challenging. Creating a 
    single place for viewing the statistics of volleyball finishes can help people 
    in using this data for reports, articles, analysis etc."),
  img(src="jaketri.png", class = "intro"),
  p("Some notable key findings include the top-five performing countries being 
    Brazil, The United States, The Soviet Union, China, and Japan. Brazil being 
    the overall top-medalling country, Brazil also received the most amount of 
    beach and indoor volleyball medals in a single year."),
  img(src="nishida.png", class = "intro"),
  p("The research questions we decided to explore were: What is a country’s 
  cumulative sum of the medals when accounting for gender? What is the Olympic 
  volleyball medal-winning trends of the top five medal-winning countries? What 
  is the total Olympic medal distribution for each country that has won a medal? 
  We address these questions in the following interactive data visualizations."),
  class="article-formatting"
)

###############################################################################
## CHART 1
###############################################################################

chart1_sidebar_content <- sidebarPanel(
  selectInput(
    "gender",
    label = "Olympic Volleyball Event Gender to Display",
    choices = list(
      "All" = "all",
      "Womens" = "women",
      "Mens" = "men"
    )
  ),
  h4("Question:"),
  p("What are the country’s cumulative sum of the medals when accounting for 
    gender?"),
  p("The purpose of this data visualization is to be able to take a general look 
    at the history of Olympic Volleyball for each country. By tallying how many 
    medals each country has won in the sport, we are able to see a general trend 
    of the success of these countries at the sport. When taking a slightly 
    narrower lens of Olympic Volleyball by focusing on gender (the Olympics 
    divide volleyball events into 2 categories based on gender which they define 
    as men and women), we are also able to see the success of different 
    countries by gender, which can allow us further investigate different aspects 
    of Olympic Volleyball.")
)

chart1_main_content <- mainPanel(
  plotOutput("plot"),
  p(em("Figure 1."), " Total number of mens, womens, or all Olympic Volleyball 
    medals that have ever been won by each country at the Olympics. Note that if 
    a country is not shown, this means that they have won no Olympic medals in 
    Volleyball. Please note that per the Olympics, gender is defined as male
    or female.")
)

chart1_panel <- tabPanel(
  "Cummulative Medals",
  titlePanel("Cummulative Olympic Volleyball Medals per Country by Gender"),
  sidebarLayout(
    chart1_sidebar_content,
    chart1_main_content
  )
)

###############################################################################
## CHART 2
###############################################################################

chart2_sidebar_content <- sidebarPanel(
  uiOutput("countryChoices"),
  h4("Question:"),
  p("What is the Olympic Volleyball medal winning trend of the top 5 medal-winning 
    countries?"),
  p("The purpose of this data visualization is to further break down how many 
    medals were won by each country in every Olympics since 1964. This will make 
    the years that each country was successful in volleyball more apparent. This 
    will in turn help viewers know which teams specifically to examine since 
    national teams tend to change players over time. By selecting the most 
    successfully-placing teams, we can focus more on the best athletes and 
    teams.")
)

chart2_main_content <- mainPanel(
  plotOutput("lineGraph"),
  p(em("Figure 2."), " Olympic volleyball medals won per year (that there was an Olympic game) by each country.")
)

chart2_panel <- tabPanel(
  "Medals per Game",
  titlePanel("Medal Winning Trends of Countries over Time per Olympic Game"),
  sidebarLayout(
    chart2_sidebar_content,
    chart2_main_content
  )
)

###############################################################################
## CHART 3
###############################################################################

chart3_sidebar_content <- sidebarPanel(
  uiOutput("chooseCountry"),
  h4("Question:"),
  p("What is the total Olympic Volleyball medal distribution for each country 
    that has won a medal?"),
  p("The purpose of this data visualization is to further break down how many 
    medals were won by each country in every Olympics since 1964. This will 
    make the years that each country was successful in volleyball more apparent. 
    This will in turn help viewers know which teams specifically to examine since 
    national teams tend to change players over time. By selecting the most 
    successfully-placing teams, we can focus more on the best athletes and 
    teams.")
)

chart3_main_content <- mainPanel(
  plotOutput("pieChart"),
  p(em("Figure 3."), " The pie chart representing the amount of each Olympic 
    Volleyball medals this country has ever earned.")
)

chart3_panel <- tabPanel(
  "Country Medal Distribution",
  titlePanel("Total Olympic Volleyball Medal Distribution per Country"),
  sidebarLayout(
    chart3_sidebar_content,
    chart3_main_content
  )
)

###############################################################################
## SUMMARY
###############################################################################

summary_panel <- tabPanel(
  "Takeaways",
  img(src="indoorblocking.png", class = "intro"),
  titlePanel("Main Takeaways"),
  h3("Cumulative Medals Visualization"),
  h4("Takeaways:"),
  p("This chart shows us how well a country is able to perform under different 
    categories of Volleyball. We take a look specifically at the difference 
    between the gender of the sport. Our chart just looks at the total number 
    of medals, all inclusive, that a country has earned based on the gender 
    (or the genders added up together). Being able to look at how well a gender 
    can perform is not actually as straightforward as one may think."),
  h4("Broader Implications:"),
  p("For the majority of countries that compete, their standing in medals stays 
    relatively the same. For example, Brazil, in every category, stays at the 
    top of the rankings for the medal count. Same goes for the USA too. No 
    matter how we try to tally the medals, those two are on top. However, this 
    is not the case for every country. Norway, for example, has no medals in 
    women's volleyball but has won some in the men's division. Looking at it 
    from a broader perspective, this tell us that Norway might not putting as 
    much effort into their women's team than compared to other countries."),
  p(),
  h3("Medals per Game Visualization"),
  h4("Takeaways:"),
  p("This data shows which years each country has won and how many medals they 
    won in that year. The first takeaway is that although Brazil earned more 
    cumulative medals, The United States placed in more of the Olympic games. 
    Brazil earned a total of thirty-seven medals while The United States earned 
    a total of thirty-three medals."),
  h4("Broader Implications:"),
  p("From this data visualization we can see that Brazil and The United States 
    were very successful is later years starting the year 1984. The third top 
    performing country is the Soviet Union, which placed from 1964 up until 1988 
    because they broke into several countries in 1991. This data reveals larger 
    social and economic situations which directly reflects in a country’s 
    performance in the Olympics."),
  p(),
  h3("Country Medal Distribution Visualization"),
  h4("Takeaways:"),
  p("For the Pie chart, you are able to look closer at a specific country. What 
    someone would be able to gather from this visualization would be the 
    country’s overall performance in the discipline of volleyball. Being able to 
    know a distribution of a country’s medals not only tells us how many times a 
    country has been in that top 3 spot, but also where in that top three they 
    were able to place. This gives a more precise picture of the country’s 
    performance in the sport."),
  h4("Broader Implications:"),
  p("For example, Brazil winning 37 medals in total is very pretty impressive. 
    However, the majority of them are not gold. Over two thirds of their medals 
    are silver and bronze medals. However, the USA has earned 33 medals. Which 
    is less than Brazil’s total medals, 18 of those 33 medals are gold. Which 
    means when the USA is able to perform, they perform really well. From this,
    we can see that as a country, the USA is able to maintain an Olympic 
    Volleyball team that is more consistently skilled than Brazil, as they 
    have won more gold medals."),
  class="article-formatting"
)

###############################################################################
## REPORT
###############################################################################

report_panel <- tabPanel(
  "Final Report",
  img(src="kerriwalsh.png", class = "intro"),
  includeHTML("display-report.html"),
  class="article-formatting"
)

# Define a variable `ui` containing the pages defined above
ui <- fluidPage(
        navbarPage(
        "Olympic Volleyball",
        intro_panel,
        chart1_panel,
        chart2_panel,
        chart3_panel,
        summary_panel,
        report_panel
      ),
      includeCSS("styles.css")
)
  