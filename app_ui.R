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

# Create a variable `intro_panel` that stores a `tabPanel()` for your first page
# It should include the following:
chart1_panel <- tabPanel(
  "Cummulative Medals",
  titlePanel("Olympic Volleyball"),
  # A `sidebarLayout()` that contains...
  
  # Your `map_sidebar_content`
  
  
  # Your `map_main_content`
  
)

# Create a variable `intro_panel` that stores a `tabPanel()` for your first page
# It should include the following:
chart2_panel <- tabPanel(
  "Medals per Game",
  titlePanel("Olympic Volleyball"),
  # A `sidebarLayout()` that contains...
  
  # Your `map_sidebar_content`
  
  
  # Your `map_main_content`
  
)

# Create a variable `intro_panel` that stores a `tabPanel()` for your first page
# It should include the following:
chart3_panel <- tabPanel(
  "Country Medal Distribution",
  titlePanel("Olympic Volleyball"),
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