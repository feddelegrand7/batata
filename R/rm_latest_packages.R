#' Remove a specific number of the latest installed R package
#'
#' @param n the last number of installed packages to remove
#' @return called for the side effect of removing the n latest installed packages
#' @export
#'
#' @examples
#'
#' \dontrun{
#'
#' # Removing the last 10 installed packages
#'
#' rm_latest_packages(n = 10)
#'
#' }


rm_latest_packages <- function(n){

  decision <- switch(utils::menu(
    choices = c("NO", "No Way!", "No !!!", "Yes", "Let me think a little bit"),
    title= glue::glue("Removing the last {n} installed packages ?")),
    "NO", "NO", "NO", "YES", "NO")


  if (decision == "YES"){

    insta <- utils::installed.packages()

    insta <- as.data.frame(insta)

    packages <- insta$Package

    paths <-   unlist(purrr::map(packages, ~fs::path_package(.)))


    data <- fs::file_info(paths)


    last_packages <- data %>% dplyr::arrange(dplyr::desc(modification_time)) %>% utils::head(., n)

    last_packages$path

    fs::dir_delete(last_packages$path)

  } else {


    message("Ok, think again ...")

  }




}

