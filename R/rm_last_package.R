
#' Remove the latest installed R package
#'
#' @return called for the side effect of removing the last installed package
#' @export
#'
#' @examples
#' \dontrun{
#'
#' # Removing the last installed package
#' rm_last_package()
#'
#' }
#'
#'
rm_last_package <- function(){

  decision <- switch(utils::menu(choices = c("NO", "No Way!", "No !!!", "Yes", "Let me think a little bit"),
                          title="Removing the last installed package ?"),"NO", "NO", "NO", "YES", "NO")


  if (decision == "YES"){

    insta <- utils::installed.packages()

    insta <- as.data.frame(insta)

    packages <- insta$Package

    paths <-   unlist(purrr::map(packages, ~fs::path_package(.)))


    data <- fs::file_info(paths)


    last_package <- data %>% dplyr::arrange(dplyr::desc(modification_time)) %>% utils::head(., n=1)

    last_package$path

    fs::dir_delete(last_package$path)

  } else {


    message("Ok, think again ...")

  }




}

