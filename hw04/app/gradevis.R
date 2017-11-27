---
title: "gradevis"
author: "Alexander Jou"
date: "11/26/2017"
output: html_document
runtime: shiny
---

##Histogram
#Numerical data for graph
hwmdata = data.frame(  hw1 = dat$HW1,
                      hw2 = dat$HW2,
                      hw3 = dat$HW3,
                      hw4 = dat$HW4,
                      hw5 = dat$HW5,
                      hw6 = dat$HW6,
                      hw7 = dat$HW7,
                      hw8 = dat$HW8,
                      hw9 = dat$HW9,
                      qz1 = dat$QZ1,
                      qz2 = dat$QZ2,
                      qz3 = dat$QZ3,
                      qz4 = dat$QZ4,
                      exam1 = dat$EX1,
                      exam2 = dat$EX2,
                      attendance = dat$ATT,
                      overall = dat$Overall
  )
hwmdata

library(shiny)

source("functions.R")

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Grade Visualization"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput("select", label = h3("Select box"), 
                  choices = list("HW1" = "hwdata$HW1", 
                                 "HW2" = "hwdata$HW2"), 
                  selected = "Grade"),
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30),
      radioButtons("scale", label = h3("choose scale"),
                   choices = list("none" = 1, 
                                  "std units" = 2, 
                                  "scale" = 3), 
                   selected = 1)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$distPlot <- renderPlot({
    # generate bins based on input$bins from ui.R
    x    <- hwdata[ ,input$select]
    if (input$scale == 1) {
      x
    } else if (input$scale == 2) {
      x <- standardize(x)
    } else {
      x <- rescale(x)
    }
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'blue', border = 'white',
         main = input$select, xlab = input$select)
  })
}

# Run the application
shinyApp(ui = ui, server = server)