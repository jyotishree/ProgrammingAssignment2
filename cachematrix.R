# A pair of functions that cache the inverse of a matrix

makeCacheMatrix <- function( m = matrix() ) 
{
  # Initialize the inverse property
  inv <- NULL
  # Method to set the matrix
  set <- function( matrix ) {
    m <<- matrix
    inv <<- NULL
  }
  # Method the get the matrix
  get <- function() {
        m
  }
  # Method to set the inverse of the matrix
  setInverse <- function(inverse) {
    inv <<- inverse
  }
  # Method to get the inverse of the matrix
  getInverse <- function() {
  # Return the inverse property
    inv
  }
  # Return a list of the methods
  list(set = set, get = get,setInverse = setInverse,getInverse = getInverse)
}


# Compute the inverse of the special matrix returned by "makeCacheMatrix"
cacheSolve <- function(x, ...)
{
    m <- x$getInverse()
    if( !is.null(m) )
    {
      message("getting cached data")
      return(m)
    }
  
    data <- x$get()
    m <- solve(data) %*% data
    x$setInverse(m)
    m
}


