#' removes installed packages according to a specific date
#'
#' @param date the date of interest in yyyy-mm-dd format
#' @param position takes three arguments "at", "before" or "after". "at" displays the packages installed at the chosen date, "before" before that date and "after" after that date)
#' @param lib a character vector giving the library directories. Defaults to the first element in .libPaths()
#' @return a character vector
#'
#' @export
#'
#' @examples
#' \dontrun{
#' # Displaying the packages installed today
#' today_packages()
#' }

rm_since_packages <- function(date, position, lib = .libPaths()){


  decision <- switch(utils::menu(choices = c("NO", "No Way!", "No !!!", "Yes", "Let me think a little bit"), title= glue::glue("Removing the packages that you've installed {position} {date} ?")),"NO", "NO", "NO", "YES", "NO")

  if (decision == "YES"){

    # retrieving packages' paths
    pack_paths <- fs::dir_ls(lib)


    # retrieving information about the packages
    pack_info <- fs::file_info(pack_paths)


    # transforming date time format to date only
    pack_info$modification_time <- as.Date(pack_info$modification_time)


    if(position == "at"){

      packs <- pack_info[pack_info$modification_time == as.Date(date), ]


    } else if (position == "before") {

      packs <- pack_info[pack_info$modification_time < as.Date(date), ]


    } else {

      packs <- pack_info[pack_info$modification_time > as.Date(date), ]

    }


    # getting the names of the packages (which is the last part of the path)
    pack_names <-  sapply(fs::path_split(packs$path), utils::tail, 1)


    utils::remove.packages(pack_names, lib)

    message(glue::glue("{pack_names} removed ~~~o_o~~~ "))


  } else {

    message("All right, think again ...")

  }





}

