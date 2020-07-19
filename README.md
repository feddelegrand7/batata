
<!-- README.md is generated from README.Rmd. Please edit that file -->

# batata <a><img src='man/figures/hex.png' align="right" height="200" /></a>

<!-- badges: start -->

[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/batata)](https://cran.r-project.org/package=batata)

[![CRAN\_time\_from\_release](https://www.r-pkg.org/badges/ago/batata)](https://cran.r-project.org/package=batata)

[![metacran
downloads](https://cranlogs.r-pkg.org/badges/batata)](https://cran.r-project.org/package=batata)

[![metacran
downloads](https://cranlogs.r-pkg.org/badges/grand-total/batata)](https://cran.r-project.org/package=batata)

[![license](https://img.shields.io/github/license/mashape/apistatus.svg)](https://choosealicense.com/licenses/mit/)

[![Travis build
status](https://travis-ci.com/feddelegrand7/batata.svg?branch=master)](https://travis-ci.com/feddelegrand7/batata)

[![R
badge](https://img.shields.io/badge/Build%20with-♥%20and%20R-blue)](https://github.com/feddelegrand7/batata)

<!-- badges: end -->

The goal of batata is to help R users manage R packages removals. For
example, imagine you’re attending tomorrow an R meet up in which you’ll
experiment many packages that you don’t want to keep. By the end of the
meet up, you’ll have to remember each installed package, its name (trust
me, packages’ names may be complicated). Further, each installed package
might come with a bunch of dependencies which makes the operations more
complicated. Using the batata package, you can just run
`rm_today_packages()` (one of many other functions), and you’re clean
for today. Before removing the packages, batata will prompt you to
confirm your decision (which adds a certain degree of security), you can
also run `today_packages()` to check all the today installed packages
before making a decision.

`batata` takes into account the **modification time** of the packages
instead of the **birth time**. As such, if you decide to update a
package to a newer version, `batata` will consider it as a new package
(which is technically true as a new package will be installed).

## Installation

You can install the `batata` package from CRAN with:

``` r
install.packages("batata")
```

Install the development version of `batata` from Github with:

``` r
install.packages("remotes") # if not installed

remotes::install_github("feddelegrand7/batata")
```

-----

### `fresh_start()`

The `fresh_start()` function removes all your installed R packages.
Particularly useful when moving from an R version to another. This
function is quite dangerous, so you’ll be prompted twice to make sure
that you’re absolutely certain to run it.

-----

### `today_packages()` and `rm_today_packages()`

`today_packages()` displays all the packages installed the day you’re
running that function and in parallel, `rm_today_packages()` removes the
corresponding packages.

-----

### `yesterday_packages()` and `rm_yesterday_packages()`

`yesterday_packages()` displays all the packages installed the day
before you’re running that function and in parallel,
`rm_yesterday_packages()` removes the corresponding packages.

-----

### `since_packages()` and `rm_since_packages()`

`since_packages()` displays the packages that you’ve installed according
to a specific date. It has two argument:

  - *date*: the considered date in *yyyy-mm-dd* format ;
  - *position*: whether to display the installed packages **at** that
    date, **before** that date or **after** that date.

`rm_since_package()` works similarly except that it removes the packages
instead of displaying them.

-----

### `latest_packages()` and `rm_latest_packages()`

Suppose you want to check out the last 10 packages that you’ve
installed, or, maybe you want to display the last installed package:

``` r

library(batata)

# The 10 last installed packages

latest_packages(n = 10)
#>       packages   modification_time
#> 1        BARIS 2020-07-19 20:32:58
#> 2      janitor 2020-07-19 20:15:23
#> 3    snakecase 2020-07-19 20:15:23
#> 4          XML 2020-07-19 20:15:17
#> 5   downloader 2020-07-19 20:15:03
#> 6  badgecreatr 2020-07-19 17:25:56
#> 7         pins 2020-07-18 23:49:54
#> 8     filelock 2020-07-18 23:49:54
#> 9         icon 2020-07-18 14:43:00
#> 10   prettydoc 2020-07-18 02:20:26


# The last package installed (by default = 1)

latest_packages()
#>   packages   modification_time
#> 1    BARIS 2020-07-19 20:32:58
```

-----

## Code of Conduct

Please note that the batata project is released with a [Contributor Code
of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms. If you
encounter any bug or if you want an improvement, please feel free to
open an Issue.
