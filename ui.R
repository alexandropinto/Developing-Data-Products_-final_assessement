#
# 


library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  navbarPage("Number of Death in Brasil",
  tabPanel("Data",
  
  
  # Sidebar with a slider input for number of bins 
   sidebarLayout(
    sidebarPanel(
      sliderInput("year",
                  "Select the years",
                  min = 1996,
                  max = 2014,
                  value = c(2001, 2004))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      mainPanel(
        tabsetPanel(
          tabPanel(p(icon("line-chart"), "By year"),
                   h4('Deaths by year', align = "center"),
                   
                   fluidRow(
                     column(12,
                            fluidRow(
                              column(6,
                                     tableOutput('Table1')),
                            fluidRow(
                              column(6,
                                     plotOutput("Plot2"))
                            
                            ))
                   ))
                   ##sidebarPanel(column(width=6),
                     ##tableOutput('Table1')),
                   ##mainPanel(column(width=6), )
                     
                   )
                   ,
          tabPanel(p(icon("map-marker"), "Map"),
                   h4('Deaths by year', align = "center"),        
                  plotOutput("Plot1"),
                  tableOutput('Table2')
          )
      
      
    )
  )
  
    )
  
)
  ),
tabPanel("About",
         mainPanel(
           includeMarkdown("include.md"))
)
)


))
