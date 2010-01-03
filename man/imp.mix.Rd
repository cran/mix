\name{imp.mix}
\alias{imp.mix}
\title{
Impute Missing Data Under General Location Model
}
\description{
  This function, when used with \code{\link{da.mix}} or
  \code{\link{dabipf.mix}}, can be
  used to create proper multiple imputations of missing data under
  the general location model with or without restrictions.
}
\usage{
imp.mix(s, theta, x)
}
\arguments{
\item{s}{
  summary list of an incomplete data matrix \code{x} created by the
  function \code{prelim.mix}.
}
\item{theta}{
  value of the parameter under which the missing data are to be
  randomly imputed. This is a parameter list such as one created
  by \code{\link{da.mix}} or \code{\link{dabipf.mix}}.
}
\item{x}{
  the original data matrix used to create the summary list \code{s}. If this
  argument is not supplied, then the data matrix returned by this
  function may disagree slightly with the observed values in \code{x} due to
  rounding errors.
}}
\value{
  a matrix of the same form as \code{x}, but with all missing values filled in
  with simulated values drawn from their predictive distribution given
  the observed data and the specified parameter.
}
\details{
  This function is essentially the I-step of data augmentation. 
}
\note{
  The random number generator seed must be set at least once by the
  function \code{\link{rngseed}} before this function can be used.
}
\references{
  Schafer, J. L. (1996) \emph{Analysis of Incomplete Multivariate Data.}
  Chapman \& Hall, Chapter 9.
}
\seealso{
  \code{\link{prelim.mix}}, \code{\link{da.mix}},
  \code{\link{dabipf.mix}}, \code{\link{rngseed}}
}
\examples{
data(stlouis)
s <- prelim.mix(stlouis,3)    # do preliminary manipulations
thetahat <- em.mix(s)   # ML estimate for unrestricted model
rngseed(1234567)     # set random number generator seed
newtheta <- da.mix(s,thetahat,steps=100) # data augmentation
ximp <- imp.mix(s, newtheta, stlouis)  # impute under newtheta
}
\keyword{models}
% Converted by Sd2Rd version 1.21.
