#' Displays the packages installed yesterday
#' @param lib a character vector giving the library directories. Defaults to the first element in .libPaths()
#' @return a character vector
#' @export
#'
#' @examples
#' \dontrun{
#' # Displaying the packages installed yesterday
#' yesterday_packages()
#' }

yesterday_packages <-  function(lib = .libPaths()){


  # retrieving packages' paths
  pack_paths <- fs::dir_ls(lib)


  # retrieving information about the packages
  pack_info <- fs::file_info(pack_paths)


  # transforming date time format to date only
  pack_info$modification_time <- as.Date(pack_info$modification_time)

  # getting yesterday packages
  pack_yesterday <- pack_info[pack_info$modification_time == Sys.Date() - 1, ]

  # getting the names of the packages (which is the last part of the path)
  pack_names <-  sapply(fs::path_split(pack_yesterday$path), utils::tail, 1)



  if(length(pack_names) == 0){

    message("No packages installed ...")

  } else {

    return(pack_names)

  }






}

