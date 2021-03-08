
test_that("yesterday_package() returns an error when argument not character", {

  expect_error(yesterday_packages(lib = 123))

})



test_that("yesterday_packages() returns the correct output", {

  skip_on_cran()

  output <- yesterday_packages()

  if (is.null(output)) {

    expect_null(output)

  } else {

    expect_s3_class(
      object = output,
      class = "character"
    )

    expect_type(
      object = output,
      class = "character"
    )

    expect_gt(

      object = length(output),
      expected = 0

    )
  }

})
