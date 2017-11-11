directory <- 'C:/Users/gokul/Downloads/specdata'
pollutantmean <- function(directory, pollutant, id = 1:332){
     filefull <- list.files(directory,full.names=TRUE)
    dat <- data.frame()
    for (i in id){
      dat <- rbind(dat,read.csv(filefull[i]))
    }
    #str(dat)
    #summary(dat)
    if (pollutant =='sulfate'){
      means <- mean(dat$sulfate,na.rm = TRUE)
    }
    else{ means <- mean(dat$nitrate,na.rm=TRUE)}
    means
}
