corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  setwd(directory)
  totimp <- vector()
  files <- list.files(directory)
  for (i in files){
    datimp <- read.csv(paste(directory,"/",(i),sep = ""))
    if (sum(complete.cases(datimp), na.rm = TRUE)>threshold){
      totimp <- c(totimp,cor(datimp["sulfate"],datimp["nitrate"],use="complete.obs"))
    }
    
}
  totimp
}