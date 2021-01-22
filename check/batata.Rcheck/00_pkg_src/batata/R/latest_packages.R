
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


  if (!is.numeric(n)) {

    stop(paste0("'n' must be numeric not ", typeof(n)))

  }

  if (!length(n) == 1) {

    stop(paste0("'n' must be of length 1 not ", length(n)))

  }

  if (n < 1) {

    stop(" 'n' must be greater or equal than 1")

  }





  pack_paths <- fs::dir_ls(lib)

  mod_time <- file.mtime(pack_paths)

  data <- data.frame(pack_paths, mod_time)


  pack_latest <- utils::head(data[rev(order(data$mod_time)), ], n)


  # getting the names of the packages (which is the last part of the path)
  pack_names <-  sapply(fs::path_split(pack_latest$pack_paths), utils::tail, 1)



  data.frame(packages = pack_names,
            modification_time = pack_latest$mod_time)




  }

