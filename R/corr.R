corr <- function(directory, threshold=0){
    
    csv.list <-list.files(path = directory, pattern = ".csv")
    selected.corr = c()
    
    for (i in 1:length(csv.list)){
        
        data_csv <- read.csv(paste(directory,"/",csv.list[i],sep="",collapse=""))
        selected.complete <- data_csv[complete.cases(data_csv),]
        nobs.complete <- nrow(selected.complete)
        
        if (nobs.complete > threshold){
            selected.corr <- c(selected.corr,cor(x=selected.complete$sulfate,y=selected.complete$nitrate))
            #print('magic')
        }else{
            #print('you sug')
        }
    }
    selected.corr
}