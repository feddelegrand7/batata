#' Remove the packages installed yesterday
#'
#' @return called for the side effect of removing the yesterday installed packages
#' @export
#'
#' @examples
#'
#' \dontrun{
#' # Removing the packages installed yesterday
#' rm_yesterday_packages()
#' }

rm_yesterday_packages <- function(){

  decision <- switch(utils::menu(choices = c("NO", "No Way!", "No !!!", "Yes", "Let me think a little bit"), title="Removing the packages that you've installed yesterday ?"),"NO", "NO", "NO", "YES", "NO")


  if (decision == "YES"){

    insta <- utils::installed.packages()

    insta <- as.data.frame(insta)

    packages <- insta$Package

    paths <-   unlist(purrr::map(packages, ~fs::path_package(.)))


    data <- fs::file_info(paths)

    data$modification_time <- as.Date(data$modification_time)


    yesterday_packages <- data %>% dplyr::filter(modification_time == Sys.Date() - 1)


    names <- fs::path_split(yesterday_packages$path) %>%
      sapply(., utils::tail, 1)

    utils::remove.packages(names)

    message(glue::glue("{names} removed ", .sep = "\n"))


  } else {


    message("Ok, think again ...")

  }




}

