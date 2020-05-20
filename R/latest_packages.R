
#' Displaying the latest installed R packages
#'
#' @param n the number of the last installed packages to display (n = 1) will return the last installed package
#'
#' @return a data frame
#' @export
#'
#' @examples
#' \dontrun{
#'
#' # Displaying the last 10 installed packages
#' latest_packages(10)
#'
#' }



latest_packages <- function(n){


  insta <- utils::installed.packages()

  insta <- as.data.frame(insta)

  packages <- insta$Package

  paths <-   unlist(purrr::map(packages, ~fs::path_package(.)))

  data <- fs::file_info(paths)

  latest <- data %>% dplyr::arrange(dplyr::desc(modification_time)) %>% utils::head(., n )

  names <- fs::path_split(latest$path) %>% sapply(., utils::tail, 1)

  as.data.frame(cbind(packages = names, installation_time = as.character(latest$birth_time)))




  }

