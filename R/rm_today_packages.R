#' Remove the packages installed in the current day
#'
#' @return called for the side effect of removing the today installed packages
#' @export
#'
#' @examples
#'
#' \dontrun{
#'
#' # Removing the packages installed today
#'
#' rm_today_packages()
#' }

rm_today_packages <- function(){

  decision <- switch(utils::menu(choices = c("NO", "No Way!", "No !!!", "Yes", "Let me think a little bit"), title="Removing the packages that you've installed today ?"),"NO", "NO", "NO", "YES", "NO")


  if (decision == "YES"){

    insta <- utils::installed.packages()

    insta <- as.data.frame(insta)

    packages <- insta$Package

    paths <-   unlist(purrr::map(packages, ~fs::path_package(.)))


    data <- fs::file_info(paths)

    data$modification_time <- as.Date(data$modification_time)


    today_packages <- data %>% dplyr::filter(modification_time == Sys.Date())

    names <- fs::path_split(today_packages$path) %>% sapply(., utils::tail, 1)

    utils::remove.packages(names)

    message(glue::glue("{names} removed ", .sep = "\n"))


  } else {


    message("Ok, think again ...")

  }




}

