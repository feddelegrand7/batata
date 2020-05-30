#' Remove all the installed R packages
#'
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


fresh_start <- function(){

  decision <- switch(utils::menu(choices = c("NO", "No Way!", "No !!!", "Yes", "Let me think a little bit"),
                   title="Do you really want to remove all your packages ?"),"NO", "NO", "NO", "YES", "NO")


  if (decision == "YES"){

    decision2 <- switch(utils::menu(choices = c("NO", "No Way!", "No !!!", "Yes", "Let me think a little bit"),
                                   title="Are you really really really sure about it ?"),"NO", "NO", "NO", "YES", "NO")


  }

  if(decision2 == "YES"){



    insta <- utils::installed.packages()

    insta <- as.data.frame(insta)

    packages <- insta$Package

    paths <-   unlist(purrr::map(packages, ~fs::path_package(.)))

    names <- fs::path_split(paths) %>% sapply(., utils::tail, 1)

    remove.packages(names)

  } else {

    message("Ok, think again ...")

  }


}





