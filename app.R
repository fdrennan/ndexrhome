library(ndexrhome)

# https://shiny.rstudio.com/articles/modules.html
# Module UI function
webpage_ui <- function(id, label = "Webpage") {
  # `NS(id)` returns a namespace function, which was save as `ns` and will
  # invoke later.
  ns <- NS(id)

  tagList(
    textInput(ns("url"), label),
  )
}

webpage_server <- function(id) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output, session) {
      # The selected file, if any
      userFile <- reactive({
        # If no file is selected, don't do anything
        validate(need(input$url, message = FALSE))
        input$url
      })

      # The user's data, parsed into a data frame
      dataframe <- reactive({
        readr::read_csv(userFile())
      })

      # We can run observers in here if we want to
      observe({
        msg <- sprintf("File %s was uploaded", userFile())
        cat(msg, "\n")
      })

      # Return the reactive that yields the data frame
      return(dataframe)
    }
  )
}

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      dataTableOutput("table"),
      webpage_ui(id = "webpage")
    )
  )
)

server <- function(input, output, session) {
  output$table <- renderDataTable({
    datafile()
  })

  datafile <- webpage_server("webpage")
  output$table <- renderDataTable({
    datafile()
  })
}

shinyApp(ui, server)
