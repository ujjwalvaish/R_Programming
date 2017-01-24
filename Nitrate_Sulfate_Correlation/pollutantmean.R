pollutantmean <- function(directory = "C:\\Users\\ujjwa\\Desktop\\specdata",pollutant,id){
  final = NULL
  if(pollutant == "nitrate"){
    for(myId in id){
      paste(directory,formatC(myId, width=3, flag="0"),sep = "\\")
      temp <- read.csv(paste(directory,sprintf("%03d.csv", myId),sep = "\\"))
      final <-c(final,temp$nitrate)
    }
  }
  else if (pollutant == "sulfate"){
    for(myId in id){
      paste(directory,formatC(myId, width=3, flag="0"),sep = "\\")
      temp <- read.csv(paste(directory,sprintf("%03d.csv", myId),sep = "\\"))
      final <-c(final,temp$sulfate)
    }
  }
  else
  {
    meanOfPollutant <- "Invalid Value"
  }etaexi
  mean(final,na.rm = TRUE)
}