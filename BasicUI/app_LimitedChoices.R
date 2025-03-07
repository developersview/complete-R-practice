library(shiny)

animals <- c("Dog", "Cat", "Lion", "Tiger", 
             "Giraffe", "Zebra", "Rabbit", "Elephant",
             "I hate animals"
             )

ui <- fluidPage(
  selectInput("state", "Enter your state:", state.name),
  
  radioButtons("animal","What is your favorite animal?", animals),
  
  radioButtons("rb", "Choose one emoji:",
    choiceNames = list(
      icon("angry"),
      icon("smile"),
      icon("sad-tear")
    ),
    choiceValues = list("angry", "happy", "sad")
  ),
  
  selectInput(
    "state", "Enter your state name:", state.name, multiple = TRUE
  ),
  
  checkboxGroupInput("animals", "What animals do you like?", animals),
  
  checkboxInput("cleanup", "Clean Up?", value = TRUE),
  checkboxInput("shutdown", "Shutdown?"),
  
  
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)