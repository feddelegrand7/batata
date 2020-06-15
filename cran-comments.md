## Test environments
* local R installation, R 4.0.0
* ubuntu 16.04 (on travis-ci), R 4.0.0
* win-builder (devel)

  

-- R CMD check results --------------------------------------- batata 0.1.0 ----
Duration: 2m 12.7s

0 errors v | 0 warnings v | 0 notes v

R CMD check succeeded


* I've fixed some bugs related to remove.packages() function.Indeed, in some situation the packages weren't removed completely (dll remaining) which was misleading. I've modified this function with fs::dir_delete() much more consistent. 
