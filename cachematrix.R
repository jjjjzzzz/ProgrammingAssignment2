## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## save x and inv to global enviroment for caching
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(m) {
    # when is "set" function called???
    message("save to cache")
    x <<- m
    inv <<- NULL
  }
  get <- function() {x}
  setInverse <- function(inverse) {inv <<- inverse}
  getInverse <- function() {
    inv  
    message("get inverse matrix from the cache")
  }
  list(get = get, setInverse = setInverse, getInverse = getInverse)
}

## Write a short comment describing this function
## If inverse is already in cache, return; If not, put it into cache.
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getInverse()
  if(!is.null(inv)) return(inv)
  mat <- x$get()
  inv <- solve(mat)
  x$setInverse(inv)
  inv
  
}

m <- matrix(rep(c(1,2,1,0),3),3,3)

fun <- makeCacheMatrix(m)
cacheSolve(fun)


