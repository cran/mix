\name{getparam.mix}
\alias{getparam.mix}
\title{
Present Parameters of General Location Model in an Understandable Format
}
\description{
Present parameters of general location model in an understandable format.
}
\usage{
getparam.mix(s, theta, corr=FALSE)
}
\arguments{
\item{s}{
  summary list of an incomplete normal data matrix created by the
  function \code{\link{prelim.mix}}.
}
\item{theta}{
  list of parameters such as one produced by the function \code{\link{em.mix}},
  \code{\link{da.mix}}, \code{\link{ecm.mix}}, or \code{\link{dabipf.mix}}.
}
\item{corr}{
  if \code{FALSE}, returns a list containing an array of cell probabilities, 
  a matrix of cell means, and a variance-covariance matrix.
  If \code{TRUE}, returns a list containing an array of cell probabilities,
  a matrix of cell means, a vector of standard deviations, and a correlation
  matrix. 
}}
\value{
  if \code{corr=FALSE}, a list containing the components \code{pi},
  \code{mu} and \code{sigma}; if
  \code{corr=TRUE}, a list containing the components \code{pi}, \code{mu},
  \code{sdv}, and \code{r}.

  The components are:

  \item{pi}{
    array of cell probabilities whose dimensions correspond to the
    columns of the categorical part of $x$. The dimension is
    \code{c(max(x[,1]),max(x[,2]),\dots,max(x[,p]))} where \eqn{p}
    is the number of categorical variables. 
  }
  \item{mu}{
    Matrix of cell means. The dimension is \code{c(q,D)} where \eqn{q} is the
    number of continuous variables in \eqn{x}, and \eqn{D} is
    \code{length(pi)}.  The order of the rows, corresponding to the
    elements of \code{pi}, is the same order we would get by
    vectorizing \code{pi}, as in \code{as.vector(pi)}; it is
    the usual lexicographic order used by S and Fortran, with the
    subscript corresponding to \code{x[,1]} varying the fastest, and the
    subscript corresponding to \code{x[,p]} varying the slowest.
  }
  \item{sigma}{
    matrix of variances and covariances corresponding to the continuous
    variables in \code{x}.
  }
  \item{sdv}{
    vector of standard deviations corresponding to the continuous
    variables in \code{x}.
  }
  \item{r}{
    matrix of correlations corresponding to the continuous
    variables in \code{x}.
}}
\note{
  In a restricted general location model, the matrix of means is
  required to satisfy \code{t(mu)=A\%*\%beta} for a given design matrix
  \code{A}. To obtain \code{beta}, perform a multivariate regression
  of \code{t(mu)} on \code{A} --- for
  example, \code{beta <- lsfit(A, t(mu), intercept=FALSE)$coef}.
}
\references{
  Schafer, J. L. (1996) \emph{Analysis of Incomplete Multivariate Data.}
  Chapman \& Hall, Chapter 9.
}
\seealso{
  \code{\link{prelim.mix}}, \code{\link{em.mix}}, \code{\link{ecm.mix}},
  \code{\link{da.mix}}, \code{\link{dabipf.mix}}.
}
\examples{
data(stlouis)
s <- prelim.mix(stlouis,3)    # do preliminary manipulations
thetahat <- em.mix(s)   # compute ML estimate
getparam.mix(s, thetahat, corr=TRUE)$r   # look at estimated correlations 
}
\keyword{models}
% Converted by Sd2Rd version 1.21.
