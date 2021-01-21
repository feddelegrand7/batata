

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
    stop("'github_user' must be provided as a character string")
  }

  if (!is.numeric(n) || n < 1) {
    stop("the 'n' parameter must be numeric and greater than 1")
  }

  data <- jsonlite::fromJSON(glue::glue("https://api.github.com/users/{github_user}/starred?per_page={n}"))

  cran_packages <- data[data$language == "R", ]$name

  cran_packages_no_na <- Filter(function(x) {
    !is.na(x)
  }, cran_packages)

  if(length(cran_packages_no_na) == 0) {

    message("I can't find any R starred package, go starr some !")

  } else {

    combine <- function(..., sep = ", ") {
      paste(..., collapse = sep)
    }

    message(glue::glue("the following repositories, if R packages and availables on CRAN, will be installed:
                     {combine(cran_packages_no_na)}"))
    purrr::map(
      cran_packages_no_na,
      purrr::safely(~ utils::install.packages(.x))
    )

  }

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
#' @export
#' @description installs the Github starred repositories from Github and not from CRAN.


install_starred_github <- function(github_user, n = 5, upgrade = "never") {

  if (!is.character(github_user)) {
    stop("'github_user' must be provided as a character string")
  }

  if (!is.numeric(n) || n < 1) {
    stop("the 'n' parameter must be numeric and greater than 1")
  }

  if (!(upgrade %in% c("never", "always"))) {
    stop(glue::glue("upgrade takes only the following arguments:
                    - 'never'
                    - 'always'"))
  }

  data <- jsonlite::fromJSON(glue::glue("https://api.github.com/users/{github_user}/starred?per_page={n}"))

  github_r_repos <- data[data$language == "R", ]$full_name

  github_r_repos_no_na <- Filter(function(x) {
    !is.na(x)
  }, github_r_repos)

  if (length(github_r_repos_no_na) == 0) {

    message("I can't find any R starred package, go starr some !")

  } else {

    combine <- function(..., sep = ", ") {
      paste(..., collapse = sep)
    }

    message(glue::glue("the following repositories, if R packages, will be installed:
                     {combine(github_r_repos_no_na)}"))
    purrr::map(
      github_r_repos_no_na,
      purrr::safely(~ remotes::install_github(.x, upgrade = upgrade))
    )


  }


}

#' Install the most starred CRAN packages
#'
#' @param n the most starred starred CRAN packages. Defaults to 10.
#' in this case the function will look at the 10 most starred R repo and install them
#' if available on CRAN.
#'
#' @return called for the side effect of installing most starred CRAN packages
#' @export
#'


install_most_starred <- function(n = 10) {
  if (!is.numeric(n) || n < 1) {
    stop("the 'n' parameter must be numeric and greater than 1")
  }


  data <- jsonlite::fromJSON(glue::glue("https://api.github.com/search/repositories?q=language:R&sort=stars&order=desc&per_page={n}"))

  data <- as.data.frame(data)

  most_starred <- data$items.name

  most_starred_no_na <- Filter(function(x) {
    !is.na(x)
  }, most_starred)


  combine <- function(..., sep = ", ") {
    paste(..., collapse = sep)
  }

  message(glue::glue("the following repositories, if availables on CRAN, will be installed:
                     {combine(most_starred_no_na)}"))

  purrr::map(
    most_starred_no_na,
    purrr::safely(~ utils::install.packages(.x))
  )
}
