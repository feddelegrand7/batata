#' Remove the n latest installed R packages
#'
#' @param n the last number of installed packages to remove. Default to 1 for the last installed package
#' @param lib a character vector giving the library directories. Defaults to the first element in .libPaths()
#' @return called for the side effect of removing the n latest installed packages
#' @export
#'
#' @examples
#'
#' \dontrun{
#'
#' # Removing the last 10 installed packages
#'
#' rm_latest_packages(n = 10)
#'
#' }


rm_latest_packages <- function(n = 1, lib = .libPaths()){

  decision <- switch(utils::menu(
    choices = c("NO", "No Way!", "No !!!", "Yes", "Let me think a little bit"),
    title= glue::glue("Removing the last {n} installed packages ?")),
    "NO", "NO", "NO", "YES", "NO")


  if (decision == "YES"){

    # retrieving packages' paths
    pack_paths <- fs::dir_ls(lib)


    # retrieving information about the packages
    pack_info <- fs::file_info(pack_paths)



    pack_latest <- utils::head(pack_info[rev(order(pack_info$modification_time)), ], n)




    # getting the names of the packages (which is the last part of the path)
    pack_names <-  sapply(fs::path_split(pack_latest$path), utils::tail, 1)



    # removing the packages directory
    fs::dir_delete(pack_latest$path)



    message(glue::glue("{pack_names} removed ~~~o_o~~~ "))


  } else {


    message("Ok, think again ...")

  }




}

