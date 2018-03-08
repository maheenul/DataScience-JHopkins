## Super Basic R
x <- 1	##Assignment
x		## auto-print
print(x)	## explicit print
msg<-"hello"
print(msg)
## comment!
## press f5 to execute single line from script
x<-1:20
x



## Datatypes ##
## Number (double precision real number
## L to specify an integer.
## Special: Inf and NaN(sometimes a missing value)

## Attributes
## names,dimnames
## dimensions,class,length,other user defined
## attributes() function to add/rmv/modify att.

## creating vectors, c(), vector()
## Contains elm of the same class
## c() : concatinate function
## datas combined must be of the same type
x <- c(1+0i, 2+4i)
## vector() : initialising vector
x <- vector("numeric", length=10)

##Mixing data types (coersion)
## Will convert to the least common type
## for explicit conversion use the following
## as.numeric(), as.logical(), as.character()
x<-0:6
print(as.logical(x))
print(as.character(x))
y<-c("a","b","c")
print(as.numeric(y))

##Lists: used to combine elmts of diff classes
x <- list(1,'a',TRUE,1+4i)
x

##Matrices
m<- matrix(nrow=2,ncol=3)
m
dim(m)
attributes(m) ## list the attr. associated

m<-matrix(1:6, nrow=2, ncol=3)
m	## Fills up column-wise
m <-1:10
dim(m)<-c(2,5)
x<-1:3
y<-10:12
cbind(x,y)
rbind(x,y)

##Factors : represents categorical data
## can be ordered or unordered
x <- factor(c("yes","yes","no","yes","no"))
x
## levels are normally ass. based on alpha-precedence 
## n comes before y therefore "no" is the 1st level
table(x)
unclass(x)
x <- factor(c("yes","yes","no","yes","no"),
levels=c("yes","no"))
x

##Missing values
## of type NA or NaN
## NA- Not available
## NaN-Not a number
## check: is.na() and is.nan()
x<-c(1,2,NA,10,3)
is.na(x)
is.nan(x)
x<-c(1,2,NaN,NA,4)
is.na(x)
is.nan(x)

##Data Frames : stores tabular data
x<-data.frame(foo=2:5, bar=c(T,T,F,F))
x
nrow(x)
ncol(x)

##Names
x<-1:3
names(x)
names(x)<-c("foo","bar","norf")
x
names(x)
x<-list(a=1,b=2,c=3)
x
m<-matrix(1:4, nrow=2, ncol=2)
dimnames(m) <-list(c("a","b"),c("c","d"))
m


## Reading tabular Data ##
## read.table, read.csv - read tab. data
## readLines, - reads line of txt file
## source - reads R code files (inv. of dump)
## dget - reads R code files (inv. of dput)
## load - reads in saved workspaces
## unserialize - reads single R obj in bin. form

##Writing data
##write.table
##writeLines
##dump
##dput
##save
##serialize
##check the argument for read.table in slides
## For large tables
## read the help page for read.table
## read in parts (row-wise or columnm-wise)
## specify nrow for efficient mem. allocation
## Do mem. calc. using nrow ncol. and data type

## dumping dump and dputing dput
## these format cannot be underst. with a txt reader
## the metadata is preserved in this format
## these format are not space efficient
y<- data.frame(a=1,b="a")
dput(y)
dput(y, file = "y.R")
new.y <-dget("y.R")
new.y

x<-"foo"

dump(c("x","y"), file = "data.R")
rm(x,y)
source("data.R")
y
x


## Interfacing with outside
## file,gzfile,bzfile,url
## file : used to form conn. with txt file
## gzfile: opens comp. file comp. with gz
## bzfile: opens comp. file comp. with bz 
## url: opens a webpage
## READ SLIDES For theory ONWARDS L1.210 inclusive
## conections are imp. for read parts of a file


##Subsetting
##Basics
x<-c("a","b","c","d","a")
x[2]
x[1:4]
x[x>"a"]
x[c(1,3)]
x[c(TRUE, TRUE, NA, FALSE, TRUE)]

##Lists
x <- list(foo=1:4, bar=0.6)
##[] returns the same type
## as x is a list the list will be returned
x[1]
x[[1]]
x$bar
x[["bar"]]
x["bar"]
##ex.
x <- list(foo=1:4, bar=0.6, baz="hello")
x
x[c(1, 3)]
name <- "foo"
x[[name]]
x$name ## doesn't exists
x$foo ##element 'foo' does exist
##ex: nested subsetting
x<-list(a=list(10,12,14),b=c(3.14,2.81))
x[[c(1,3)]]
x[[1]][[3]]
x[[c(2,1)]]

##Matrices
x<-matrix(1:6,2,3)
x[1,2]
x[2,1]
x[1,]
x[,3]
## drop=FALSE preserves the dim. of the result mat.
x[1,2, drop=FALSE]
x[1,,drop=FALSE]

#Partial Matching
x<-list(aardwork=1:5)
x$a
x[["a"]]
x[["a", exact=FALSE]]

#Removing missing values
#Ex-1
x<-c(1,2,NA,4,NA,5)
good<-!(is.na(x))
x[good]
#Ex-2
x<-c(1,2,NA,4,5,NA)
y<-c("a","b",NA,"d",NA,"f")
good<-complete.cases(x,y)
good
x[good]
y[good]
## complete cases can also be used for data frame

##Vectorized operations
##Ex-1
x<-1:4; y<-6:9
x+y
x>2
x>=2
y==8
x*y
x/y
##ex-2
x<-matrix(1:4,2,2); y<-matrix(rep(10,4),2,2)
## rep(10,4) means replicate 10 4 times
x;y;
x * y 	## element-wise multiplication
x %*% y 	## true matrix multiplication