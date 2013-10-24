\name{partlintest}
\alias{partlintest}
\title{Tests linear versus partial linear model
}
\description{
Given a response y, a predictor x, and covariates z, the model y=m(x) +b'z +e is considered, where e is a mean-zero random error.   There are three options for the null hypothesis: h0=0 tests m(x) is constant; h0=1 tests m(x) is linear, and h0=2 tests m(x) is quadratic.   The (respective) alternatives are: m(x) is increasing or decreasing, m(x) is convex or concave, and m(x) is hyper-convex or hyper-concave (referring to the third derivative of m).
}
\usage{
partlintest(x, y, zmat, h0 = 0, nsim = 1000)
}
\arguments{
  \item{x}{a vector of length n; this is the main predictor of interest
}
  \item{y}{a vector of length n; this is the response
}
  \item{zmat}{an n by k matrix of covariates, should be full column rank . 
}
  \item{h0}{An indicator of what null hypothesis is to be tested: h0=0 for the null hypothesis: m(x) is constant; h0=1 tests m(x) is linear, and h0=2 tests m(x) is quadratic. 
}
  \item{nsim}{The number of simulations used in creating the null distribution of the test statistic.  The default is nsim=1000, if a more precise p-value is desired, make nsim larger.}
}
\details{For the constant null hypothesis, the alternative fit is either the monotone increasing or monotone decreasing fit -- whichever minimizes the sum of squared residuals.  For the linear null hypothsis, the alternative fit is either convex or concave, and for the quadratic null hypothesis, the alternative fit is constrained so that the third derivative is either positive or negative over the range of x-values.}
\value{
\item{pval}{The p-value for the test}
\item{p0}{The null hypothesis fit}
\item{p1}{The "positive" fit}
\item{p2}{The "negative" fit}
}
\references{
TBA
}
\author{
Mary C Meyer and Bodhisattva Sen
}

\seealso{
\code{\link{agconst}},\code{\link{doubconetest}}
}
\examples{
data(derby)
n=length(derby$speed)
zmat=matrix(0,nrow=n,ncol=2);zvec=1:n*0+1
zmat[derby$cond=="good",1]=1;zvec[derby$cond=="good"]=2
zmat[derby$cond=="fast",2]=1;zvec[derby$cond=="fast"]=3
ans=partlintest(derby$year,derby$speed,zmat,h0=2)
ans$pval
par(mar=c(4,4,1,1));par(mfrow=c(1,2))
plot(derby$year,derby$speed,col=zvec,pch=zvec)
points(derby$year,ans$p0,pch=20,col=zvec)
title("Null fit")
legend(1980,51.6,pch=3:1,col=3:1,legend=c("fast","good","slow"))
plot(derby$year,derby$speed,col=zvec,pch=zvec)
points(derby$year,ans$p1,pch=20,col=zvec)
title("Alternative fit")

data(adhd)
n=length(adhd$sex)
zmat=matrix(0,nrow=n,ncol=2)
zmat[adhd$sex==1,1]=1
zmat[adhd$ethn<5,2]=1
ans=partlintest(adhd$hypb,adhd$fcn,zmat,h0=1)
ans$pval
cols=c("pink3","lightskyblue3")
plot(adhd$hypb,adhd$fcn,col=cols[zmat[,1]+1],pch=zmat[,2]+1,
xlab="Hyperactive behavior level",ylab="Social and Academic Function Score")
cols2=c(2,4)
points(adhd$hypb,ans$p1,col=cols2[zmat[,1]+1],pch=20)

}
\keyword{ partial linear test}
\keyword{semiparametric}
