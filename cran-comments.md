## Test environments
* local R installation, R 4.0.0
* ubuntu 16.04 (on travis-ci), R 4.0.0
* win-builder (devel)

  

-- R CMD check results ---------------------------------- batata 0.1.1 ----
Duration: 20.3s

0 errors √ | 0 warnings √ | 0 notes √

R CMD check succeeded


* the modification time provided by the fs package wasn't exact in some situation. As such, I've change the fs::file_info() to file.mtime() base R function. 

* I've also fixed some bugs concerning the dates using the lubridate package. 
