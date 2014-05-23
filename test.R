# From the http://www.mathsisfun.com/algebra/matrix-inverse.html page
mat <- matrix(c(4, 2, 7, 6), 2, 2)
inv <- solve(mat)
ide <- mat %*% inv

# See also http://www.purplemath.com/modules/mtrxmult.htm
# for nice matrix multiplication algorithm graphic.

# Generate a random 2 x 2 matrix of integers from 1 to 10
di <- 2
mat <- matrix(sample(1:10, di ^ 2), di, di)
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

# Test using large matrix so caching is evident
lm <- matrix(runif(di ^ 2), di)
cm <- makeCacheMatrix(lm)
# Should take some time
system.time(cs <- cacheSolve(cm))
# Should be much faster
system.time(cs <- cacheSolve(cm))
identical(solve(lm), cs)

# Should produce proper identity matrix
round(lm %*% cs, 4)

# Confirm

system.time(t1 <- cacheSolve(test)) 

system.time(t1 <- cacheSolve(test)) 
