
#' Displaying the latest installed R packages
#'
#' @param n the number of the last installed packages to display. Default to n = 1,  will return the last installed package
#'
#' @param lib a character vector giving the library directories. Defaults to the first element in .libPaths()
#'
#' @return a data frame
#' @export
#'
#' @examples
#' \dontrun{
#'
#' # Displaying the last 10 installed packages
#' latest_packages(10)
#'
#' }



latest_packages <- function(n = 1, lib = .libPaths()){

  # retrieving packages' paths
  pack_paths <- fs::dir_ls(lib)


  # retrieving information about the packages
  pack_info <- fs::file_info(pack_paths)



  pack_latest <- head(pack_info[rev(order(pack_info$modification_time)), ], n)


  # getting the names of the packages (which is the last part of the path)
  pack_names <-  sapply(fs::path_split(pack_latest$path), utils::tail, 1)



  as.data.frame(cbind(packages = pack_names, modification_time = as.character(pack_latest$modification_time)))




  }

