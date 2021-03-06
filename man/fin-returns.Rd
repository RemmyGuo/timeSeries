\name{returns}


\title{Financial Returns}


\alias{returns}
\alias{returns,ANY-method}
\alias{returns,timeSeries-method}

\alias{returns0}

\alias{returnSeries}
\alias{getReturns}


\description{
    
    Compute financial returns from prices or indexes.
       
}


\usage{
returns(x, \dots)
returns0(x, \dots)

\S4method{returns}{ANY}(x, method = c("continuous", "discrete", 
    "compound", "simple"), percentage = FALSE, \dots)
\S4method{returns}{timeSeries}(x, method = c("continuous", "discrete", 
    "compound", "simple"), percentage = FALSE, na.rm = TRUE, 
    trim = TRUE, \dots) 

getReturns(\dots)
returnSeries(\dots)
}


\arguments{

    \item{x}{
        an object of class \code{timeSeries}.
        }
    \item{percentage}{
        a logical value. By default \code{FALSE}, if \code{TRUE} the 
        series will be expressed in percentage changes.
        }
    \item{method}{
        a character string. Which method should be used to compute
        the returns, "continuous", "discrete", or "compound", "simple".
        The second pair of methods is a synonyme for the first two
        methods.
        }    
    \item{na.rm}{
        a logical value. Should NAs be removed? By Default \code{TRUE}.
        }    
    \item{trim}{
        a logical value. Should the time series be trimmed? By Default 
        \code{TRUE}.
        }    
    \item{\dots}{
        arguments to be passed.
        }
        
}


\value{

    all functions return an object of class \code{timeSeries}.
    
    \code{returns0} returns am untrimmed series with the first
    row of returns set to zero(s).
        
}


\note{

    The functions \code{returnSeries}, \code{getReturns}, 
    are synonymes for the function \code{returns}. We do
    not recommend to use these functions.

}
    

\examples{
## Load Microsoft Data - 
   setRmetricsOptions(myFinCenter = "GMT")
   data(MSFT)
   X = MSFT[1:10, 1:4]
   X

## Continuous Returns - 
   returns(X)
   returns0(X)
  
## Discrete Returns:
   returns(X, method = "discrete")
   
## Don't trim:
   returns(X, trim = FALSE)
   
## Use Percentage Values:
   returns(X, percentage = TRUE, trim = FALSE)
}


\keyword{chron}

