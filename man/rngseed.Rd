\name{rngseed}
\alias{rngseed}
\title{
  Initialize Random Number Generator Seed
}
\description{
  Initialize random number generator seed for mix package.
}
\usage{
rngseed(seed)
}
\arguments{
\item{seed}{
  a positive number, preferably a large integer.
}}
\value{
\code{NULL}.
}
\note{
  The random number generator seed must be set at least once
  by this function before the simulation or imputation functions 
  in this package (\code{\link{da.mix}}, \code{\link{imp.mix}}, etc.)
  can be used.
}

\keyword{models}
