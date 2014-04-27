## Please make sure to load MASS package 
## Use the below statement

## library(MASS)

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
	set <- function(y){
		x <<- y
		m <<- NULL
	}
	
	get <- function() x
	setInverse <- function(inpParam) m <<- inpParam
	getInverse <- function() m
	list(set=set,get=get,setInverse=setInverse,getInverse=getInverse)

}


## It calculates the inverse of the matrix, or returns cache value if available

cacheSolve <- function(x, ...) {
        m <- x$getInverse()
	if(!is.null(m)){
		message("Returning cached data")
		return(m)
	}
	data <- x$get()
	m <- ginv(data)       # Necessary to load MASS package to use this function
	x$setInverse(m)
	m
}
