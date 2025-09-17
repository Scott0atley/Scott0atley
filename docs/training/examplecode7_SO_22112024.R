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
        
        # Consent Screen UI
        conditionalPanel(
          condition = "output.showConsentScreen == true",
          h2("Survey Consent Form", align = "center"),
          p("Thank you for considering participating in our survey. This survey is designed to understand your preferences and experiences."),
          p("Your responses will be anonymized and used solely for academic purposes. Please indicate if you are comfortable proceeding."),
          checkboxInput("consent", "I agree to participate in the survey and understand my data will be anonymized.", value = FALSE),
          actionButton("consent_submit", "Continue", class = "btn-primary")
        ),
        
        # Survey Form UI (shown after consent)
        conditionalPanel(
          condition = "output.showSurveyForm == true",
          h2("Survey Form", align = "center"),
          
        useShinyjs(),  # Enable shinyjs for JavaScript capabilities
        tags$head(
          tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
        ),
        tags$head(
          tags$script(src = "customjavascript.js")  # Link to the external Timer JavaScript file 
        ),
        
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
        # Thank-You Message UI (shown if consent is not given)
        conditionalPanel(
          condition = "output.showThankYou == true",
          div(class = "thank-you", "Thank you for your time. Have a great day!")
        ),
        DT::dataTableOutput("responses", width = 300), tags$hr(),
        
    ),
  ),
  
  server = function(input, output, session) {
    
    # Flags to manage screen visibility
    showConsentScreen <- reactiveVal(TRUE)
    showSurveyForm <- reactiveVal(FALSE)
    showThankYou <- reactiveVal(FALSE)
    
    # Update output to reflect flags
    output$showConsentScreen <- reactive(showConsentScreen())
    output$showSurveyForm <- reactive(showSurveyForm())
    output$showThankYou <- reactive(showThankYou())
    outputOptions(output, "showConsentScreen", suspendWhenHidden = FALSE)
    outputOptions(output, "showSurveyForm", suspendWhenHidden = FALSE)
    outputOptions(output, "showThankYou", suspendWhenHidden = FALSE)
    
    # Consent button handling
    observeEvent(input$consent_submit, {
      if (input$consent) {
        showConsentScreen(FALSE)
        showSurveyForm(TRUE)
      } else {
        showConsentScreen(FALSE)
        showThankYou(TRUE)
      }
    })
    
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