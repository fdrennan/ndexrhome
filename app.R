library(ndexrhome)



ui <- fluidPage(
  fira_header(),
  headerPanel("ndexr"),
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      webpage_ui(id = "webpage"),
      htmlOutput("table")
    )
  )
)

server <- function(input, output, session) {
  datafile <- webpage_server("webpage")
  output$table <- renderUI({
    datafile()
  })
}

shinyApp(ui, server)
