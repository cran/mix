\name{stlouis}
\alias{stlouis}
\docType{data}
\title{St. Louis Risk Research Project}
\description{
  The St. Louis Risk Research Project was an observational study to
  assess the affects of parental psychological disorders on child
  development.  In the preliminary study, 69 families with 2 children
  were studied.
}
\usage{data(stlouis)}
\format{
  This is a numeric matrix with 69 rows and 7 columns:
  \tabular{rll}{
    \code{[,1]} \tab \code{G}  \tab Parental risk group\cr
    \code{[,2]} \tab \code{D1} \tab Symptoms, child 1\cr
    \code{[,3]} \tab \code{D2} \tab Symptoms, child 2\cr
    \code{[,4]} \tab \code{R1} \tab Reading score, child 1\cr
    \code{[,5]} \tab \code{V1} \tab Verbal score, child 1\cr
    \code{[,6]} \tab \code{R2} \tab Reading score, child 2\cr
    \code{[,7]} \tab \code{V2} \tab Verbal score, child 2
  }

  The parental risk group was coded 1, 2 or 3, from low or high, and the
  child symptoms 1 = low or 2 = high.  Missing values occur on all
  variables except \code{G}.
}
\source{
  Little, R. J. A.  and Schluchter, M. D. (1985), Maximum-likelihood
  estimation for mixed continuous and categorical data with missing
  values. \emph{Biometrika}, \bold{72}, 492--512.

  Schafer, J. L. (1996) \emph{Analysis of Incomplete Multivariate Data.}
  Chapman & Hall. pp. 359--367.
}
\keyword{datasets}
