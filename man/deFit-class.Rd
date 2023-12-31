% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllClasses.R
\docType{class}
\name{deFit-class}
\alias{deFit-class}
\title{The differential expression class for the model fits}
\description{
Object returned from \code{\link{fit_models}} containing information
regarding the model fits for the experiment.
}
\section{Slots}{

\describe{
\item{\code{fit.full}}{\code{matrix}: containing fitted values for the full model.}

\item{\code{fit.null}}{\code{matrix}: containing fitted values for the null model.}

\item{\code{res.full}}{\code{matrix}: the residuals of the full model.}

\item{\code{res.null}}{\code{matrix}: the residuals of the null model.}

\item{\code{dH.full}}{\code{vector}: contains diagonal elements in the projection
matrix for the full model.}

\item{\code{beta.coef}}{\code{matrix}: fitted coefficients for the full model.}

\item{\code{stat.type}}{\code{string}: information on the statistic of interest.
Currently, the only options are ``lrt'' and ``odp''.}
}}
\section{Methods}{

 \describe{
 \item{\code{fitNull(deFit)}}{Access fitted data from null model.}
 \item{\code{fitFull(deFit)}}{Access fitted data from full model.}
 \item{\code{resNull(deFit)}}{Access residuals from null model fit.}
 \item{\code{resFull(deFit)}}{Access residuals from full model fit.}
 \item{\code{betaCoef(deFit)}}{Access beta coefficients in linear model.}
 \item{\code{sType(deFit)}}{Access statistic type of model fitting utilized
 in function.}
 }
}
\author{
John Storey, Jeffrey Leek, Andrew Bass
}

