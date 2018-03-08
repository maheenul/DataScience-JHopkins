add2 <- function(x,y){
    x + y
}

above10 <- function(x){
    use <- x>10
    x[use]
}

above <- function(x,n=10){
    ## n=10 sets the default value of n whenever not specified
    use <-x>n
    x[use]
}

columnmean <- function(y, removeNA=TRUE){
    nc<-ncol(y)
    means <- numeric(nc)#empty vector
    for (i in 1:nc){
        means[i]<-mean(y[,i], na.rm = TRUE)
        #removeNA and na.rm removes NA from data
    }
    means
}