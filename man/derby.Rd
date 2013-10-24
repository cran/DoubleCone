\name{derby}
\alias{derby}
\docType{data}
\title{Kentucky Derby Winner Speed}
\description{The Speeds of the Winning Horses in the Kentucky Derby, 1896-2012}
\usage{data(derby)}
\format{
  A data frame with 117 observations on the following 4 variables.
  \describe{
    \item{\code{speed}}{winning speed}
    \item{\code{year}}{year of race}
    \item{\code{cond}}{track condition with levels \code{fast} \code{good} \code{heav} \code{mudd} \code{slop} \code{slow}}
    \item{\code{name}}{Name of the winning horse}
  }
}
\source{
\url{www.kentuckyderby.com}
}
\examples{
data(derby)
n=length(derby$year)
track=1:n*0+1
track[derby$cond=="good"]=2
track[derby$cond=="fast"]=3
plot(derby$year,derby$speed,col=track)
}
\keyword{datasets}
