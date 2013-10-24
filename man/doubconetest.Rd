\name{doubconetest}
\alias{doubconetest}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Test for a vector being in the null space of a double cone
}
\description{Given an n-vector y and the model y=m+e, and an m by n "irreducible" matrix amat, test the null hypothesis that the vector m is in the null space of amat.}
\usage{
doubconetest(y, amat, nsim = 1000)
}
\arguments{
  \item{y}{a vector of length n
}
  \item{amat}{an m by n "irreducible" matrix
}
  \item{nsim}{number of simulations to approximate null distribution -- default is 1000, but choose more if a more precise p-value is desired
}
}
\details{The matrix amat defines a polyhedral convex cone of vectors x such that amat\%*\%x>=0, and also the opposite cone amat\%*\%x<=0.   The linear space C is those x such that amat\%*\%x=0.  The function provides a p-value for the null hypothesis that m=E(y) is in C, versus the alternative that it is in one of the two cones defined by amat.
}
\value{
\item{pval}{The p-value for the test} 
\item{p0}{The least-squares fit under the null hypothesis}
\item{p1}{The least-squares fit to the "positive" cone}
\item{p2}{The least-squares fit to the "negative" cone}
}
\references{TBA,
Meyer, M.C. (1999) An Extension of the Mixed Primal-Dual Bases Algorithm to the Case of More Constraints than Dimensions, Journal of Statistical Planning and Inference, 81, pp13-31.
}
\author{Mary C Meyer and Bodhisattva Sen
}
\seealso{
\code{\link{agconst}},\code{\link{partlintest}}
}
\examples{
## test against a constant function
n=100
x=1:n/n
mu=4-5*(x-1/2)^2
y=mu+rnorm(n)
amat=matrix(0,nrow=n-1,ncol=n)
for(i in 1:(n-1)){amat[i,i]=-1;amat[i,i+1]=1}
ans=doubconetest(y,amat)
ans$pval
plot(x,y,col="slategray");lines(x,mu,lty=3,col=3)
lines(x,ans$p1,col=2)
lines(x,ans$p2,col=4)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{monotone regression}
\keyword{hypothesis test}
\keyword{cone projection}