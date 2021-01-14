test_that("expect error when n = 0 or n < 0", {
  expect_error(rm_latest_packages(n = 0))
  expect_error(rm_latest_packages(n = -1))
  expect_error(rm_latest_packages(n = -1))
  expect_error(rm_latest_packages(n = -100))

})


test_that("expect error when n not numeric or not length 1", {
  expect_error(rm_latest_packages(n = "hello world"))
  expect_error(rm_latest_packages(n = c(32, 2323)))
  expect_error(rm_latest_packages(n = mtcars))
})


test_that("expect an error when directory doesn't exist", {

  expect_error(rm_latest_packages(, lib = "C://directory/doesnt/exist"))

})


test_that("expect an error when directory is not character", {

  expect_error(rm_latest_packages(, lib = 123))

})




