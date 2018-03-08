## WEEK-2
## if,else, for, while, repeat, break, next, return

## if-else
#ex-1:
x<-4
if(x>3){
	y<-10 ## do something
} else {
	y<-0 ## do something else
}
y
## OR
y <- if(x>3){
	10
} else {
	0
}
y
##ex-2 :
if (condition1){
	## do something
} else if (condition 2){
	## do something else
	} else{
	## do something else wololo
}


## for loops
#Ex-1:
for(i in 1:10) {
	print(i)
}
##Ex-2:
x<-c("a","b","c","d")

for (i in 1:4){
	print(x[i])
}
for(i in seq_along(x)){
	print(x[i])
}
for(letter in x){
	print(letter)
}
for(i in 1:4) print(x[i])	# use for single expression
#Ex-3:
x<-matrix(1:6, 2, 3)
for (i in seq_len(nrow(x))){
	for (j in seq_len(ncol(x))){
		print(x[i,j])
	}
}


## While loops
# Ex-1
count <- 0
while(count<10) {
	print(count)
	count<-count + 1
}
# Ex-2
z <- 5
while(z >= 3 && z <= 10) {
	print(z)
	coin <- rbinom(1, 1, 0.5)
	if(coin == 1) { ## random walk
		z <- z + 1
	} else {
		z <- z - 1
	}
}


##(Repeat,break) next, return
#Ex-1
x0 <- 1
tol <- 1e-8
repeat {
	x1 <- computeEstimate()
	if(abs(x1 - x0) < tol) {
		break
	} else {
		x0 <- x1
	}
}
# there should be a guarantee for convergence
# better to use a for loop with a hardlimit set
#Ex-2
for(i in 1:100) {
	if(i <= 20) {
		## Skip the first 20 iterations
		next
	}
	## Do something here
}


##Functions and Argumnt matching
#Example-1:
f <- function(<arguments>) {
## Do something interesting
}
##functions generally return the last value inside the function

#Example-2:
# All the following expressions are equivalent
mydata <- rnorm(100)
sd(mydata)
sd(x = mydata)
sd(x = mydata, na.rm = FALSE)
sd(na.rm = FALSE, x = mydata)	# Not recommended
sd(na.rm = FALSE, mydata)	# Not recommended
# The following two args are equiv. [see lec for why?]
args(lm)
lm(data = mydata, y ~ x, model = FALSE, 1:100)
lm(y ~ x, mydata, 1:100, model = FALSE)
#Read lecture for precedence of arg matching

#Example-3:
#defining a function
f <- function(a, b = 1, c = 2, d = NULL) {
}

#Example-4 (Lazy Evaluation)
f <- function(a, b) {
a^2
}
f(2)
# All the values are passed into f but only used when needed
# No errors are produces as b is not used

#Example-5
f <- function(a, b) {
print(a)
print(b)
}
f(45)
# Error will be produced as b is missing

#Example-6 (... argument)
myplot <- function(x, y, type = "l", ...) {
plot(x, y, type = type, ...)
}
# Generic functions use 
args(paste)
function (..., sep = " ", collapse = NULL)
# also used when no. of arg passed cannot be known in adv.
# any args after the ... must be named explicitly

#Example-7
# any args after the ... must be named explicitly
> args(paste)
function (..., sep = " ", collapse = NULL)
> paste("a", "b", sep = ":")
[1] "a:b"
> paste("a", "b", se = ":")	#Invalid
[1] "a b :"

## read scoping rules from slides
## Searching precedence
## Search the global environment for a symbol name 
## matching the one requested.
## Search the namespaces of each of the packages 
## on the search list
## Lexical Scoping
#This function returns another function as its value.
# Example-1
make.power <- function(n) {
	pow <- function(x) {
		x^n
	}
	pow
}
cube <- make.power(3)
square <- make.power(2)
cube(3)
square(3)
make.power(3)(2)
ls(environment(cube))
get("n",environment(cube))
get("pow",environment(cube))

#Example-2
y <- 10
f <- function(x) {
	y <- 2
	y^2 + g(x)
}
g <- function(x) {
	x*y
}
# what will the be value of f(3)
f(3)
# for Lexical: value taken from where fnc defined, y=10
# Lexical takes value from global environment
# for dynamic: value taken from where fnc called, y=2
# Dynamic takes value from calling environment 
# A.K.A (parent frame in R)
# When a fnc is DEFINED and CALLED in the global env then
# lexical and dynamic scoping are the same.


## Date and time
#Date
x <- as.Date("1970-01-01")
x
unclass(x)
unclass(as.Date("1970-01-02"))
# unclass counts from 1970-01-01
#
#Time
#POSIXlt
x<-Sys.time()
x
p<- as.POSIXlt(x)
names(unclass(p))
p$sec
#POSIXct
x <- as.Date("1970-01-01")
# x by deafult is already in POSIXct format
unclass(x)
# no names are associated as can be seen from unclass
x$sec # will not work as there are no sec class
#
# strptime
datestring <- c("January 10, 2012 10:40",
"December 9, 2011 9:10")
x<- strptime(datestring, "%B %d, %Y %H:%M")
# help the check page for the agruments to the fnc
x
class(x)
#
# Operations on date and time
x <- as.Date("2012-01-01")
y <- strptime("9 jan 2011 11:34:21","%d %b %Y 
%H:%M:%S")
x-y
# Cannot operate as they are not of class.
x<-as.POSIXlt(x)
x-y
#
x <- as.Date("2012-03-01") y <- as.Date("2012-02-28")
x-y
## Time difference of 2 days[takes leap year into acc]
x <- as.POSIXct("2012-10-25 01:00:00")
y <- as.POSIXct("2012-10-25 06:00:00", tz = "GMT")
y-x
## Time difference of 1 hours[takes gmt into acc]
#
# Homework
#
x <- 1:10
if(x > 5) {
        x <- 0
}
x
#
f <- function(x) {
        g <- function(y) {
                y + z
        }
        z <- 4
        x + g(x)
}
z<-10
f(3)
#
x <- 5
y <- if(x < 3) {
        NA
} else {
        10
}
y
#
#Programming assignment
pollutantmean("specdata", "sulfate", 1:10)