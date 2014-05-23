# From the http://www.mathsisfun.com/algebra/matrix-inverse.html page
mat <- matrix(c(4, 2, 7, 6), 2, 2)
inv <- solve(mat)
ide <- mat %*% inv

# See also http://www.purplemath.com/modules/mtrxmult.htm
# for nice matrix multiplication algorithm graphic.

# Generate a random 2 x 2 matrix of integers from 1 to 10
di <- 2
mat <- matrix(sample(1:10, di * di), di, di)
# Invert matrix
inv <- solve(mat)
# General identity matrix
ide <- mat %*% inv
# Should be true
identical(ide, matrix(c(1, 0, 0, 1), 2, 2))

cm <- makeCacheMatrix(mat)
# Should be true
is.null(cm$gets())
cs <- cacheSolve(cm)
# Should be false
is.null(cm$gets())

identical(inv, cacheSolve(cm))
