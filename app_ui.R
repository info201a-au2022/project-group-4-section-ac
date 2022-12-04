# ui.R
library(shiny)
library(plotly)

# Define a variable `intro_sidebar_content` that is a `sidebarPanel()` for your
# first (map) page that contains:
intro_sidebar_content <- sidebarPanel(
  # Names of group members
  p("By:"),
  p("Harman Zhang, Katherine Murphy, and Sabrina Jahed")
)

# Define a variable `map_main_content` that is a `mainPanel()` for your
# first (map) page that contains the `plotlyOutput()` of your map
intro_main_content <- mainPanel(
  p("TODO: intro paragraph"),
  p("TODO: intro image here")
)


# Create a variable `intro_panel` that stores a `tabPanel()` for your first page
# It should include the following:
intro_panel <- tabPanel(
  "Overview",
  titlePanel("Introduction"),
  # A `sidebarLayout()` that contains...
  sidebarLayout(
    # Your `map_sidebar_content`
    intro_main_content,
    
    # Your `intro_sidebar_content`
    intro_sidebar_content
  )
)

chart1_sidebar_content <- sidebarPanel(
  # An input to select variable to map
  selectInput(
    "gender",
    label = "Olympic Volleyball Event Gender to Display",
    choices = list(
      "All" = "all",
      "Womens" = "women",
      "Mens" = "men"
    )
  )
)

chart1_main_content <- mainPanel(
  plotOutput("Plot")
)

# Create a variable `intro_panel` that stores a `tabPanel()` for your first page
# It should include the following:
chart1_panel <- tabPanel(
  "Cummulative Medals",
  titlePanel("Olympic Volleyball"),
  # A `sidebarLayout()` that contains...
  sidebarLayout(
    # Your `map_sidebar_content`
    chart1_sidebar_content,
    
    # Your `chart1_main_content`
    chart1_main_content
  )
)

chart2_sidebar_content <- sidebarPanel(
  uiOutput("ctryChoices")
)

# Create a variable `intro_panel` that stores a `tabPanel()` for your first page
# It should include the following:
chart2_panel <- tabPanel(
  "Medals per Game",
  titlePanel("Olympic Volleyball"),
  p("This data visualization is a line graph that represents the annual ",
  "number of medals the top-five medal-earning teams won at every ",
  "Olympics. It is important to note that although only five teams are ",
  "represented here, thirty-two teams have ever placed in the Olympics."),
  h3("Which country earned the most medals over the years?"),
  HTML(paste0("The country the most amount of medals earned over the years is ",
              textOutput("mostMedals", inline = T),
              ". This line graph visualization shows exactly how many", 
              " medals each of these top teams earned at every Olympics")),
  p(),
  # A `sidebarLayout()` that contains...
  sidebarLayout(
    # Your `chart2_sidebar_content`
    chart2_sidebar_content,
    # Your `map_main_content`
    mainPanel(
      plotOutput("countryCheck")
    )

  #   
    
  )
)

# Create a variable `intro_panel` that stores a `tabPanel()` for your first page
# It should include the following:
chart3_panel <- tabPanel(
  "Country Medal Distribution",
  
  titlePanel("Olympic Volleyball"),
  uiOutput("chooseCountry"),
  # A `sidebarLayout()` that contains...
  plotOutput("pieChart")
  
  # Your `map_sidebar_content`
  
  
  # Your `map_main_content`
  
)

# Create a variable `intro_panel` that stores a `tabPanel()` for your first page
# It should include the following:
summary_panel <- tabPanel(
  "Summary",
  titlePanel("Olympic Volleyball"),
  uiOutput("selectInput")
  # A `sidebarLayout()` that contains...
  
  # Your `map_sidebar_content`
  
  
  # Your `map_main_content`
  
)

# Create a variable `intro_panel` that stores a `tabPanel()` for your first page
# It should include the following:
report_panel <- tabPanel(
  "Final Report",
  titlePanel("Olympic Volleyball"),
  # A `sidebarLayout()` that contains...
  
  # Your `map_sidebar_content`
  
  
  # Your `map_main_content`
  
)

# Define a variable `ui` storing a `navbarPage()` element containing
# your two pages defined above
ui <- navbarPage(
  "Olympic Volleyball",
  intro_panel,
  chart1_panel,
  chart2_panel,
  chart3_panel,
  summary_panel,
  report_panel
)