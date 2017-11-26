## makeCacheMatrix creates a special matrix object, and then cacheSolve 

## calculates the inverse of the matrix.

## If the matrix inverse has already been calculated, it will instead 

## find it in the cache and return it, and not calculate it again.



makeCacheMatrix <- function(x = matrix()) {

    

    x_inverse <- NULL

    

    # function to set the value of the matrix. It also clears the previous caches

    set <- function(x){

        x <<- y

        x_inverse <<- NULL

    }

    

    #function to get the value of matrix

    get <- function() {x}

    

    #function to set the inverse of the matrix 

    set_inverse <- function(inverse) { x_inverse <<- inverse}

    

    #function to get the inverse value of the matrix

    get_inverse <- function(){x_inverse}

    

    #returning the list of all functions 

    list(set = set,

         get = get,

         set_inverse = set_inverse,

         get_inverse = get_inverse)

    

}





## The function cacheSolve returns the inverse of a matrix created with the above makeCacheMatrix function

## If the cached inverse is available, cacheSolve retrieves it

## otherwise it inverts and return the inversion value

## Meanwhile it also stores the latest cache result to retrive in future





cacheSolve <- function(x, ...) {

    

    #capturing x_inversion value 

    x_inverse <- x$get_inverse()

    

    #checking if cache is available

    if (!is.null(x_inverse)) {

        

        message("getting cached inverse matrix")

        

        return(x_inverse)

        

    }

    #making inverse

    x_inverse <- solve(x$get())

    #making cache value

    x$set_inverse(x_inverse)

    

    return(x_inverse)

    

}
