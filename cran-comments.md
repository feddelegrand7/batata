## Test environments
* local R installation, R 4.0.0
* ubuntu 16.04 (on travis-ci), R 4.0.0
* win-builder (devel)

  
-- R CMD check results --------------------------------------- batata 0.1.0 ----
Duration: 1m 45.4s

0 errors v | 0 warnings v | 0 notes v

R CMD check succeeded





# This is a resubmission 
----------------------------------


Following the precious comments made by Swetlana Herbrandt, I've considerably improved the speed of the package through: 

- removing the "installed.packages()" function and replacing it with fs::dir_ls() which is faster. 
- I've removed the dependencies to dplyr, magrittr and purrr. Now the package is dependent to fs, utils and glue only which are lightweight packages. 

I've also included a lib parameter in each function which default to the first element of .libPaths(). As such, the user can specifiy the library of interest when checking the installed packages and when removing them. 


Thank you again for your assistance. 
