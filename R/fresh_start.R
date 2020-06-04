#' Remove all the installed R packages from a specified library
#'
#' @param lib a character vector giving the library directories. Defaults to the first element in .libPaths()
#' @return called for the side effect of removing all installed packages
#' @export
#'
#' @examples
#'
#' \dontrun{
#'
#' # DANGER: THE FUNCTION REMOVES ALL THE PACKAGES
#'
#' fresh_start()
#'
#' }


fresh_start <- function(lib = .libPaths()){

  decision <- switch(utils::menu(choices = c("NO", "No Way!", "No !!!", "Yes", "Let me think a little bit"),
                   title="Do you really want to remove all your packages ?"),"NO", "NO", "NO", "YES", "NO")


  if (decision == "YES"){

    decision2 <- switch(utils::menu(choices = c("NO", "No Way!", "No !!!", "Yes", "Let me think a little bit"),
                                   title="Are you really really really sure about it ?"),"NO", "NO", "NO", "YES", "NO")


  }

  if(decision2 == "YES"){


    # retrieving packages' paths
    pack_paths <- fs::dir_ls(lib)


    # getting the names of the packages (which is the last part of the path)
    pack_names <-  sapply(fs::path_split(pack_paths), utils::tail, 1)

    # removing the packages
    utils::remove.packages(pack_names, lib)




  } else {

    message("Ok, think again ...")

  }


}





