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




