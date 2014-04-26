complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  compimp <- data.frame()
  compno <- vector()
  fileid <- vector()
  ## setwd(directory)
  files <- list.files(directory)
  for (i in id){
    datimp <- read.csv(paste(directory,"/",files[i],sep = ""))
    compno <- c(compno, sum(complete.cases(datimp), na.rm = TRUE))
    fileid <- c(fileid,i)
  }
  compimp <- data.frame(id = fileid, nobs = compno)
  setwd("C:/Users/Pípa desktop/Desktop/R prog/")
  compimp
}