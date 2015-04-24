data(mtcars)

cylinder <- 4
trans <- "Automatic"
weight <- 2500

mydata <- data.frame(cyl = cylinder, am = trans, wt = weight)

mtcars$am <- as.factor(mtcars$am)
levels(mtcars$am) <- c("Automatic", "Manual")
mtcars$wt <- mtcars$wt * 1000
    
lmFit <- lm(mpg ~ cyl + am + wt, data=mtcars)
mpgPrediction <- predict(lmFit, newdata = mydata)


print(mpgPrediction)
    