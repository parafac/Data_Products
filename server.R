
data(mtcars)

mpgpred <- function( cylinder, trans, weight) {

    mydata <- data.frame(cyl=cylinder, am=trans, wt=weight)
    
    mtcars$am <- as.factor(mtcars$am)
    levels(mtcars$am) <- c("Automatic", "Manual")
    mtcars$wt <- mtcars$wt * 1000
    
    lmFit <- lm(mpg ~ cyl + am + wt, data=mtcars)
    mpg <- predict(lmFit, newdata = mydata)
    names(mpg) <- NULL
    
    return(mpg)
}
    
shinyServer(
    function(input, output) {
        output$outputCylinder <- renderPrint({ input$inputCylinder })
        output$outputTrans    <- renderPrint({ input$inputTrans })
        output$outputWeight   <- renderPrint({ input$inputWeight })
        output$outputPrediction <- renderPrint({ mpgpred(input$inputCylinder, input$inputTrans, input$inputWeight)})
    }
)