#' Displays the packages installed yesterday

#' @return a character vector
#' @export
#'
#' @examples
#' \dontrun{
#' # Displaying the packages installed yesterday
#' yesterday_packages()
#' }

yesterday_packages <-  function(){



  insta <- utils::installed.packages()

  insta <- as.data.frame(insta)

  packages <- insta$Package

  paths <-   unlist(purrr::map(packages, ~fs::path_package(.)))

  data <- fs::file_info(paths)


  data$modification_time <- as.Date(data$modification_time)

  yesterday_packages <- data %>%
    dplyr::filter(modification_time == Sys.Date() - 1)


  names <- fs::path_split(yesterday_packages$path) %>%
    sapply(., utils::tail, 1)



  if(length(names) == 0){

    message("No packages installed ...")
  } else {

    return(names)

  }




}

