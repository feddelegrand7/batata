#' Displays installed packages according to a specific date
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

since_packages <- function(date, position){


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



  if(length(names) == 0){

    message("No packages installed ...")
  } else {

    return(names)

  }




}

