#' fira_header
#'
#' @export fira_header
fira_header <- function() {
  tags$head(
    tags$style(HTML("
      @import url('https://fonts.googleapis.com/css2?family=Fira+Sans:wght@100;200&display=swap');

      h1 {
        font-family: 'Fira Sans', sans-serif;
        font-weight: 500;
        line-height: 1.1;
        color: black;
      }

    "))
  )
}
