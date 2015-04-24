require(markdown)

shinyUI(pageWithSidebar(
    headerPanel("Prediction of MPG Based on Cylinder, Transmission, and Weight"),
    
    sidebarPanel(
        h3("Set Parameter Values"),
        
        # slide bar for Cylinder
        sliderInput("inputCylinder", "Number of Cylinders:", min = 4, max = 8, value = 4, 
                    step = 2, round = TRUE),
        
        # radio button for transmission choices
        radioButtons("inputTrans", "Transmission Type:",
                     choices = list("Automatic" = "Automatic", "Manual" = "Manual")),
        
        # numeric input for vehicle weight
        numericInput("inputWeight", "Vehicle Weight (lb):", 1500, min = 1500, max = 5500, 
                     step = 50),
        
        # a submit button
        submitButton("Submit"),
        
        h3("Instruction"),
        includeMarkdown("instruction.md")
    ),
    
    mainPanel(
        h3("Your Input:"),
        h4("Number of Cylinders:"),
        verbatimTextOutput("outputCylinder"),
        h4("Transmission Type:"),
        verbatimTextOutput("outputTrans"),
        h4("Vehicle Weight:"),
        verbatimTextOutput("outputWeight"),
        h3("Which Resulted in a MPG Prediction"),
        verbatimTextOutput("outputPrediction"),
        h3("Note:"),
        includeMarkdown("include.md")
    )
))


# a select input
selectInput('x4', 'X4', choices = list(
    Eastern = c(`New York` = 'NY', `New Jersey` = 'NJ'),
    Western = c(`California` = 'CA', `Washington` = 'WA')
), selectize = FALSE)