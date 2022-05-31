\name{prelim.mix}
\alias{prelim.mix}
\title{
  Preliminary Manipulations on Matrix of Incomplete Mixed Data
}
\description{
  This function performs grouping and sorting operations on a mixed
  dataset with missing values. It creates a list that is
  needed for input to \code{\link{em.mix}}, \code{\link{da.mix}},
  \code{\link{imp.mix}}, etc.
}
\usage{
prelim.mix(x, p)
}
\arguments{
  \item{x}{
    data matrix containing missing values. The rows of x correspond to
    observational units, and the columns to variables. Missing values are
    denoted by \code{NA}. The categorical variables must be in
    the first \code{p} columns
    of \code{x}, and they must be coded with consecutive positive integers
    starting with 1. For example, a binary variable must be coded as 1,2
    rather than 0,1.
  }
  \item{p}{
    number of categorical variables in x
}}
\value{
  a list of twenty-nine (!) components that summarize various features
  of x after the data have been collapsed, centered, scaled, and sorted
  by missingness patterns. Components that might be of interest to the
  user include:

  \item{nmis}{
    a vector of length \code{ncol(x)} containing the number of
    missing values for each variable in \code{x}. 
  }
  \item{r}{
    matrix of response indicators showing the missing data patterns in
    \code{x}.
    Observed values are indicated by 1 and missing values by 0. The row
    names give the number of observations in each pattern, and the columns
    correspond to the columns of \code{x}.
}}
\references{
  Schafer, J. L. (1996) \emph{Analysis of Incomplete Multivariate Data.}
  Chapman & Hall, Chapter 9.
}
\seealso{
  \code{\link{em.mix}}, \code{\link{ecm.mix}},
  \code{\link{da.mix}}, \code{\link{dabipf.mix}}, \code{\link{imp.mix}},
  \code{\link{getparam.mix}}
}
\examples{
data(stlouis)
s <- prelim.mix(stlouis, 3)  # do preliminary manipulations 
s$nmis              # look at nmis
s$r                 # look at missing data patterns
}
\keyword{models}
% Converted by Sd2Rd version 1.21.
