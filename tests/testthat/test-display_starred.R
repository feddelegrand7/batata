
output <- display_starred("feddelegrand7")

output2 <- display_starred("feddelegrand7", n = 10, onlyR = FALSE)


test_that("display_starred() returns a character vector", {
  expect_type(output, "character")
})


test_that("display_starred() returns a vector
          of length superior than 0", {
  expect_gt(length(output), 0)
})



test_that("display_starred() returns a coherent length", {
  expect_equal(length(output2), 10)
})


test_that("display_starred() returns error when argument missing", {
  expect_error(
    display_starred(),
    regexp = 'argument "github_user" is missing, with no default',
    fixed = TRUE
  )
})



test_that("display_starred() returns
          informative error when argument missing", {
  expect_error(
    display_starred(),
    regexp = 'argument "github_user" is missing, with no default',
    fixed = TRUE
  )
})


test_that("display_starred() returns
          informative error when 'github_user' not character", {
  expect_error(
    display_starred(github_user = 123),
    regexp = "github_user' must be provided as a character string",
    fixed = TRUE
  )
})




test_that("display_starred() returns
          informative error when 'n' not numeric", {
  expect_error(
    display_starred(github_user = "feddelegrand7",
                    n = "10"),
    regexp = "the 'n' parameter must be numeric and greater than 1",
    fixed = TRUE
  )
})
