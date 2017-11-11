directory <- 'C:/Users/gokul/Downloads/specdata'
corr <- function(directory, threshold = 100){
  filefull <- list.files(directory,full.names=TRUE)
  dat <- data.frame()
  dat1 <- data.frame()
  vec1 <- numeric(length = 0L)
  for (i in 1:323){
    dat <- read.csv(filefull[i])
    if (sum(complete.cases(dat))>threshold){
      dat1 <- dat[complete.cases(dat), ]
      vec1[i] <- cor(dat1$sulfate,dat1$nitrate)
      #print('hello')
      dat <- data.frame()
      dat1 <- data.frame()
    }
    #return(vec1)
    #print(vec1[i])
  }
  vec1 <- vec1[!is.na(vec1)]
  return(vec1)
}