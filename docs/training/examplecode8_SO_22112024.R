library(shiny)
library(shinyjs)
library(googlesheets4)
library(DT)

# Authenticate using the service account JSON key
gs4_auth(path = "secrets/service-account.json")

# Define the fields to save from the form (adding columns for each checkbox option)
fields <- c("name", "dob", "r_num_years", "rooms", "time_worth", "read", 
            "region", "file", "walk", "cycle", "car", "bus", "tram", "other")

SHEET_ID <- "https://docs.google.com/spreadsheets/inserthere"

# Shiny app with fields for user input
shinyApp(
  ui = fluidPage(
    useShinyjs(),  # Enable shinyjs for JavaScript capabilities
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
    ),
    tags$head(
      tags$script(src = "customjavascript.js")  # Link to the external Timer JavaScript file 
    ),
    
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
          
          
          
          # Survey Questions
          div(class = "survey-question", HTML("Name<span class='mandatory-asterisk'>*</span>")),
          div(class = "survey-input", textInput("name", label = NULL, placeholder = "Enter your name")),
          
          div(class = "survey-question", HTML("Date of Birth<span class='mandatory-asterisk'>*</span>")),
          div(class = "survey-input", dateInput("date", label = NULL, value = "2014-01-01")),
          
          div(class = "survey-question", HTML("How did you travel here today? (Tick all that apply)<span class='mandatory-asterisk'>*</span>")),
          div(class = "survey-input", checkboxGroupInput("checkGroup", label = NULL,
                                                         choices = list("Walk" = "walk", "Cycle" = "cycle", 
                                                                        "Car" = "car", "Bus" = "bus", 
                                                                        "Tram" = "tram", "Other" = "other"))),
          
          div(class = "survey-question", HTML("Number of years using R<span class='mandatory-asterisk'>*</span>")),
          div(class = "survey-input", sliderInput("r_num_years", label = NULL, min = 0, max = 25, value = 2, ticks = FALSE)),
          
          div(class = "survey-question", HTML("Approximately how long have you lived at your current address?<span class='mandatory-asterisk'>*</span>")),
          div(class = "survey-input", dateRangeInput("dates", label = NULL)),
          
          div(class = "survey-question", HTML("How many rooms does your flat/house have?<span class='mandatory-asterisk'>*</span>")),
          div(class = "survey-input", numericInput("num", label = NULL, value = 1)),
          
          div(class = "survey-question", HTML("This course seems to be worth my time<span class='mandatory-asterisk'>*</span>")),
          div(class = "survey-input", radioButtons("radio", label = NULL,
                                                   choices = list("YES!" = 1, "Not Sure" = 2, "No :(" = 3),
                                                   selected = 0)),
          
          div(class = "survey-question", HTML("Tick if you have read this message<span class='mandatory-asterisk'>*</span>")),
          div(class = "survey-input", checkboxInput("read", label = NULL, value = FALSE)),
          
          div(class = "survey-question", HTML("Select your favorite region of Scotland<span class='mandatory-asterisk'>*</span>")),
          div(class = "survey-input", selectInput("select", label = NULL,
                                                  choices = list("Highlands and Moray" = 1, "Perthshire" = 2, "North East" = 3,
                                                                 "Fife and Kinross" = 4, "Edinburgh" = 5, "Borders" = 6, 
                                                                 "South" = 7, "Galloway" = 8, "Ayrshire" = 9, "Lanarkshire" = 10, 
                                                                 "Glasgow" = 11, "Forth Valley" = 12, "Inverclyde" = 13),
                                                  selected = 1)),
          
          div(class = "survey-question", "Please provide a funny meme/cute picture of an animal (optional)"),
          div(class = "survey-input", fileInput("file", label = NULL)),
          
          # Submit button
          div(class = "submit-container",
              actionButton("submit", "Submit Survey", class = "btn-primary", onclick = "getElapsedTime()")  # Run JavaScript function on submit
          )
        ),
        
        # Thank-You Message UI (shown if consent is not given)
        conditionalPanel(
          condition = "output.showThankYou == true",
          div(class = "thank-you", "Thank you for your time. Have a great day!")
        ),
        
        # Section to show responses after submission
        DT::dataTableOutput("responses", width = "50%")
    )
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
    # Disable the submit button initially
    shinyjs::disable("submit")
    
    # Reactive expression to check if all required fields are filled
    allFilled <- reactive({
      !is.null(input$name) && input$name != "" &&
        !is.null(input$date) &&
        !is.null(input$checkGroup) && length(input$checkGroup) > 0 &&
        !is.null(input$r_num_years) &&
        !is.null(input$num) && input$num > 0 &&
        !is.null(input$radio) &&
        !is.null(input$select)
    })
    
    # Observe if all required fields are filled and enable the submit button
    observe({
      if (allFilled()) {
        shinyjs::enable("submit")
      } else {
        shinyjs::disable("submit")
      }
    })
    
    # Function to save data to Google Sheets
    save_data_gsheets <- function(data) {
      data <- data %>% as.list() %>% data.frame()  # Convert input to a data frame
      sheet_append(SHEET_ID, data)  # Append data to Google Sheet
    }
    
    # Load existing data from Google Sheets
    load_data_gsheets <- function() {
      read_sheet(SHEET_ID)
    }
    
    # Aggregate form data and handle multi-select fields
    formData <- reactive({
      # Set each travel option as 1 (selected) or 0 (not selected)
      travel_choices <- c("walk", "cycle", "car", "bus", "tram", "other")
      travel_data <- setNames(as.list(ifelse(travel_choices %in% input$checkGroup, 1, 0)), travel_choices)
      
      # Separate start and end dates
      date_start <- if (!is.null(input$dates)) input$dates[1] else NA
      date_end <- if (!is.null(input$dates)) input$dates[2] else NA
      
      # Create the final data frame
      data <- list(
        name = input$name,
        dob = input$date,
        r_num_years = input$r_num_years,
        rooms = input$num,
        time_worth = input$radio,
        read = as.numeric(input$read),  # Convert logical to numeric (1 = TRUE, 0 = FALSE)
        region = input$select,
        file = if (!is.null(input$file)) input$file$name else NA,  # Handle file name
        time_spent = input$time_spent,  # Include the time spent on the form
        address_start = date_start,
        address_end = date_end
      )
      
      # Combine data with travel_data
      data <- c(data, travel_data)
      
      # Convert list to data frame with one row
      data.frame(data)
    })
    
    # When submit button is clicked, save form data and reload responses
    observeEvent(input$submit, {
      save_data_gsheets(formData())
      
      # Refresh responses
      output$responses <- DT::renderDataTable({
        load_data_gsheets()
      })
    })
  }
)

