library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Mu Guessed It!"),
    sidebarPanel(
        numericInput('val1', 'How many values?', 50, min = 50, max = 150, step = 10),
        numericInput('sd1', 'Standard Deviation', 10, min = 1, max = 20, step = 1),
        sliderInput('mu','Use this slider to guess the mean',value = 70, min = 65, max = 75, step = 0.05,),
        actionButton("ansButton", "Get Answer"),
        h3('Instructions:'),
        p('Adjusting the values or the standard deviation creates a new set of random (normal) data values. You may choose from 50 to 150 values with standard deviation from 1 to 20.'),
        p('Then, use the slider to guess the mean of the data set. Click the Get Answer button to check your guess!')
    ),
    mainPanel(
        h3('Histogram of Random values'),
        plotOutput('newHist'),
        p('Mu Guess'),
        textOutput('tmu'),
        p('MSE'),
        textOutput('tmse'),
        textOutput('text3')
    )
))