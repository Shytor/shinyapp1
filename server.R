library(shiny)

hideAnswer <- TRUE

generate <- function(i1,i2){
    #create a random data set
    hideAnswer <<- TRUE
    ranData <- rnorm(i1, mean=70, sd=i2)
}
shinyServer(
    function(input, output) {
        genData <- reactive({generate(input$val1,input$sd1)})
        
        output$newHist <- renderPlot({
            #draw a histogram
            Data <- genData()
            hist(Data, breaks=10, xlab="Random Values",col="lightgreen",main="Histogram")
            mu <- input$mu
            mse <- mean((ranData - mu)^2)
            lines(c(mu, mu), c(0, 200),col="red",lwd=5)
        })
        output$tmu <- renderText({input$mu})
        output$tmse <- renderText({mean((ranData - input$mu)^2)})
        output$text3 <- renderText({
            genData()
            input$ansButton
            if (hideAnswer) isolate("Press the button for answer!")
            else isolate(paste("The correct mu is: ", mean(ranData)))
        })
        observeEvent(input$ansButton, {
            hideAnswer <<- FALSE
        })
    }
)