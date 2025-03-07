library(shiny)

ui <- fluidPage(
  sliderInput("x", label = "If x is", min = 1, max = 100, value = 50),
  sliderInput("y", label = "If y is", min = 1, max = 50, value = 30),
  textOutput("product")
)

server <- function(input, output, session) {
  output$product <- renderText({
    paste0("then x times y is: ", input$x * input$y)
  })
}

shinyApp(ui, server)