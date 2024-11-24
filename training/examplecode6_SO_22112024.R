library(shiny)
library(shinyjs)
library(googlesheets4)
library(DT)

# Authenticate using the service account JSON key
gs4_auth(path = "secrets/service-account.json")

# Define the fields to save from the form
fields <- c("name", "read", "r_num_years")

SHEET_ID <- "https://docs.google.com/spreadsheets/d/1rhSUw2H-SQb66Wd3eBjHeRa-ZUnyS8N91YR9y13ln38/edit?gid=0#gid=0"


# Shiny app with fields for user input

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
      sheet_append(SHEET_ID, data)
    }
    
    # Load existing data from Google Sheets
    
    load_data_gsheets <- function() {
      data <- read_sheet(SHEET_ID)
      if (nrow(data) == 0) {
        data <- data.frame(matrix(ncol = length(fields), nrow = 0))
        colnames(data) <- fields
      }
      data
    }
    
    # Aggregate form data
    
    formData <- reactive({
      data <- sapply(fields, function(x) if (!is.null(input[[x]])) input[[x]] else NA)
      as.data.frame(t(data))  # Convert to a one-row data frame
    })
    
    
    # When submit button is clicked, save form data
    
    observeEvent(input$submit, {
      
      save_data_gsheets(formData())
      
    })
    
    # Show the previous responses in the DataTable
    
    output$responses <- DT::renderDataTable({
      input$submit
      load_data_gsheets()
    }, options = list(pageLength = 5))
    
  }
)