\name{loglik.mix}
\alias{loglik.mix}
\title{
  Loglikelihood for Incomplete Data under the General Location Model
}
\description{
  Calculates the observed-data loglikelihood under the general location 
  model at a user-specified parameter value.
}
\usage{
loglik.mix(s, theta)
}
\arguments{
\item{s}{
  summary list of an incomplete data matrix \code{x} created by
  the function \code{\link{prelim.mix}}.
}
\item{theta}{
  parameter list, such as one produced by \code{\link{ecm.mix}}
  or \code{\link{da.mix}}.
}}
\value{
the value of the loglikelihood function at \code{theta}.
}
\references{
  Schafer, J. L. (1996) \emph{Analysis of Incomplete Multivariate Data.}
  Chapman & Hall, Chapter 9.
}
\seealso{
\code{\link{prelim.mix}}, \code{\link{em.mix}}, \code{\link{ecm.mix}}.
}
\examples{
data(stlouis)
s <- prelim.mix(stlouis,3)       # preliminary manipulations
thetahat <- em.mix(s)      # MLE under unrestricted general location model
loglik.mix(s, thetahat)  # loglikelihood at thetahat
}
\keyword{models}
% Converted by Sd2Rd version 1.21.
