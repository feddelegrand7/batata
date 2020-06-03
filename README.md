
<!-- README.md is generated from README.Rmd. Please edit that file -->

<!-- badges: start -->

<!-- badges: end -->

# batata <a><img src='man/figures/hex.png' align="right" height="200" /></a>

The goal of batata is to help R users manage R packages removals. For
example, imagine you’re attending tomorrow an R meet up in which you’ll
experiment many packages that you don’t want to keep. By the end of the
meet up, you’ll have to remember each installed package, its name (trust
me, packages’ names may be complicated). Further, each installed package
comes with a bunch of dependency which makes the operations more
complicated. Using the batata package, you can just run
`rm_today_packages()` (one of many other functions), and you’re clean
for today. Before removing the packages, batata will prompt you to
confirm your decision (which adds a certain degree of security), you can
also run `today_packages()` to check all the today installed packages
before making a decision.


## Important 




## Installation

You can install the development version of batata from Github

``` r
install.packages("remotes")

remotes::install_github("feddelegrand7/batata")
```

## \# Functions

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
#>          packages   modification_time
#> 1          batata 2020-05-31 09:40:01
#> 2  languageserver 2020-05-28 13:34:01
#> 3         R.cache 2020-05-28 13:33:38
#> 4       cyclocomp 2020-05-28 13:33:38
#> 5         R.utils 2020-05-28 13:33:37
#> 6            R.oo 2020-05-28 13:33:37
#> 7     R.methodsS3 2020-05-28 13:33:37
#> 8    xmlparsedata 2020-05-28 13:33:37
#> 9           lintr 2020-05-28 13:33:36
#> 10    collections 2020-05-28 13:33:36


# The last package installed 

latest_packages(n = 1)
#>   packages   modification_time
#> 1   batata 2020-05-31 09:40:01
```

-----

## Code of Conduct

Please note that the batata project is released with a [Contributor Code
of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms. If you
encounter any bug or if you want an improvement, please feel free to
open an Issue.
