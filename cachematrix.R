## Put comments here that give an overall description of what your
## functions do

#1st: setting the input as a matrix
#2nd: setting sol as null; sol is the solved value
#3rd: using the given model, simply changing the "mean" parts and using "solve" instead

makeCacheMatrix <- function(x = matrix()) {
  sol <- NULL
  set <- function(y){
    x <<- y
    sol <<- NULL
  }
  get <- function()x
  setInverse <- function(inverse) sol <<- inverse
  getInverse <- function() sol 
  list(set = set, get = get, 
       setInverse = setInverse, 
       getInverse = getInverse)
}


##Same structure than previous lines, using the given model, changing "mean" for "solve"

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  sol <- x$getInverse()
  if(!is.null(sol)){
    message("getting cached data")
    return(sol)
  }
  mat <- x$get()
  sol <- solve(mat,...)
  x$setInverse(sol)
  sol
}
