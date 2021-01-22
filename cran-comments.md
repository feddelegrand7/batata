## Test environments
* local R installation, R 4.0.2
* ubuntu 16.04 (on travis-ci), R 4.0.2
* win-builder (devel)

  

-- R CMD check results -------------------- batata 0.2.0 ----
Duration: 22s

0 errors √ | 0 warnings √ | 0 notes √


* I've added three new functions that will install user Github starred R packages 
whether available on CRAN or not. 
 `install_starred_cran()` : will install user starred Github packages that are available on CRAN
 `install_starred_github()`: will install user starred Github packages from Github using remotes
 `install_most_starred()`: will install the n most starred R packages from CRAN

* I've added unit tests 


Thank you very much. 
