\name{ecm.mix}
\alias{ecm.mix}
\title{
ECM Algorithm for Restricted General Location Model
}
\description{
Computes maximum-likelihood estimates  for the parameters of the
general location model from an incomplete mixed dataset.
}
\usage{
ecm.mix(s, margins, design, start, prior=1, maxits=1000, 
        showits=TRUE, eps=0.0001)
}
\arguments{
\item{s}{
  summary list of an incomplete data matrix \code{x} produced by
  the function \code{\link{prelim.mix}}.
}
\item{margins}{
vector describing the sufficient configurations or margins in the
desired loglinear model. The variables are ordered in the original
order of the columns of \code{x}, so that 1 refers to \code{x[,1]}, 2 refers to
\code{x[,2]}, and so on.  A margin is described by the factors not summed
over, and margins are separated by zeros.  Thus c(1,2,0,2,3,0,1,3)
would indicate the (1,2), (2,3), and (1,3) margins in a three-way
table, i.e., the model of no three-way association.
}
\item{design}{
  design matrix specifying the relationship of the continuous
  variables to the categorical ones. The dimension is \code{c(D,r)} where
  \eqn{D} is the number of cells in the contingency table, and \eqn{r} is the
  number of effects which must be less than or equal to \eqn{D}. The
  order of the rows corresponds to the storage order of the cell
  probabilities in the contingency table; see \code{\link{getparam.mix}} for
  details.
}
\item{start}{
  optional starting value of the parameter. This is a list such as one
  created by this function or by \code{\link{dabipf.mix}}. If structural zeros
  appear in the table, \code{start$pi} should contain zeros in those
  positions and ones elsewhere. If no starting value is supplied,
  \code{\link{ecm.mix}} chooses its own appropriate starting value.
}
\item{prior}{
  Optional vector or array of hyperparameter(s) for a Dirichlet prior
  distribution. By default, uses a uniform prior on the cell
  probabilities. ECM finds the posterior mode, which under
  a uniform prior is the same as a maximum-likelihood estimate. If
  structural zeros appear in the table, hyperparameters for those cells
  should be set to \code{NA}..
}
\item{maxits}{
  maximum number of iterations performed. The algorithm will stop if the
  parameter still has not converged after this many iterations.
}
\item{showits}{
  if \code{TRUE}, reports the iterations of ECM so the user can monitor
  the progress of the algorithm.
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
  if zero cell counts occur in the complete-data table, the ML estimate may
  lie on the boundary of the parameter space.
}
\references{
  Schafer, J. L. (1996) \emph{Analysis of Incomplete Multivariate Data.}
  Chapman \& Hall, Chapter 9.
}
\seealso{
  \code{\link{prelim.mix}}, \code{\link{em.mix}},
  \code{\link{getparam.mix}},
  \code{\link{loglik.mix}}.
}
\examples{
data(stlouis)
s <- prelim.mix(stlouis,3)         # preliminary manipulations
margins <- c(1,2,3)          # saturated loglinear model
design <- diag(rep(1,12))     # identity matrix, D=no of cells
thetahat <- ecm.mix(s,margins,design)  # should be same as em.mix(s)
loglik.mix(s,thetahat)             # loglikelihood at thetahat
}
\keyword{models}
% Converted by Sd2Rd version 1.21.
