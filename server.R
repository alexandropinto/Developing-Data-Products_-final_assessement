#
########     MAP 2
#




### Load the necessary libraries
library(shiny)
library(ggplot2)
library(rgdal)
library(ggmap)
library(dplyr)
library(gpclib)
library('maptools')
gpclibPermit()
library(plotly)

library(reshape2)
library(rgeos)

# Required by includeMarkdown
library(markdown)

# Load helper functions
source("helpers.r", local = TRUE)

#### preparing map

tract <- readOGR(dsn = path.expand("./data/estados_2010"), layer = "estados_2010")
tract <- fortify(tract, region="codigo_ibg")

a<-read.csv("./data/morbi.csv", sep = ";", nrows = 27)
var_melt<-names(a[,3:21])
a<-melt(a, id.vars = c("UF", "UF_cod"), measure.vars = var_melt)
names(a)<-c("UF", "id", "Year", "Mort")


a$Year<-as.numeric(sub("X", "", a$Year))
rm(var_melt)   

shinyServer(function(input, output, session) {
  
  
  
  c<-reactive({
    aggregate_by_year(a, input$year[1],input$year[2])
  })
    
  d<-reactive({
    aggregate_by_year_table(a, input$year[1],input$year[2])
  })
     
  output$Plot1 <- renderPlot({
   print(plot_by_year (
     dt=c(),
     states_map=tract,
     year_min=input$year[1],
     year_max=input$year[2],
     title="Brazil's Death %d - %d",
     fill=c()$Mort
   ))
  })
  
  output$Plot2 <- renderPlot({
    print(plot_boxplot (
      dt=d(),
      year_min=input$year[1],
      year_max=input$year[2],
      x=d()$Year,
      y=d()$Mort,
      title="Brazil's Death %d - %d"
    ))
  })
  
  output$Table1<-renderTable({
    aggregate_by_year_table(a, input$year[1],input$year[2])},
    striped = TRUE, bordered = FALSE, digits = 0)
    
  output$Table2<-renderTable({
    aggregate_by_year(a, input$year[1],input$year[2])},
    striped = TRUE, bordered = FALSE, digits = 0)
 
})
