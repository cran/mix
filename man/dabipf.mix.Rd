\name{dabipf.mix}
\alias{dabipf.mix}
\title{
  Data Augmentation/Bayesian IPF Algorithm for Restricted General Location
Models
}
\description{
  Markov Chain Monte Carlo method for generating posterior draws of the
  parameters of the unrestricted general location model, given a matrix
  of incomplete mixed data.  After a suitable number of steps are taken,
  the resulting value of the parameter may be regarded as a random draw
  from its observed-data posterior distribution. May be used together
  with \code{\link{imp.mix}} to create multiple imputations
  of the missing data.
}
\usage{
dabipf.mix(s, margins, design, start, steps=1, prior=0.5, 
           showits=FALSE)
}
\arguments{
\item{s}{
  summary list of an incomplete data matrix created by the
  function \code{\link{prelim.mix}}.
}
\item{margins}{
  vector describing the sufficient configurations or margins in the
  desired loglinear model. The variables are ordered in the original
  order of the columns of \code{x}, so that 1 refers to \code{x[,1]},
  2 refers to
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
  starting value of the parameter. This is a parameter list
  such as one created by this function or by \code{\link{ecm.mix}}.
}
\item{steps}{
  number of steps of data augmentation-Bayesian IPF to be taken.
}
\item{prior}{
  Optional vector or array of hyperparameter(s) for a Dirichlet prior
  distribution.  The default is the Jeffreys prior (all hyperparameters
  = .5). If structural zeros appear in the table, prior counts for these
  cells should be set to \code{NA}.
}
\item{showits}{
  if \code{TRUE}, reports the iterations so the user can monitor the
  progress of the algorithm. 
}}
\value{
  a new parameter list. The parameter can be put into a more
  understandable format by the function \code{\link{getparam.mix}}.
}
\details{
  The prior distribution used by this function is a combination of a
  constrained Dirichlet prior for the cell probabilities, an improper
  uniform prior for the regression coefficients, and the improper Jeffreys
  prior for the covariance matrix. The posterior distribution is not
  guaranteed to exist, especially in sparse-data situations. If this
  seems to be a problem, then better results may be obtained by imposing
  restrictions further restrictions on the parameters.
}
\note{
  The random number generator seed must be set at least once by the
  function \code{\link{rngseed}} before this function can be used.


  The starting value should satisfy the restrictions of the model and
  should lie in the interior of the parameter space. A suitable starting
  value can be obtained by running \code{\link{ecm.mix}},
  possibly with the prior 
  hyperparameters set to some value greater than 1, to ensure that the
  mode lies in the interior.
}
\references{
  Schafer, J. L. (1996) \emph{Analysis of Incomplete Multivariate Data.}
  Chapman & Hall, Chapter 9.
}
\seealso{
  \code{\link{prelim.mix}}, \code{\link{getparam.mix}},
  \code{\link{ecm.mix}}, \code{\link{rngseed}}, \code{\link{imp.mix}}.
}
\examples{
data(stlouis)
s <- prelim.mix(stlouis,3)      # do preliminary manipulations
margins <- c(1,2,3)       # saturated contingency table model
design <- diag(rep(1,12))  # identity matrix  D=no of cells
thetahat <- ecm.mix(s,margins,design) # find ML estimate
rngseed(1234567)       # random generator seed
newtheta <- dabipf.mix(s,margins,design,thetahat,steps=200)
ximp <- imp.mix(s,newtheta,stlouis)   # impute under newtheta
}
\keyword{models}
% Converted by Sd2Rd version 1.21.
