# Load the Shiny library

library(shiny)

# Define UI

ui <- fluidPage(
  
  # App title
  
  titlePanel("Basic Shiny App Example"),
  
  # Sidebar layout with input and output
  
  sidebarLayout(
    
    # Sidebar for slider input
    
    sidebarPanel(
      
      sliderInput("num", 
                  
                  "Choose a number:", 
                  
                  min = 1, 
                  
                  max = 100, 
                  
                  value = 50)
      
    ),
    
    # Main panel to display the result
    
    mainPanel(
      
      textOutput("result")
      
    )
    
  )
  
)

# Define server logic

server <- function(input, output) {
  
  # Multiply the chosen number by 2 and display it
  
  output$result <- renderText({
    
    paste("Your number multiplied by 2 is:", input$num * 2)
    
  })
  
}

# Run the application

shinyApp(ui = ui, server = server)