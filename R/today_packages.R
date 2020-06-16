#' Displays the packages installed in the current day
#' @param lib a character vector giving the library directories. Defaults to the first element in .libPaths()
#' @return a character vector
#' @export
#'
#' @examples
#' \dontrun{
#' # Displaying the packages installed today
#' today_packages()
#' }

today_packages <- function(lib = .libPaths()){


  pack_paths <- fs::dir_ls(lib)

  mod_time <- file.mtime(pack_paths)

  mod_time <- as.Date(lubridate::ymd_hms(mod_time))

  data <- data.frame(pack_paths, mod_time)

  # getting today packages
  pack_today <- data[data$mod_time == Sys.Date(), ]

  # getting the names of the packages (which is the last part of the path)
  pack_names <-  sapply(fs::path_split(pack_today$pack_paths), utils::tail, 1)



    if(length(pack_names) == 0){

      message("No packages installed ...")

    } else {

      return(pack_names)

    }




}

