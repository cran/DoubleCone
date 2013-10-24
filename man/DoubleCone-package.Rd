\name{DoubleCone-package}
\alias{DoubleCone-package}
\alias{DoubleCone}
\docType{package}
\title{
Test against a Parametric Function}
\description{Given a response and predictors, the null hypothesis of a parametric regression function is tested versus a large-dimensional alternative in the form of a union of polyhedral convex cones.
}
\details{
\tabular{ll}{
Package: \tab DoubleCone\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2013-10-24\cr
License: \tab GPL-2 | GPL-3\cr
}
The \code{doubconetest} function is the generic version.  The user provides an irreducible constraint matrix that defines two convex cones; the intersection of the cones is the null space of the matrix.   The function provides a p-value for the test that the expected value of a vector is in the null space using the double-cone alternative.   

Given a vector \code{y} and a design matrix \code{X}, the \code{agconst} function performs a test of the null hypothesis that the expected value of \code{y} is constant versus the alternative that it is monotone (increasing or decreasing) in each of the predictors.   

The function \code{partlintest} performs a test of a linear model versus a partial linear model, using a double-cone alternative.
}
\author{
Mary C Meyer and Bodhisattva Sen
Maintainer: Mary C Meyer <meyer@stat.colostate.edu>
}
\references{
TBA
}
\keyword{ package }
