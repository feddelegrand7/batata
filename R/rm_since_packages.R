#' removes installed packages according to a specific date
#'
#' @param date the date of interest in yyyy-mm-dd format
#' @param position takes three arguments "at", "before" or "after". "at" displays the packages installed at the chosen date, "before" before that date and "after" after that date)
#' @return a character vector
#'
#' @export
#'
#' @examples
#' \dontrun{
#' # Displaying the packages installed today
#' today_packages()
#' }

rm_since_packages <- function(date, position){


  decision <- switch(utils::menu(choices = c("NO", "No Way!", "No !!!", "Yes", "Let me think a little bit"), title= glue::glue("Removing the packages that you've installed {position} {date} ?")),"NO", "NO", "NO", "YES", "NO")

  if (decision == "YES"){

  insta <- utils::installed.packages()

  insta <- as.data.frame(insta)

  packages <- insta$Package

  paths <-   unlist(purrr::map(packages, ~fs::path_package(.)))

  data <- fs::file_info(paths)



  data$birth_time <- as.Date(data$birth_time)

  today_packages <- data %>% dplyr::filter(birth_time == Sys.Date())


  data$modification_time <- as.Date(data$modification_time)

  if(position == "at"){

    packages <- data %>% dplyr::filter(modification_time == as.Date(date))

  } else if (position == "before") {

    packages <- data %>% dplyr::filter(modification_time < as.Date(date))


  } else {

    packages <- data %>% dplyr::filter(modification_time > as.Date(date))

  }


  names <- fs::path_split(packages$path) %>% sapply(., utils::tail, 1)


  utils::remove.packages(names)

  message(glue::glue("{names} removed ", .sep = "\n"))} else {

    message("All right, think again ...")

  }





}

