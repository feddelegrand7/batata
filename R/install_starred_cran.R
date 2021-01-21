

#' Install Github Starred CRAN Packages
#'
#' @param github_user the Github repo user name
#' @param n the last 'n' starred repositories. Defaults to 5, in which case it will look for
#' the last 5 starred repositories, filter the R repos and install them
#' @return called for the side effect of installing the Github starred packages
#' that are available on CRAN
#'
#' @export
#' @description installs the Github starred packages from CRAN


install_starred_cran <- function(github_user, n = 5) {

  if (!is.character(github_user)) {

    stop('github user must be provided as a character string')

  }

  if(!is.numeric(n)) {

    stop("the 'n' parameter must be numeric")

  }

  data <- jsonlite::fromJSON(glue::glue("https://api.github.com/users/{github_user}/starred?per_page={n}"))

  cran_packages <- data[data$language == "R", ]$name

  cran_packages_no_na <- Filter(function(x) {!is.na(x)}, cran_packages)

  purrr::map(cran_packages_no_na,
             purrr::safely(~utils::install.packages(.x)))

}


#' Install Github Starred Packages from Github
#'
#' @param github_user the Github repo user name
#' @param n the last 'n' starred repositories. Defaults to 5, in which case it will look for
#' the last 5 starred repositories, filter the R repos and install them
#' @param upgrade whether to upgrade out of date packages. You can choose from
#' 'always' or 'never'. Defaults to 'never'. For more info,
#' see <install_github()> from the 'remote' package.
#'
#' @return called for the side effect of installing the Github starred repositories
#'
#' @export
#' @description installs the Github starred repositories from Github and not from CRAN.


install_starred_github <- function(github_user, n = 5, upgrade = "never") {

  if (!is.character(github_user)) {

    stop('github user must be provided as a character string')

  }

  if(!is.numeric(n)) {

    stop("the 'n' parameter must be numeric")

  }

  if (!(upgrade %in% c('never', 'always'))) {

    stop("upgrade takes only the following arguments: 'never' or 'always' ")

  }

  data <- jsonlite::fromJSON(glue::glue("https://api.github.com/users/{github_user}/starred?per_page={n}"))

  github_r_repos <- data[data$language == "R", ]$full_name

  github_r_repos_no_na <- Filter(function(x) {!is.na(x)}, github_r_repos)

  purrr::map(github_r_repos_no_na,
             purrr::safely(~remotes::install_github(.x, upgrade = upgrade)))

}



