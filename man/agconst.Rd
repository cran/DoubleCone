\name{agconst}
\alias{agconst}
\title{Test null hypothesis of constant regression function against a general, high-dimensional alternative}
\description{Given a response and 1-3 predictors, the function will test the null hypothesis that the response and predictors are not related (i.e., regression function is constant), against the alternative that the regression function is monotone in each of the predictors.   For one predictor, the alternative set is a double cone; for two predictors the alternative set is a quadruple cone, and an octuple cone alternative is used when there are three predictors.}
\usage{
agconst(y, xmat, nsim = 1000)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{y}{A numeric response vector, length n
}
  \item{xmat}{an n by k design matrix, full column rank, where k=1,2, or 3.
}
  \item{nsim}{The number of data sets simulated under the null hypothesis, to estimate the null distribution of the test statistic.  The default is 1000, make this larger if a more precise p-value is desired.}
}
\details{For one predictor, the set of non-decreasing regression functions can be described by an n-dimensional convex polyhedral cone, and the set of non-increasing regression functions is the "opposite" cone.  The one-dimensional null space is the intersection of these cones.   For two predictors, the alternative set consists of four cones, defined by combinations of increasing/decreasing assumptions, and for three predictors we have eight cones.}
\value{
\item{pval}{The p-value for the test: H0: constant regression function}
\item{p1 through p8}{monotone fits -- only p1 and p2 are returned for one predictor, etc.}
\item{thetahat}{The least-squares alternative fit -- i.e., the projection onto the multiple-cone alternative}
}
\references{
TBA
}
\author{Mary C Meyer and Bodhisattva Sen}
\seealso{
\code{\link{doubconetest}},\code{\link{partlintest}}
}
\examples{
	n=100
	x1=runif(n);x2=runif(n);xmat=cbind(x1,x2)
	mu=1:n;for(i in 1:n){mu[i]=20*max(x1[i]-2/3,x2[i]-2/3,0)^2}
	x1g=1:21/22;x2g=x1g
	par(mar=c(1,1,1,1))
	y=mu+rnorm(n)
	ans=agconst(y,xmat,nsim=0)
	grfit=matrix(nrow=21,ncol=21)
	for(i in 1:21){for(j in 1:21){
			if(sum(x1>=x1g[i]&x2>=x2g[j])>0){
				if(sum(x1<=x1g[i]&x2<=x2g[j])>0){
					f1=min(ans$thetahat[x1>=x1g[i]&x2>=x2g[j]])
					f2=max(ans$thetahat[x1<=x1g[i]&x2<=x2g[j]])
					grfit[i,j]=(f1+f2)/2
				}else{
					grfit[i,j]=min(ans$thetahat)
				}
			}else{grfit[i,j]=max(ans$thetahat)}
	}}
	persp(x1g,x2g,grfit,th=-50,tick="detailed",xlab="x1",ylab="x2",zlab="mu")
##to get p-value for test against constant function:
#	ans=agconst(y,xmat,nsim=1000)
#	ans$pval
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{multiple isotonic regression}
\keyword{model test}
