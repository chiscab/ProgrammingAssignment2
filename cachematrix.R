## Caching allows to store data temporarily so to 
## reduce computational costs and improve performance. 
## In this exercise the concept is applied to the 
## function solve. By solving the function only when
## necessary, recomputation is avoided. 

## This function creates a list containing 
## subfunctions to setting the values of the 
## matrix, getting the value, inverting the matrix 
## and getting the inverted matrix.
## This special matrix can cache its inverse.
## Example of testing: 
## x <- makeCacheMatrix(matrix(c(4,3,3,2), ncol=2))
##cacheSolve(x)
##     [,1] [,2]
##[1,]   -2    3
##[2,]    3   -4

makeCacheMatrix <- function(x = matrix()) {
  M <- NULL
  setInv <- function(y) {
    x <<- y
    M <<- NULL
  }
  getInv <- function() x
  setinverse <- function(solve) M <<- solve
  getinverse <- function() M
  list(setInv = setInv, getInv = getInv,
       setinverse = setinverse,
       getinverse = getinverse)
}

## Write a short comment describing this function
## This function uses the output of the previous
## function to check if the inverse has already been
## calculated. If yes, the result is retrieved, 
## if not, it is calculated.

cacheSolve <- function(x, ...) {
  M <- x$getinverse()
  if(!is.null(M)) {
    message("getting cached data")
    return(m)
  }
  data <- x$getInv()
  M <- solve(data, ...)
  x$setinverse(M)
  M
}
