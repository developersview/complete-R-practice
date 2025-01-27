library(shiny)

ui <- fluidPage(
  sliderInput("x", label = "If x is", min = 1, max = 50, value = 30),
  textOutput("product")
)

server <- function(input, output, session) {
  output$product <- renderText({
    paste0("then x times 5 is: ", input$x * 5)
  })
}

shinyApp(ui, server)