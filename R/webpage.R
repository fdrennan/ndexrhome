#' webpage_ui
#'
#' @param id  To Write
#' @param label To Write
#'
#' @export webpage_ui
webpage_ui <- function(id, label = "Webpage") {
  # `NS(id)` returns a namespace function, which was save as `ns` and will
  # invoke later.
  ns <- NS(id)
  tagList(
    fluidRow(
      box(textInput(ns("url"), "Url"), width = 6),
    )
  )
}

#' webpage_server
#'
#' @param id
#'
#' @export webpage_server
webpage_server <- function(id) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output, session) {
      dataframe <- reactive({
        box(title = input$url, tags$a(href = input$url, input$url), width = 2)
      })
      dataframe
    }
  )
}
