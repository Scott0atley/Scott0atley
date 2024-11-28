library(shiny)
library(googlesheets4)

# Shiny app with fields for user input

fields <- c("name", "used_shiny", "r_num_years")

SHEET_ID <- "insert your sheets url here"


shinyApp(
  
  ui = fluidPage(
    
    DT::dataTableOutput("responses", width = 300), tags$hr(),
    
    textInput("name", "Name", ""),
    
    checkboxInput("used_shiny", "I've built a Shiny app in R before", FALSE),
    
    sliderInput("r_num_years", "Number of years using R", 0, 25, 2, ticks = FALSE),
    
    actionButton("submit", "Submit")
    
  ),
  
  server = function(input, output, session) {
    
    # Function to save data to Google Sheets
    
    save_data_gsheets <- function(data) {
      
      data <- data %>% as.list() %>% data.frame()   # Convert input to a data frame
      
      sheet_append(SHEET_ID, data)  # Append data to Google Sheet
      
    }
    
    # Load existing data from Google Sheets
    
    load_data_gsheets <- function() {
      
      read_sheet(SHEET_ID)
      
    }
    
    # Aggregate form data
    
    formData <- reactive({
      
      data <- sapply(fields, function(x) input[[x]])
      
      data
      
    })
    
    # When submit button is clicked, save form data
    
    observeEvent(input$submit, {
      
      save_data_gsheets(formData())
      
    })
    
    # Show the previous responses in the DataTable
    
    output$responses <- DT::renderDataTable({
      
      input$submit
      
      load_data_gsheets()
      
    })
    
  }
  
)