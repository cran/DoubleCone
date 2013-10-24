\name{adhd}
\alias{adhd}
\docType{data}
\title{Sub-clinical ADHD behaviors and classroom functioning in school-age children}
\description{Observations on children aged 9-11 in classroom settings, for a study on the effects of sub-clinical hyperactive and inattentive behaviors on social and academic functioning.}
\usage{data(adhd)}
\format{
  A data frame with 686 observations on the following 4 variables.
  \describe{
    \item{\code{sex}}{1=boy; 2=girl}
    \item{\code{ethn}}{1=Colombian, 2=African American, 3=Hispanic American, 5=European American}
    \item{\code{hypb}}{Classroom hyperactive behavior level}
    \item{\code{fcn}}{A measure of social and academic functioning}
  }
}
\source{Brewis, A.A. Schmidt, K.L., and Meyer, M.C. (2000) ADHD-type behavior and harmful dysfunction in childhood: a cross-cultural model, American Anthropologist, 102(4), pp823-828.
}
\examples{
data(adhd)
plot(adhd$hypb,adhd$fcn) 
}
\keyword{datasets}
