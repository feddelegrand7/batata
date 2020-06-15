#' Remove the packages installed yesterday
#'
#' @param lib a character vector giving the library directories. Defaults to the first element in .libPaths()
#' @return called for the side effect of removing the yesterday installed packages
#' @export
#'
#' @examples
#'
#' \dontrun{
#' # Removing the packages installed yesterday
#' rm_yesterday_packages()
#' }

rm_yesterday_packages <- function(lib = .libPaths()){

  decision <- switch(utils::menu(choices = c("NO", "No Way!", "No !!!", "Yes", "Let me think a little bit"), title="Removing the packages that you've installed yesterday ?"),"NO", "NO", "NO", "YES", "NO")


  if (decision == "YES"){

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


    # removing packages
    fs::dir_delete(pack_yesterday$path)


    message(glue::glue("{pack_names} removed ~~~o_o~~~ "))


  } else {


    message("Ok, think again ...")

  }




}

