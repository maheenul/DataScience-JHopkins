pollutantmean <- function(directory, pollutant, id=1:332){
    
    csv.list <-list.files(path = directory, pattern = ".csv")
    pollutant.sum <- 0;
    pollutant.length <- 0;
    
    for (i in id){
        data_csv <- read.csv(paste(directory,"/",csv.list[i],sep="",collapse=""))
        #subdata_csv <- data_csv($
        pollutant.selected <- data_csv[pollutant]
        pollutant.selected <- pollutant.selected[!is.na(pollutant.selected)]
        pollutant.sum <- pollutant.sum + sum(pollutant.selected)
        pollutant.length <- pollutant.length + length(pollutant.selected)
    }
    pollutant.mean <- pollutant.sum/pollutant.length
    pollutant.mean
}