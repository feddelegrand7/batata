
test_that("expect an error when wrong parameters provided", {

  expect_error(

    install_starred_cran(github_user = 123123,
                         n = 10),
    regexp = "'github_user' must be provided as a character string"

      )

  expect_error(

    install_starred_cran(github_user = "feddelegrand7",
                         n = "10"),
    regexp = "the 'n' parameter must be numeric and greater than 1"
  )


  expect_error(

    install_starred_cran(github_user = "feddelegrand7",
                         n = 0),
    regexp = "the 'n' parameter must be numeric and greater than 1"
  )

})


test_that("test if the function is returning a data frame", {

  data <- jsonlite::fromJSON(glue::glue("https://api.github.com/users/feddelegrand7/starred?per_page=5"))

  expect_s3_class(data, class = "data.frame")


})

