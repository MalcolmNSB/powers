#' Power and Box-Cox Transformations
#'
#' Take the square, cube,
#' reciprocal/inverse, or Box-Cox transform (with parameter lambda) of a vector.
#'
#' @param x The vector of data.
#' @param lambda A parameter for the Box-Cox transformation only, of length 1 or 2.
#' @param plot_it Display a plot of \code{x} and a power of \code{x}? Use logical.
#' \code{FALSE} by default. Not used for the Box-Cox transform.
#'
#' @return
#' A vector that is the:
#' \itemize{
#'      \item square (for \code{square})
#'      \item cube (for \code{cube})
#'      \item reciprocal/inverse (for \code{reciprocal})
#'      \item Box-Cox transform (for \code{Box_Cox_transform}), with either one or two parameters
#'      (see https://en.wikipedia.org/wiki/Power_transform#Box%E2%80%93Cox_transformation for
#'      further details on the transform.)
#'
#' }
#'  of \code{x}.
#'
#' @details
#' If you really want to see more, check out the internal \code{\link{pow}}
#' function that these functions depend on.
#' @examples
#' cube(tenvec)
#' square(-5)
#' reciprocal(2)
#' Box_Cox_transform(c(1,1.73,2.3), 0.5)
#'
#' @rdname square
#' @export
square <- function(x, plot_it=FALSE) pow(x, a=2, plot_it=plot_it)

#' @rdname square
#' @export
cube <- function(x, plot_it=FALSE) pow(x, a=3, plot_it=plot_it)


#' @rdname square
#' @export
reciprocal <- function(x, plot_it=FALSE) pow(x, a=-1, plot_it=plot_it)



#' @rdname square
#' @export
Box_Cox_transform <- function(x, lambda){

    if(length(lambda)> 2){
        stop("lambda has to be of length 1 or 2")
    }

    if(length(lambda) == 1){
        if(all(x > 0)){
            if(lambda != 0){
             (pow(x, a = lambda, FALSE) - 1)/lambda
             }
            else{
             log(x)
            }
        }
        else{
            stop("vector input must have all positive entries")
        }
    }



    else{
        if(all(x > -lambda[2])){
                if(lambda[1] != 0){
                    (pow(x + lambda[2], a = lambda[1], FALSE) - 1)/lambda[1]
                }
                else{
                 log(x + lambda[2])
                }

        }
        else{
            stop("entries of vector input must be greater than -lambda[2]")
        }
    }
}



