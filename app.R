library(ndexrhome)

ui <- dashboardPage(
  # fira_header(),
  dashboardHeader(title = "ndexr"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("README", tabName = "readme", icon = icon("info")),
      menuItem("Widgets", tabName = "widgets", icon = icon("th"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(
        tabName = "readme",
        fluidRow(
          box(includeMarkdown("README.md"), width = 12)
        )
      ),
      tabItem(
        tabName = "widgets",
        fluidRow(
          webpage_ui(id = "webpage"),
          htmlOutput("table")
        )
      )
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
