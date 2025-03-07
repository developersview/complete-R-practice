library(shiny)

ui <- fluidPage(
  dateInput("dob", "When are you born?"),
  dateRangeInput("holiday", "Update your leave plan here")
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)