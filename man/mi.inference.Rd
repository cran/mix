\name{mi.inference}
\alias{mi.inference}
\title{
  Multiple Imputation Inference
}
\description{
  Combines estimates and standard errors from m complete-data analyses
  performed on m imputed datasets to produce a single inference.  Uses
  the technique described by Rubin (1987) for multiple
  imputation inference for a scalar estimand.
}
\usage{
mi.inference(est, std.err, confidence=0.95)
}
\arguments{
\item{est}{
  a list of \eqn{m} (at least 2) vectors representing estimates (e.g.,
  vectors of estimated regression coefficients) from complete-data
  analyses performed on \eqn{m} imputed datasets.
}
\item{std.err}{
  a list of \eqn{m} vectors containing standard errors from the
  complete-data analyses corresponding to the estimates in \code{est}.
}
\item{confidence}{
  desired coverage of interval estimates.
}}
\value{
  a list with the following components, each of which is a vector of the
  same length as the components of \code{est} and \code{std.err}:

  \item{est}{
    the average of the complete-data estimates.
  }
  \item{std.err}{
    standard errors incorporating both the between and the
    within-imputation uncertainty (the square root of the "total
    variance").
    }
    \item{df}{
      degrees of freedom associated with the \eqn{t} reference
      distribution used for interval estimates.
    }
    \item{signif}{
      P-values for the two-tailed hypothesis tests that the estimated
      quantities are equal to zero.
    }
    \item{lower}{
      lower limits of the (100*confidence)\% interval estimates.
    }
    \item{upper}{
      upper limits of the (100*confidence)\% interval estimates.
    }
    \item{r}{
      estimated relative increases in variance due to nonresponse.
    }
    \item{fminf}{
      estimated fractions of missing information.
  }}
\section{Method}{
  Uses the method described on pp. 76-77 of Rubin (1987) for combining
  the complete-data estimates from $m$ imputed datasets
  for a scalar estimand. Significance levels and interval estimates are
  approximately valid for each one-dimensional estimand, not for all of
  them jointly.
}
\references{
  Rubin, D. B. (1987) \emph{Multiple Imputation for Nonresponse in
    Surveys.} Wiley.

  Schafer, J. L. (1996) \emph{Analysis of Incomplete Multivariate Data.}
  Chapman \& Hall.
}
\keyword{models}
% Converted by Sd2Rd version 1.21.
