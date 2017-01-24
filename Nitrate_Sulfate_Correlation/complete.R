complete <- function(directory = "C:\\Users\\ujjwa\\Desktop\\specdata",id){
  mydataframe <- NULL
  ids = NULL
  counts <- NULL
    for(myId in id){
      paste(directory,formatC(myId, width=3, flag="0"),sep = "\\")
      temp <- read.csv(paste(directory,sprintf("%03d.csv", myId),sep = "\\"))
      good <- complete.cases(temp)
      ids <- c(ids, myId)
      counts <- c(counts,sum(good))      
    }
  mydataframe <- data.frame(id  = ids, nobs = counts)
  mydataframe
}

  
