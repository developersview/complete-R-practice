library(shiny)

# UI Section
ui <- fluidPage(
  textInput("name", "What's your name?"),  # Input for the user's name
  textOutput("greeting")                  # Output to display the greeting
)

# Server Section
server <- function(input, output, session) {
  output$greeting <- renderText({          # Render a greeting message
    paste0("Hello ", input$name)
  })
}

# Run the app
shinyApp(ui, server)
