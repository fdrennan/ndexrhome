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
      box(textInput(ns("url_name"), "Url Name"), width = 6),
      box(textInput(ns("url"), "Url"), width = 6)
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
        box(tags$a(href = input$url, input$url_name), width = 12)
      })
      dataframe
    }
  )
}
