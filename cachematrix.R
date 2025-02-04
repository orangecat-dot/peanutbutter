## Put comments here that give an overall description of what your
## functions do
#To create a pair of functions that cache the inverse of a matrix, 
#we can take advantage of R's lexical scoping and environments 
#to store the matrix and its inverse in a cached object
## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  inv = NULL
  set = function(y) {
    x <<- y
    inv <<- NULL
  }
  get = function() x
  setInverse = function(inverse) inv <<- inverse
  getInverse = function() inv
  list(set=set, get=get, setInverse=setInverse, getInverse=getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  inv = x$getInverse()
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)## Return a matrix that is the inverse of 'x'
  
  }
  data = x$get()
  inv = solve(data,...)
  x$setInverse(inv)
  inv
}  

max1 = makeCacheMatrix(matrix(c(1,2,3,4), nrow = 2))
inv1 = cacheSolve(max1)
print(inv1)
print(2)

install.packages("usethis")
library(usethis)
