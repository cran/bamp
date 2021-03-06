% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/predict_apc.R
\name{predict_apc}
\alias{predict_apc}
\title{Prediction for age-period-cohort models}
\usage{
predict_apc(
  object,
  periods = 0,
  population = NULL,
  quantiles = c(0.05, 0.5, 0.95),
  update = FALSE
)
}
\arguments{
\item{object}{apc object}

\item{periods}{number of periods to predict}

\item{population}{matrix of (predicted) population, if NULL, population data from original bamp call will be used}

\item{quantiles}{vector of quantiles to compute}

\item{update}{boolean. If TRUE, object will be returned with results added to the object}
}
\value{
list with quantiles of predicted probabilities (\code{pr}), predicted cases (\code{cases}) and predicted cases per period (\code{cases_period})
and a list samples with MCMC samples of pr, cases and cases_period. 
If \code{update=TRUE}, the apc object will be returned with this list (predicted) added.
}
\description{
Prediction of rates and, if possible, cases from the Bayesian age-period-cohort model 
using the prior assumptions (random walks) of the model and the estimated variance of the random walk.
For example, random walk of first order (rw1) for period effect predicts constant effects for future periods plus noise.
}
\details{
This function will return predicted rates for future periods. For this, future period and cohort effects will be predicted.
Further age group effects will not be predicted. The rates are random samples from the predictive distribution; number of samples is equal
to number of MCMC iterations. Quantiles will be provided for convenience, but all samples are available.
If population numbers are given, number of cases will also be predicted. Number of cases 
will not only be predicted for future periods,
but also for the time periods where data are available; this can be used for model assessment.
}
\examples{
\dontrun{
data(apc)
model <- bamp(cases, population, age="rw1", period="rw1", cohort="rw1", periods_per_agegroup = 5)
pred <- predict_apc(model, periods=1)
plot(pred$pr[2,11,], main="Predicted rate per agegroup", ylab="p")
}
}
\seealso{
\code{vignette("prediction", package = "bamp")}
}
