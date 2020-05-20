insta <- utils::installed.packages()

insta <- as.data.frame(insta)

packages <- insta$Package

paths <-   unlist(purrr::map(packages, ~fs::path_package(.)))


data <- fs::file_info(paths)

data$birth_time <- as.Date(data$birth_time)


today_packages <- data %>% dplyr::filter(birth_time == Sys.Date())

names <- fs::path_split(today_packages$path) %>% sapply(., utils::tail, 1)



test_that("multiplication works", {
  expect_equal(today_packages()



               ,

               names)







  })
