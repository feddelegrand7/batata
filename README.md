
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
confirm your decision (which adds a certain degree of security).

## Installation

You can install the development version of batata from Github

``` r
install.packages("remotes")

remotes::install_github("feddelegrand7/batata")
```

## Example
