#' Remove all R packages
#'
#' @return
#' @export
#'
#' @examples
#'
#'



StartFresh <- function(){

  decision <- switch(menu(choices = c("NO", "No Way!", "No !!!", "Yes", "Let me think a little bit"),
                   title="Do you really want to remove all your packages ?"),"NO", "NO", "NO", "YES", "NO")


  if (decision == "YES"){



    insta <- installed.packages()

    insta <- as.data.frame(insta)

    packages <- insta$Package

    paths <- purrr::map(packages, ~fs::path_package(.)) %>% unlist()


    fs::dir_delete(paths[1:2])


  } else {

    message("Ok, think again ...")

  }


}





