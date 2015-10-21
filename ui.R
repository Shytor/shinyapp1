library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Mu Guessed It!"),
    sidebarPanel(
        numericInput('val1', 'How many values?', 50, min = 50, max = 150, step = 10),
        numericInput('sd1', 'Standard Deviation', 10, min = 1, max = 20, step = 1),
        h3('Use the slider to guess the mu value'),
        sliderInput('mu', 'Guess the mean',value = 70, min = 65, max = 75, step = 0.05,),
        actionButton("ansButton", "Get Answer")
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