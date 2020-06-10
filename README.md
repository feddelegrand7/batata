
<!-- README.md is generated from README.Rmd. Please edit that file -->

# batata <a><img src='man/figures/hex.png' align="right" height="200" /></a>

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/batata)](https://CRAN.R-project.org/package=batata)

![](http://cranlogs.r-pkg.org/badges/grand-total/batata?color=blue)

<a href="https://www.buymeacoffee.com/Fodil" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>

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

You can install the development version of `batata` from Github with:

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
#>       packages        modification_time    
#>  [1,] "remotes"       "2020-06-10 14:15:21"
#>  [2,] "glue"          "2020-06-10 12:43:09"
#>  [3,] "tidyverse"     "2020-06-10 12:40:39"
#>  [4,] "xaringan"      "2020-06-10 12:39:10"
#>  [5,] "askpass"       "2020-06-10 12:38:04"
#>  [6,] "skimr"         "2020-06-10 12:35:52"
#>  [7,] "broom"         "2020-06-10 12:31:44"
#>  [8,] "batata"        "2020-06-10 12:29:38"
#>  [9,] "image.darknet" "2020-06-09 00:18:03"
#> [10,] "diffobj"       "2020-06-04 23:30:39"


# The last package installed (by default = 1)

latest_packages()
#>      packages  modification_time    
#> [1,] "remotes" "2020-06-10 14:15:21"
```

-----

## Code of Conduct

Please note that the batata project is released with a [Contributor Code
of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms. If you
encounter any bug or if you want an improvement, please feel free to
open an Issue.
