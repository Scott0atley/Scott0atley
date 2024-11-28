library(shiny)

# Shiny app with fields for user input

shinyApp(
  
  ui = fluidPage(
    
    textInput("name", "Name", ""),
    
    checkboxInput("used_shiny", "I've built a Shiny app in R before", FALSE),
    
    sliderInput("r_num_years", "Number of years using R", 0, 25, 2, ticks = FALSE),
    
    dateInput("date", "Date of Birth", value = "2014-01-01"),
    
    checkboxGroupInput("checkGroup", "How did you get to work today?",
                       
                       choices = list("Walk" = "walk", "Cycle" = "cycle", 
                                      
                                      "Car" = "car", "Bus" = "bus", 
                                      
                                      "Tram" = "tram", "Other" = "other")),
    
    dateRangeInput("dates", "How long have you lived in current flat/house?"),
    
    numericInput("num", "Number of Rooms in Flat/House", value = 1),
    
    radioButtons("radio", "Are you enjoying yourself?",
                 
                 choices = list("YES!" = 1, "Not Sure" = 2, "No :(" = 3),
                 
                 selected = 0),
    
    checkboxInput("read", "Tick this box if you are completing the survey properly", value = FALSE),
    
    selectInput("select", "What is your favourite area of Scotland?",
                
                choices = list("Highlands and Moray" = 1, "Perthshire" = 2, "North East" = 3,
                               
                               "Fife and Kinross" = 4, "Edinburgh" = 5, "Borders" = 6, 
                               
                               "South" = 7, "Galloway" = 8, "Ayrshire" = 9, "Lanarkshire" = 10, 
                               
                               "Glasgow" = 11, "Forth Valley" = 12, "Inverclyde" = 13),
                
                selected = 1),
    
    fileInput("file", "Upload a funny meme here"),
    
    # Submit button
    
    actionButton("submit", "Submit Survey"),  # Run JavaScript function on submit
    
  ),
  
  server = function(input, output, session) {
    
  })