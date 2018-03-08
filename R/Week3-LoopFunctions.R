##Week-3
#
# lapply, sapply, apply, tapply, mapply
# Read des. from pdf
# Auxillary fnc. : split
#
#
?lapply
# lapply takes in a list and also produces a list
#
# Example-1:
x <- list(a = 1:5, b = rnorm(10))
lapply(x, mean)
#
# Example-2:
x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
lapply(x, mean)
#
# Example-3:
x <- 1:4
lapply(x, runif)
# check the ?runif
# the values of x from 1-4 are passed 1-by-1 into runif
#
# Example-4:
lapply(x, runif, min = 0, max = 10)
# Here parameters are passed for the runif function
#
# Example-5
# Creatig annonymous function on the fly
# Objective : To extract first column
x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
x
lapply(x, function(elt) elt[,1])
#
#
?sapply
#
# Example-1
# sapply will try to simplify the result of lapply if possible.
x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
lapply(x, mean)
sapply(x, mean)
mean(x) # Does not work
#
#
?apply
#
# Example-1
# used to apply a function to the rows or columns of a matrix
str(apply)
x <- matrix(rnorm(200), 20, 10)
apply(x, 2, mean)
# Margin parameter chooses beteen row or column : 1 or 2
#
# Shortcuts (functions)
# rowSums = apply(x, 1, sum)
# rowMeans = apply(x, 1, mean)
# colSums = apply(x, 2, sum)
# colMeans = apply(x, 2, mean)
#
# Example-2
x <- matrix(rnorm(200), 20, 10)
apply(x, 1, quantile, probs = c(0.25, 0.75))
#
# Example-3 (Three dimensions)
a <- array(rnorm(2 * 2 * 10), c(2, 2, 10))
apply(a, c(1, 2), mean)
# OR
rowMeans(a, dims = 2)
#
#
?mapply
#
# Example-1
str(mapply)
list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1))
#
# Example-2
noise <- function(n, mean, sd) {rnorm(n, mean, sd)}
noise(5, 1, 2)
noise(1:5, 1:5, 2) 		# Not working correctly
mapply(noise, 1:5, 1:5, 2) 	# Works!
#
#
?tapply
#
# Exmaple-1
str(tapply)
x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)	# Factor variable(Classification var.)
tapply(x, f, mean)
#
# Exmaple-2
tapply(x, f, mean, simplify = FALSE)
# Ressult similar to lapply
#
# Exmaple-3
# Min and Max of observations
tapply(x, f, range)
#
#
?split
#
# Exmaple-1
str(split)
# Usually used in conjuction with lapply or sapply
x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
split(x, f)
#
# Exmaple-2
lapply(split(x, f), mean)
#
# Exmaple-3
# SEE MUCH MORE COMPLICATED EX. From PDF
# Use interaction(f1, f2) to combine factors
x <- rnorm(10)
f1 <- gl(2, 5)
f2 <- gl(5, 2)
f1
f2
interaction(f1, f2)
str(split(x, list(f1, f2)))
str(split(x, list(f1, f2), drop = TRUE))
# drop=TRUE removes the empty levels
#
#
# DEBUGGING
#
# Example : Warning
log(-1)
#
# Example : Error
printmessage <- function(x) {	
	if(x > 0){
		print("x is greater than zero")
	}else{
		print("x is less than or equal to zero")
		invisible(x)
	}
}
printmessage(1)
printmessage(NA)
#
# FIX:
printmessage2 <- function(x) {
	if(is.na(x)){
		print("x is a missing value!")
	}
	else if(x > 0){
		print("x is greater than zero")
	}
	else{
		print("x is less than or equal to zero")
		invisible(x)
	}
}
printmessage2(NA)
#
#
# Debugging tools in R
# 
# SEE the last slide of week-3library(sri
#
#
# quiz-3
#
library(datasets)
data(iris)
?iris
tapply(iris$Sepal.Length[iris$Species=='virginica'],iris$Species[iris$Species=='virginica'],mean)
apply(iris[,1:4],2,mean)
library(datasets)
data(mtcars)
?mtcars
rangehp <- tapply(mtcars$hp[mtcars$cyl==4 | mtcars$cyl==8],mtcars$cyl[mtcars$cyl==4 | mtcars$cyl==8],mean)
print(rangehp[2]-rangehp[1])
