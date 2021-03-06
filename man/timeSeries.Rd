\name{TimeSeriesClass}


\title{timeSeries Class}


\alias{TimeSeriesClass}

\alias{timeSeries}
\alias{timeSeries,ANY,ANY-method}
\alias{timeSeries,ANY,missing-method}
\alias{timeSeries,ANY,timeDate-method}
\alias{timeSeries,matrix,ANY-method}
\alias{timeSeries,matrix,missing-method}
\alias{timeSeries,matrix,timeDate-method}
\alias{timeSeries,missing,ANY-method}
\alias{timeSeries,missing,missing-method}
\alias{timeSeries,missing,timeDate-method}
\alias{timeSeries,matrix,numeric-method}

\alias{index_timeSeries}
\alias{time_timeSeries}
\alias{timeSeries-class}
\alias{index_timeSeries-class}
\alias{time_timeSeries-class}
\alias{initialize,timeSeries-method}

\alias{seriesData}


\description{
    
    Functions to generate and modify 'timeSeries' objects:         

    \tabular{ll}{   
    \code{timeSeries} \tab Creates a 'timeSeries' object from scratch.}
    
    Data Slot and classification of 'timeSeries' objects: 
    
    \tabular{ll}{        
    \code{seriesData} \tab Extracts data slot from a 'timeSeries'. }          
}


\usage{
timeSeries(data, charvec, units = NULL, format = NULL, zone = "", 
    FinCenter = "", recordIDs = data.frame(), title = NULL, 
    documentation = NULL, \dots)

seriesData(object)
}


\arguments{

    \item{charvec}{
        a character vector of dates and times or any objects which can
        be coerced to a \code{timeDate} object.
        }
    \item{data}{
        a \code{matrix} object or any objects which can be coereced to a matrix.
        }
    \item{documentation}{
        optional documentation string, or a vector of character strings.
        }
    \item{FinCenter}{
        a character with the the location of the  financial center named 
        as "continent/city". 
        }
    \item{format}{
        the format specification of the input character vector,
        \cr
        [as.timeSeries] - \cr
        a character string with the format in POSIX notation to be passed 
        to the time series object.
        }  
    \item{object}{
        [is][seriesData][seriesPositions][show][summary] -    
        an object of class \code{timeSeries}.
        }
    \item{recordIDs}{
        a data frame which can be used for record identification
        information. \cr
        [print] - \cr
        a logical value. Should the \code{recordIDs} printed together
        with the data matrix and time series positions?
        }
    \item{title}{
        an optional title string, if not specified the inputs data 
        name is deparsed.
        }
    \item{units}{
        an optional character string, which allows to overwrite the 
        current column names of a \code{timeSeries} object. By default 
        \code{NULL} which means that the column names are selected
        automatically. 
        }     
    \item{zone}{
        the time zone or financial center where the data were recorded.
        }  
    \item{\dots}{
        arguments passed to other methods.
        }

}


\value{

    \code{timeSeries}\cr
    returns a S4 object of class \code{timeSeries}.
    \cr
    
    
    \code{seriesData}\cr
    \cr
    extracts the \code{@.Data} slot from a \code{timeSeries} object and
    is equivalent to \code{as.amtrix}.
}


\details{

    \bold{Generation of Time Series Objects:}
    \cr
    
    We have defined a \code{timeSeries} class which is in many aspects similar
    to the S-Plus class with the same name, but has also some important
    differences. The class has seven Slots, the 'Data' slot which holds 
    the time series data in matrix form, the 'position' slot which holds
    the time/date as a character vector, the 'format' and 'FinCenter'
    slots which are the same as for the 'timeDate' object, the 'units'
    slot which holds the column names of the data matrix, and a 'title'
    and a 'documentation' slot which hold descriptive character strings.
    Date and time is managed in the same way as for \code{timeDate} objects.

}


\note{

    These functions were written for Rmetrics users using R and Rmetrics
    under Microsoft's Windows operating system where timze zones, 
    daylight saving times and holiday calendars are insuffeciently 
    supported. 
    
}


\examples{
## Load Microsoft Data -
   # Microsoft Data: 
   setRmetricsOptions(myFinCenter = "GMT")
   data(MSFT)
   head(MSFT)

## Create a timeSeries Object, The Direct Way ...
   Close <- MSFT[, 5]
   head(Close)
   
## Create a timeSeries Object from Scratch - 
   data <- as.matrix(MSFT[, 4])
   charvec <- rownames(MSFT)
   Close <- timeSeries(data, charvec, units = "Close")
   head(Close)
   c(start(Close), end(Close))
    
## Cut out April Data from 2001 - 
   tsApril01 <- window(Close, "2001-04-01", "2001-04-30") 
   tsApril01

## Compute Continuous Returns - 
   returns(tsApril01)
   
## Compute Discrete Returns - 
   returns(tsApril01, type = "discrete")
   
## Compute Discrete Returns, Don't trim -
   returns(tsApril01, trim = FALSE)
   
## Compute Discrete Returns, Use Percentage Values - 
   tsRet <- returns(tsApril01, percentage = TRUE, trim = FALSE)
   tsRet
     
## Aggregate Weekly - 
   GoodFriday(2001)
   to <- timeSequence(from = "2001-04-11", length.out = 3, by = "week") 
   from <- to - 6*24*3600
   from
   to
   applySeries(tsRet, from, to, FUN = sum)

## Create large timeSeries objects with different 'charvec' object classes - 
   # charvec is a 'timeDate' object
   head(timeSeries(1:1e6L, timeSequence(length.out = 1e6L, by = "sec")))
   head(timeSeries(1:1e6L, seq(Sys.timeDate(), length.out = 1e6L, by = "sec")))
   # 'charvec' is a 'POSIXt' object
   head(timeSeries(1:1e6L, seq(Sys.time(), length.out = 1e6L, by = "sec")))
   # 'charvec' is a 'numeric' object
   head(timeSeries(1:1e6L, 1:1e6L))
}


\keyword{chron}

