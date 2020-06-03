#' Displays the packages installed in the current day
#' @return a character vector
#' @export
#'
#' @examples
#' \dontrun{
#' # Displaying the packages installed today
#' today_packages()
#' }

today_packages <- function(){


    insta <- utils::installed.packages()

    insta <- as.data.frame(insta)

    packages <- insta$Package

    paths <-   unlist(purrr::map(packages, ~fs::path_package(.)))

    data <- fs::file_info(paths)


    data$modification_time <- as.Date(data$modification_time)

    today_packages <- data %>% dplyr::filter(modification_time == Sys.Date())



    names <- fs::path_split(today_packages$path) %>% sapply(., utils::tail, 1)



    if(length(names) == 0){

      message("No packages installed ...")
    } else {

      return(names)

    }




}

