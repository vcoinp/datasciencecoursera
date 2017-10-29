#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Iris data selection"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       h4("Select species:"),
   
    checkboxInput("showSetosa","Show Setosa",value = TRUE),
    checkboxInput("showVersicolor","Show Versicolor",value = TRUE),
    checkboxInput("showVirginica","Show Virginica",value = TRUE)
    ),
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot"),
       h4("Number of samples displayed with the current selection:"),
       textOutput("numSamples"),
       h5("*Some samples have the exact petal lenght and width. It may give the impression that there are fewer samples")
    )
  )
))
