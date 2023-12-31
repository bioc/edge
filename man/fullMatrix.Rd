% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllGenerics.R, R/getMethods.R, R/setMethods.R
\docType{methods}
\name{fullMatrix}
\alias{fullMatrix}
\alias{fullMatrix,deSet-method}
\alias{fullMatrix<-}
\alias{fullMatrix<-,deSet-method}
\title{Matrix representation of full model}
\usage{
fullMatrix(object)

fullMatrix(object) <- value

\S4method{fullMatrix}{deSet}(object)

\S4method{fullMatrix}{deSet}(object) <- value
}
\arguments{
\item{object}{\code{S4 object}: \code{\linkS4class{deSet}}}

\item{value}{\code{matrix}: full model matrix where the columns are the
covariates and rows are observations}
}
\value{
\code{fullMatrix} returns the value of the full model matrix.
}
\description{
These generic functions access and set the full matrix for
\code{\linkS4class{deSet}} object.
}
\examples{
# import data
library(splines)
data(kidney)
age <- kidney$age
sex <- kidney$sex
kidexpr <- kidney$kidexpr
cov <- data.frame(sex = sex, age = age)

# create models
null_model <- ~sex
full_model <- ~sex + ns(age, df = 4)

# create deSet object from data
de_obj <- build_models(data = kidexpr, cov = cov, null.model = null_model,
full.model = full_model)

# extract the full model equation as a matrix
mat_full <- fullMatrix(de_obj)
}
\author{
Andrew Bass, John Storey
}
\seealso{
\code{\linkS4class{deSet}}, \code{\link{fullModel}}
}

