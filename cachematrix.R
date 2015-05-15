
## Put comments here that give an overall description of what your
## functions do

## This function can create a matrix and also cache the inverse of this matrix. For this assignment, assume that the matrix supplied is always invertible.
## This function also provides get / set methods on the matrix and the inverse of the matrix.

makeCacheMatrix = function(x = matrix()) {
    ## Initialize the inverse matrix cache variable to NULL
    im <- NULL

    ## Set function. Initialize the matrix 'x' to the passed in matrix parameter 'y'
    set <- function(y) {
        x <<- y
        im <<- NULL
    }

    ## Get function. Returns the matrix 'x'
    get <- function() x

    ## Sets the cache variable 'im' to the inverse matrix passed in as the parameter.
    setinverse <- function(inverse) im <<- inverse

    ## Returns the cached value of the inverse matrix stored in 'im'.
    getinverse <- function() im

    ## Exposes a list of all the get / set functions
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}

## This function computes the inverse of the "matrix" returned by "makeCacheMatrix". If an inverse already exists, it just retrieves it.
## It returns the inverse of the matrix.

cacheSolve <- function(x, ...) {
    ## Retrieve the inverse of the matrix from the cache
    im <- x$getinverse()

    ## If the cache is not empty, display a message and return the inverse obtained the cache.
    if (!is.null(im)) {
        message ("getting cached inverse")
        return (im)
    }

    ## Retrieve the matrix using 'get' from the makeCacheMatrix
    data <- x$get()

    ## Compute the inverse of the matrix using the solve function.
    im <- solve(data)

    ## Cache the inverse of the matrux using the 'setinverse' from makeCacheMatrix 
    x$setinverse(im)

    ## return the inverse matrix.
    im
}


