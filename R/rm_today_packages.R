#' Remove the packages installed in the current day
#'
#' @param lib a character vector giving the library directories. Defaults to the first element in .libPaths()
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

rm_today_packages <- function(lib = .libPaths()){

  decision <- switch(utils::menu(choices = c("NO", "No Way!", "No !!!", "Yes", "Let me think a little bit"), title="Removing the packages that you've installed today ?"),"NO", "NO", "NO", "YES", "NO")


  if (decision == "YES"){


    pack_paths <- fs::dir_ls(lib)

    mod_time <- file.mtime(pack_paths)

    mod_time <- as.Date(lubridate::ymd_hms(mod_time))

    data <- data.frame(pack_paths, mod_time)

    # getting today packages
    pack_today <- data[data$mod_time == Sys.Date(), ]


    pack_names <-  sapply(fs::path_split(pack_today$pack_paths), utils::tail, 1)


    # removing the packages' directory
    utils::remove.packages(pack_names)


    # getting the names of the packages (which is the last part of the path)


    message(glue::glue("{pack_names} removed ~~~o_o~~~ "))


  } else {


    message("Ok, think again ...")

  }




}

