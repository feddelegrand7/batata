test_that("latest_packages() returns the expected output", {

testthat::expect_equal(

  latest_packages(),

  {
    pack_paths <- fs::dir_ls(.libPaths())

    mod_time <- file.mtime(pack_paths)

    data <- data.frame(pack_paths, mod_time)


    pack_latest <- utils::head(data[rev(order(data$mod_time)), ], 1)

    # getting the names of the packages (which is the last part of the path)
    pack_names <-  sapply(fs::path_split(pack_latest$pack_paths),
                          utils::tail, 1)

    data.frame(packages = pack_names,
               modification_time = pack_latest$mod_time)

  }
)
  testthat::expect_equal(
    latest_packages(100),

    {
      pack_paths <- fs::dir_ls(.libPaths())

      mod_time <- file.mtime(pack_paths)

      data <- data.frame(pack_paths, mod_time)


      pack_latest <- utils::head(data[rev(order(data$mod_time)), ], 100)

      # getting the names of the packages (which is the last part of the path)
      pack_names <-  sapply(fs::path_split(pack_latest$pack_paths),
                            utils::tail, 1)

      data.frame(packages = pack_names,
                 modification_time = pack_latest$mod_time)

    }
  )
})


test_that("expect error when n = 0 or n < 0", {
  expect_error(latest_packages(n = 0))
  expect_error(latest_packages(n = -1))
  expect_error(latest_packages(n = -1))
  expect_error(latest_packages(n = -100))

})


test_that("expect error when n not numeric or not length 1", {
  expect_error(latest_packages(n = "hello world"))
  expect_error(latest_packages(n = c(32, 2323)))
  expect_error(latest_packages(n = mtcars))
})



test_that("expect a data frame from latest_packages()", {

  expect_s3_class(latest_packages(), "data.frame")

})



test_that("latest_packages() returns at least one row", {

  expect_gt(nrow(latest_packages()), 0)

})


test_that("the first column of latest_packages() is of type character", {

  data <- latest_packages()

  expect_type(data$packages, "character")

})


test_that("the data returned has exactly two columns", {


  expect_equal(ncol(latest_packages()), 2)


})


test_that("expect the modification time column to be of POSIXct", {


  data <- latest_packages(5)

  expect_equal(class(data$modification_time), c("POSIXct","POSIXt"))

})





test_that("latest_packages() has the expected number of rows", {


  expect_equal(nrow(latest_packages(1)), 1)
  expect_equal(nrow(latest_packages(2)), 2)
  expect_equal(nrow(latest_packages(3)), 3)
  expect_equal(nrow(latest_packages(4)), 4)
  expect_equal(nrow(latest_packages(5)), 5)

})




