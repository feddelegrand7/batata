
<!-- README.md is generated from README.Rmd. Please edit that file -->

<!-- badges: start -->

<!-- badges: end -->

# batata

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

## Installation

You can install the development version of batata from Github

``` r
install.packages("remotes")

remotes::install_github("feddelegrand7/batata")
```

# Examples

#### fresh\_start()

The `fresh_start()` function removes all your installed R packages.
Particularly useful when moving from an R version to another. This
function is quite dangerous, so you’ll be prompted twice to make sure
that you’re absolutely certain to run it.

### `today_packages()` and `rm_today_packages()`

`today_packages()` displays all the packages installed the day you’re
running that function and in parallel, `rm_today_packages()` the
corresponding packages.

### `yesterday_packages()` and `rm_yesterday_packages()`

`yesterday_packages()` displays all the packages installed the day
before you’re running that function and in parallel,
`rm_yesterday_packages()` removes the corresponding packages.

### `since_packages()` and `rm_since_packages()`

`since_packages()` displays the packages that you’ve installed according
to a specific date. It has two argument:

  - *date*: the considered date in *yyyy-mm-dd* format ;
  - *position*: whether to display the installed packages **at** that
    date, **before** that date or **after** that date.

`rm_since_package()` works similarly except that it removes the packages
instead of displaying them.
