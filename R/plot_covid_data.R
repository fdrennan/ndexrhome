#' plot_covid_data
#'
#' @export plot_covid_data
plot_covid_data <- function() {
  parse_covid_data <- function() {
    covid_data <- read_csv("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv")
    covid_data
  }

  covid_data <- parse_covid_data()

  covid_states <-
    covid_data %>%
    group_by(state, date) %>%
    summarise_if(is.numeric, sum)

  ggplot(covid_states) +
    aes(x = date, y = cases) +
    geom_line() +
    facet_wrap(~state, scales = "free_y")
}
