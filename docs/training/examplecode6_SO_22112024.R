library(shiny)
library(shinyjs)
library(googlesheets4)
library(DT)

# Authenticate using the service account JSON key

gs4_auth(path = "secrets/service-account.json")

# Define the fields to save from the form

fields <- c("name", "used_shiny", "r_num_years")

SHEET_ID <- "https://docs.google.com/spreadsheets/inserthere"

# Shiny app with fields for user input

shinyApp(
  
  ui = fluidPage(
    div(class = "survey-container",
    
    useShinyjs(),  # Enable shinyjs for JavaScript capabilities
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
    ),
    tags$head(
      tags$script(src = "customjavascript.js")  # Link to the external Timer JavaScript file 
    ),
    
    DT::dataTableOutput("responses", width = 300), tags$hr(),
    
    div(class = "survey-question", HTML("Name<span class='mandatory-asterisk'>*</span>")),
    div(class = "survey-input", textInput("name", label = NULL, placeholder = "Enter your name")),
    
    div(class = "survey-question", HTML("Tick if you have read this message<span class='mandatory-asterisk'>*</span>")),
    div(class = "survey-input", checkboxInput("read", label = NULL, value = FALSE)),
    
    div(class = "survey-question", HTML("Number of years using R<span class='mandatory-asterisk'>*</span>")),
    div(class = "survey-input", sliderInput("r_num_years", label = NULL, min = 0, max = 25, value = 2, ticks = FALSE)),
    
    div(class = "submit-container",
        actionButton("submit", "Submit Survey", class = "btn-primary")  
    )   
    ),
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