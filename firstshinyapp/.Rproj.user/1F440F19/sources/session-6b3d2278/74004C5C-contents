library(shiny)

ui <- fluidPage(
  selectInput("dataset", label = "My Dataset", choices = ls("package:datasets")),
  verbatimTextOutput("summary"),
  tableOutput("table")
)

server <- function(input, output, session){
  
}

shinyApp(ui = ui, server = server)