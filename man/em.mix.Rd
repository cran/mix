\name{em.mix}
\alias{em.mix}
\title{
EM Algorithm for Unrestricted General Location Model
}
\description{
  Computes maximum-likelihood estimates for the parameters of the
  unrestricted general location model from an incomplete mixed
  dataset.
}
\usage{
em.mix(s, start, prior=1, maxits=1000, showits=TRUE, eps=0.0001)
}
\arguments{
\item{s}{
  summary list of an incomplete data matrix produced by the function
  \code{\link{prelim.mix}}.
}
\item{start}{
  optional starting value of the parameter.  This is a parameter list in
  packed storage, such as one returned by this function or by
  \code{\link{da.mix}}.
  If structural zeros appear in the contingency table, \code{start$pi} should
  contain zeros in those positions and ones elsewhere. If no starting
  value is supplied, \code{em.mix} chooses its own appropriate starting value.
}
\item{prior}{
  Optional vector or array of hyperparameters for a Dirichlet prior
  distribution. By default, uses a uniform prior on the cell
  probabilities (all hyperparameters set to one). EM algorithm finds the
  posterior mode, which under a uniform prior is the same as a
  maximum-likelihood estimate. If structural zeros appear in the table,
  the corresponding hyperparameters should be set to NA.
}
\item{maxits}{
  maximum number of iterations performed. The algorithm will stop if the
  parameter still has not converged after this many iterations.
}
\item{showits}{
  if \code{TRUE}, reports the iterations of EM so the user can monitor the
  progress of the algorithm.
}
\item{eps}{
  optional convergence criterion. The algorithm stops when the maximum
  relative difference in every parameter from one iteration to the next
  is less than or equal to this value.
}}
\value{
  a list representing the maximum-likelihood estimates (or posterior
  mode) of the normal parameters. This list contains cell probabilities,
  cell means, and covariances.  The parameter can be transformed back to
  the original scale and put into a more understandable format by the
  function \code{\link{getparam.mix}}.
}
\note{
  If zero cell counts occur in the complete-data table, the maximum
  likelihood estimate may not be unique, and the algorithm may converge
  to different stationary values depending on the starting value. Also,
  if zero cell counts occur in the complete-data table, the ML estimate
  may lie on the boundary of the parameter space.
}
\references{
  Schafer, J. L. (1996) \emph{Analysis of Incomplete Multivariate Data.}
  Chapman \& Hall, Chapter 9.
}
\seealso{
  \code{\link{prelim.mix}}, \code{\link{getparam.mix}},
  and \code{\link{ecm.mix}}.
}
\examples{
data(stlouis)
s <- prelim.mix(stlouis,3)    # do preliminary manipulations
thetahat <- em.mix(s)   # compute ML estimate
getparam.mix(s,thetahat, corr=TRUE) # look at estimated parameters
}
\keyword{models}
% Converted by Sd2Rd version 1.21.
