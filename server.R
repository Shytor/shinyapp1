library(shiny)

hideAnswer <- TRUE

generate <- function(i1,i2){
    #create a random data set
    hideAnswer <<- TRUE
    ranMean <- floor(runif(1, min=68, max=72))
    ranData <- rnorm(i1, mean=ranMean, sd=i2)
}
shinyServer(
    function(input, output) {
        genData <- reactive({generate(input$val1,input$sd1)})
        
        output$newHist <- renderPlot({
            #draw a histogram
            Data <- genData()
            hist(Data, breaks=10, xlab="Random Values",col="lightgreen",main="Histogram")
            mu <- input$mu
            mse <- mean((Data - mu)^2)
            lines(c(mu, mu), c(0, 200),col="red",lwd=5)
        })
        output$tmu <- renderText({input$mu})
        output$tmse <- renderText({
            Data <- genData()
            mean((Data - input$mu)^2)
            })
        output$text3 <- renderText({
            Data <- genData()
            input$ansButton
            if (hideAnswer) isolate("Press the button for answer!")
            else isolate(paste("The correct mu is: ", mean(Data)))
        })
        observeEvent(input$ansButton, {
            hideAnswer <<- FALSE
        })
    }
)