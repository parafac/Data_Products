
# Predicting MPG Based on Cylinder, Transmission, and Weight

## Introduction

For the Coursera Developing Data Products course, 
we develop a prediction web tool using RStudio Shiny package. It uses the very 
simple linear regression model to predict vehicle's
miles per gallon (MPG) in terms of number of cylinders, automatic or manual
transmission, and the weight (in lb).

## Data

We use the mtcars data set comes with R. 
The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel
consumption and 10 aspects of automobile design and performance for 32 automobiles 
(1973-74 models). The Data size is small so the response time is fast, and is a 
good fit for interactive Shiny app. Additional information about this data set
can be found in
http://stat.ethz.ch/R-manual/R-devel/library/datasets/html/mtcars.html.

## Prediction Algorithm

The prediction algorithm we use is the simple linear regression. The focus of
this exercise is on building interactive web tool using shiny package, not on
the start-of-the-art prediction algorithm.

```r
data(mtcars)
mpgpred <- function( cylinder, trans, weight) {
    mydata <- data.frame(cyl=cylinder, am=trans, wt=weight)    
    mtcars$am <- as.factor(mtcars$am)
    levels(mtcars$am) <- c("Automatic", "Manual")
    mtcars$wt <- mtcars$wt * 1000    
    lmFit <- lm(mpg ~ cyl + am + wt, data=mtcars)
    mpg <- predict(lmFit, newdata=mydata)
    names(mpg) <- NULL
    
    return(mpg)
}
```


## Shiny Web Tool

The interactive web tool is hosted at http://parafac.shinyapps.io/shiny/.

The Widgets for user interaction inclusion

- Sliding bar
- Radio button
- Numeric input
- Submit button

The display panel shows 

- User inputs (echo)
- Prediction result 

An User will move the sliding bar to slect the number of cylinders of the 
vehicle's engine. The number is either 4, 6 or 8. 
Two radio buttons are for choices between Automatic or Manual transmission.
Vehicle's weight in lb can be selected or input in the numeric input box. 
When the selection is done, user click the submit button to run the prediction
algorithm and see the result on the right-hand-side panel.
