corr <- function(directory = "C:\\Users\\ujjwa\\Desktop\\specdata",threshold){
  totalFiles <- length(list.files(directory))
  ids <- 1: totalFiles
  mydataFrame <- complete(id = ids)
  correlationVector = NULL
  for (id in ids){
    if(mydataFrame[[2]][id] >=  threshold)
    {
      paste(id)
      fileDataDump <- read.csv(paste(directory,sprintf("%03d.csv", id),sep = "\\"))
      fileDataDump <- fileDataDump[complete.cases(fileDataDump),]
      correlationVector = c(correlationVector,cor(x = fileDataDump$nitrate, y = fileDataDump$sulfate))
    }
  }
  head(correlationVector)
}
