
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
[![R
badge](https://img.shields.io/badge/Build%20with-♥%20and%20R-blue)](https://github.com/feddelegrand7/batata)
[![R build
status](https://github.com/feddelegrand7/batata/workflows/R-CMD-check/badge.svg)](https://github.com/feddelegrand7/batata/actions)
<!-- badges: end -->

The goal of `batata` is to help R users manage R packages removals and
installations.

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

# Packages Removals

For example, imagine you’re attending tomorrow an R meet up in which
you’ll experiment many packages that you don’t want to keep. By the end
of the meet up, you’ll have to remember each installed package, its name
(trust me, packages’ names may be complicated). Further, each installed
package might come with a bunch of dependencies which makes the
operations more complicated. Using the batata package, you can just run
`rm_today_packages()` (one of many other functions), and you’re clean
for today. Before removing the packages, batata will prompt you to
confirm your decision (which adds a certain degree of security), you can
also run `today_packages()` to check all the today installed packages
before making a decision.

`batata` takes into account the **modification time** of the packages
instead of the **birth time**. As such, if you decide to update a
package to a newer version, `batata` will consider it as a new package
(which is technically true as a new package will be installed).

------------------------------------------------------------------------

### `fresh_start()`

The `fresh_start()` function removes all your installed R packages.
Particularly useful when moving from an R version to another. This
function is quite dangerous, so you’ll be prompted twice to make sure
that you’re absolutely certain to run it.

------------------------------------------------------------------------

### `today_packages()` and `rm_today_packages()`

`today_packages()` displays all the packages installed the day you’re
running that function and in parallel, `rm_today_packages()` removes the
corresponding packages.

------------------------------------------------------------------------

### `yesterday_packages()` and `rm_yesterday_packages()`

`yesterday_packages()` displays all the packages installed the day
before you’re running that function and in parallel,
`rm_yesterday_packages()` removes the corresponding packages.

------------------------------------------------------------------------

### `since_packages()` and `rm_since_packages()`

`since_packages()` displays the packages that you’ve installed according
to a specific date. It has two argument:

-   *date*: the considered date in *yyyy-mm-dd* format ;
-   *position*: whether to display the installed packages **at** that
    date, **before** that date or **after** that date.

`rm_since_package()` works similarly except that it removes the packages
instead of displaying them.

------------------------------------------------------------------------

### `latest_packages()` and `rm_latest_packages()`

Suppose you want to check out the last 10 packages that you’ve
installed, or, maybe you want to display the last installed package:

``` r
library(batata)

# The 10 last installed packages

latest_packages(n = 10)
#>      packages   modification_time
#> 1       lintr 2021-01-21 02:16:07
#> 2        httr 2021-01-21 02:15:42
#> 3      batata 2021-01-21 02:14:46
#> 4        brms 2021-01-21 01:20:13
#> 5  clisymbols 2021-01-21 01:20:13
#> 6        xfun 2021-01-21 00:53:20
#> 7     distill 2021-01-21 00:52:36
#> 8        covr 2021-01-21 00:52:35
#> 9      thankr 2021-01-21 00:52:35
#> 10    janitor 2021-01-21 00:52:35


# The last package installed (by default = 1)

latest_packages()
#>   packages   modification_time
#> 1    lintr 2021-01-21 02:16:07
```

# Packages Installations

### `install_starred_cran()`

You can install the latest R packages that you’ve starred on Github
using the `install_starred_cran()` function. As an example, the
following code chunk will look at the last 10 repositories that I’ve
starred, filter R packages from non-R repos and install them.

``` r
install_starred_cran(github_user = 'feddelegrand7', 
                     n = 10)
```

Note that if the starred repo is not available on CRAN,
`install_starred_cran()` will simply ignore it.

### `install_starred_github()`

`install_starred_github()` behaves the same way as
`install_starred_cran()` except that it will install the repositories
from Github (not from CRAN), so that you can install packages that are
not available on CRAN.

``` r
install_starred_github(github_user = 'feddelegrand7', 
                       n = 5, 
                       upgrade = "never")
```

The above code chunk will look for the last five repositories that I’ve
starred, filter out non-R repos and install them.

## Aknowledgement

Concerning the **packages installation** part of `batata` I was mainly
inspired by the tweet of [Tim
Tiefenbach](https://twitter.com/TimTeaFan/status/1352007510425817089),
so a big thanks to him !

------------------------------------------------------------------------

## Code of Conduct

Please note that the batata project is released with a [Contributor Code
of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms. If you
encounter any bug or if you want an improvement, please feel free to
open an Issue.
