library(curl)



test_that("expect an error when wrong parameters provided", {

  expect_error(

    install_starred_github(github_user = 123123,
                         n = 10),
    regexp = "'github_user' must be provided as a character string"

  )

  expect_error(

    install_starred_cran(github_user = "feddelegrand7",
                         n = "10"),
    regexp = "the 'n' parameter must be numeric and greater than 1"
  )


  expect_error(

    install_starred_github(github_user = "feddelegrand7",
                         n = 0),
    regexp = "the 'n' parameter must be numeric and greater than 1"
  )

  expect_error(

    install_starred_github(github_user = "feddelegrand7",
                           n = 20,
                           upgrade = "I don't know"
                           )
  )

})





