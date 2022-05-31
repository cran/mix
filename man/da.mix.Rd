\name{da.mix}
\alias{da.mix}
\title{
  Data Augmentation for Unrestricted General Location Model
}
\description{
  Markov Chain Monte Carlo method for generating posterior draws of the
  parameters of the unrestricted general location model, given a matrix of
  incomplete mixed data.  At each step, missing data are randomly imputed
  under the current parameter, and a new parameter value is drawn from its
  posterior distribution given the completed data.  After a suitable
  number of steps are taken, the resulting value of the parameter may be
  regarded as a random draw from its observed-data posterior
  distribution. May be used together with \code{\link{imp.mix}} to create
  multiple imputations of the missing data.
}
\usage{
da.mix(s, start, steps=1, prior=0.5, showits=FALSE)
}
\arguments{
  \item{s}{
    summary list of an incomplete data matrix created by the
    function \code{\link{prelim.mix}}.
  }
  \item{start}{
    starting value of the parameter. This is a parameter list
    such as one created by the function \code{\link{em.mix}}.
  }
  \item{steps}{
    number of data augmentation steps to be taken.
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
  A new parameter list. The parameter can be put into a more
  understandable format by the function \code{getparam.mix}.
}
\details{
  The prior distribution used by this function is a combination of a
  Dirichlet prior for the cell probabilities, an improper uniform prior
  for the within-cell means, and the improper Jeffreys prior for the
  covariance matrix. The posterior distribution is not guaranteed to
  exist, especially in sparse-data situations. If this seems to be a
  problem, then better results may be obtained by imposing restrictions
  on the parameters; see \code{\link{ecm.mix}} and \code{\link{dabipf.mix}}.
}
\note{
  The random number generator seed must be set at least once by the
  function \code{rngseed} before this function can be used.
}
\references{
  Schafer, J. L. (1996) \emph{Analysis of Incomplete Multivariate Data.}
  Chapman & Hall, Chapter 9.
}
\seealso{
  \code{\link{prelim.mix}}, \code{\link{getparam.mix}},
  \code{\link{em.mix}}, and \code{\link{rngseed}}.
}
\examples{
data(stlouis)
s <- prelim.mix(stlouis,3)  # preliminary manipulations
thetahat <- em.mix(s) # find ML estimate
rngseed(1234567)   # set random number generator seed
newtheta <- da.mix(s, thetahat, steps=100, showits=TRUE)  # take 100 steps
ximp1 <- imp.mix(s, newtheta) # impute under newtheta
}
\keyword{models}
% Converted by Sd2Rd version 1.21.
