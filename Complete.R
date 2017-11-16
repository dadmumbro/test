directory <- 'C:/Users/gokul/Downloads/specdata'
complete <- function(directory, id = 1:4){
  filefull <- list.files(directory,full.names=TRUE)
  dat <- data.frame()
  dat2 <- setNames(data.frame(matrix(ncol = 2, nrow = 0)), c("ID", "Nos"))
  for (i in id){
    dat <- read.csv(filefull[i])
    sumvalue <- !(is.na(dat$sulfate) | is.na(dat$nitrate))
    sumvalue1 <- sum(sumvalue)
    dat2 <- rbind(dat2,c(i,sumvalue1))
  }
  return(dat2)
  #returns value
}
