## Functions for memoization (http://en.wikipedia.org/wiki/Memoization) of
## inverted matrices (http://en.wikipedia.org/wiki/Invertible_matrix).

## Caches or memoizes matrix inversion
makeCacheMatrix <- function(x = matrix()) {
  # Initialize the inverted matrix to a value that an be used
  # for testing if inverted matrix has been calculated.
  s <- NULL
  # Set the matrix value to something other than the initial value
  # provided when creating the function.
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  # Return the matrix to be inverted
  get <- function() x
  # Set the inverted matrix
  sets <- function(solve) s <<- solve
  # Returns the cached inverted matrix
  gets <- function() s
  list(set = set, get = get,
       sets = sets,
       gets = gets)
}

## Returns a matrix that is the inverse of 'x'
cacheSolve <- function(x, ...) {
  # Check if inverted matrix already exists
  s <- x$gets()
  if(!is.null(s)) {
    message("Found inverted matrix")
    return(s)
  }
  # Retrieve original matrix
  data <- x$get()
  # Generate inverse
  s <- solve(data, ...)
  # Store inverse
  x$sets(s)
  s
}

