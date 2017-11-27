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



# Run the application
shinyApp(ui = ui, server = server)

ui <- shinyUI(pageWithSidebar(
  headerPanel("Grade Visualizer"),
  sidebarPanel(conditionalPanel(condition = "input.tabselected==1",h3("Grades Distribution"), tableOutput(outputId="distribution")),
               conditionalPanel(condition = "input.tabselected==2",selectInput(inputId="sel_1",label="X-axis variable",choices=select_from),sliderInput(inputId = "bin",label = "Bin Width",min=1,max=10,value=5)),
               conditionalPanel(condition = "input.tabselected==3",selectInput(inputId="sel _2",label ="X-axis variable",choices=select_from),selectInput(inputId='sel_3',label="Y-axis variable",choices=select_from),sliderInput(inputId="opacity",label="Opacity",min=0,max=1,step=0.1,value=0.5), radioButtons(inputId="method",label="Show line",choices=c("none","lm","loess")))
  ), mainPanel(tabsetPanel
               (tabPanel("Barchart",value=1,uiOutput("bar1"),ggvisOutput("bar1_ui")),
                 tabPanel("Histogram",value=2, uiOutput("hist1"), ggvisOutput("hist1-ui"),h3("Summary Statistics:"),verbatimTextOutput("summary")),
                 tabPanel("Scatterplot",value=3,uiOutput("scatter1"),ggvisOutput("scatter1_ui"), h3("Correlation:"), verbatimTextOutput("cor")),id = "tabselected"))
))

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

server <- function(input,output){
  output$distribution <- renderTable({helper_table})
  helper_table %>% ggvis(~grade,~Freq) %>% layer_bars(fill := "lightblue",width=0.8,stroke := "lightblue") %>% add_axis("y",title="frequency") %>% bind_shiny("bar1","bar1_ui")
  hist_plot <- reactive({
    xvar <- prop("x", as.symbol(input$sel_1))
    histogram <- hwdata %>%
      ggvis(x = xvar) %>%
      layer_histograms(stroke := 'white', width = input$bin, fill := "grey")
  })
  hist_plot %>% bind_shiny("hist1","hist1_ui")
  output$summary <- renderPrint({print_stats((select(dat,input$sel_1)))})
  scatter <- reactive({
    xvar <- prop("x",as.symbol(input$sel_2))
    yvar <- prop("y",as.symbol(input$sel_3))
    if (input$method == "none"){
      scatterplot <- hwdata %>% ggvis(x= xvar,y= yvar) %>% layer_points(opacity := input$opacity)}
    else {
      scatterplot <- hwdata %>% ggvis(x= xvar,y= yvar) %>% layer_points(opacity := input$opacity) %>% layer_model_predictions(model = input$method)}
  })
  scatter %>% bind_shiny("scatter1","scatter1_ui")
  output$cor <- renderText({cor(select(hwdata,input$sel_2),select(hwdaat,input$sel_3))})
}


# Run the application 
shinyApp(ui = ui, server = server)