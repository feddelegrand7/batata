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

  if (!is.numeric(n)) {

    stop(paste0("'n' must be numeric not ", typeof(n)))

  }

  if (!length(n) == 1) {

    stop(paste0("'n' must be of length 1 not ", length(n)))

  }

  if (n < 1) {

    stop(" 'n' must be greater or equal than 1")

  }



  decision <- switch(utils::menu(
    choices = c("NO", "No Way!", "No !!!", "Yes", "Let me think a little bit"),
    title= glue::glue("Removing the last {n} installed packages ?")),
    "NO", "NO", "NO", "YES", "NO")


  if (decision == "YES"){

    pack_paths <- fs::dir_ls(lib)

    mod_time <- file.mtime(pack_paths)

    data <- data.frame(pack_paths, mod_time)


    pack_latest <- utils::head(data[rev(order(data$mod_time)), ], n)


    # getting the names of the packages (which is the last part of the path)
    pack_names <-  sapply(fs::path_split(pack_latest$pack_paths), utils::tail, 1)


    # removing the packages
    utils::remove.packages(pack_names)



    message(glue::glue("{pack_names} removed ~~~o_o~~~ "))


  } else {


    message("Ok, think again ...")

  }




}

