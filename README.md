<a href="http://www.bioconductor.org/packages/release/bioc/html/edge.html#since"><img border="0" src="http://www.bioconductor.org/shields/years-in-bioc/edge.svg" title="How long since the package was first in a released Bioconductor version (or is it in devel only)."></a> <a href="http://bioconductor.org/packages/stats/bioc/edge.html"><img border="0" src="http://www.bioconductor.org/shields/downloads/edge.svg" title="Percentile (top 5/20/50% or 'available') of downloads over last 6 full months. Comparison is done across all package categories (software, annotation, experiment)."></a> <a href="https://support.bioconductor.org/t/edge/"><img border="0" src="http://www.bioconductor.org/shields/posts/edge.svg" title="Support site activity, last 6 months: tagged questions/avg. answers per question/avg. comments per question/accepted answers, or 0 if no tagged posts."></a> <a href="http://www.bioconductor.org/packages/release/bioc/html/edge.html#svn_source"><img border="0" src="http://www.bioconductor.org/shields/commits/bioc/edge.svg" title="average Subversion commits (to the devel branch) per month for the last 6 months"></a>
edge: Extraction of Differential Gene Expression
====

Introduction
------
The edge package implements methods for carrying out differential
expression analyses of genome-wide gene expression studies. Significance
testing using the optimal discovery procedure and generalized likelihood
ratio tests (equivalent to F-tests and t-tests) are implemented for general study
designs. Special functions are available to facilitate the analysis of
common study designs, including time course experiments. Other packages
such as  [sva](http://www.bioconductor.org/packages/release/bioc/html/sva.html) and [qvalue](https://github.com/jdstorey/qvalue) are integrated in edge to provide a wide range
of tools for gene expression analysis.


### Installation and Documentation

To install the Bioconductor release version, open R and type:
```R
if (!requireNamespace("BiocManager", quietly=TRUE))
    install.packages("BiocManager")
BiocManager::install("edge")
```

To install the development version, open R and type:
```R
install.packages("devtools")
library("devtools")
install_github(c("jdstorey/qvalue","jdstorey/edge"), build_vignettes = TRUE)
```

Instructions on using edge can be viewed by typing:
```R
library("edge")
browseVignettes("edge")
```

### Main functions
* `build_models`
* `build_study`
* `odp`
* `lrt`
* `fit_models`
* `kl_clust`
* `apply_sva`
* `apply_qvalue`

### Quick start guide

To get started, first load the kidney dataset included in the package:
```R
library(edge)
data(kidney)
names(kidney)
```
The kidney study is interested in determining differentially expressed genes with respect to age in kidney tissue. The `age` variable is the age of the subjects and the `sex` variable is whether the subjects were male or female. The expression values for the genes are contained in the `kidexpr` variable.
```R
kidexpr <- kidney$kidexpr
age <- kidney$age
sex <- kidney$sex
```

Once the data has been loaded, the user has two options to create the experimental models: `build_models` or `build_study`. If the experiment models are unknown to the user, `build_study` can be used to create the models:
```R
edge_obj <- build_study(data = kidexpr, adj.var = sex, tme = age, sampling = "timecourse")
full_model <- fullModel(edge_obj)
null_model <- nullModel(edge_obj)
```

The variable `sampling` describes the type of experiment performed, `adj.var` is the adjustment variable and `tme` is the time variable in the study. If the experiment is more complex then type `?build_study` for additional arguments.

If the alternative and null models are known to the user then `build_models` can be used to make a deSet object:
```R
library(splines)
cov <- data.frame(sex = sex, age = age)
null_model <- ~sex
full_model <- ~sex + ns(age, df=4)
edge_obj <- build_models(data = kidexpr, cov = cov, null.model = null_model, full.model = full_model)
```

The `cov` is a data frame of covariates, the `null.model` is the null model and the `full.model` is the alternative model. The input `cov` is a data frame with the column names the same as the variables in the alternative and null models. Once the models have been generated, it is often useful to adjust for unmodelled variables using `apply_sva`.
```R
edge_sva <- apply_sva(edge_norm)

```

The `odp` or `lrt` function can be used on `edge_sva` to implement either the optimal discovery procedure or the likelihood ratio test, respectively:
```R
# optimal discovery procedure
edge_odp <- odp(edge_sva, bs.its = 30, verbose=FALSE)
# likelihood ratio test
edge_lrt <- lrt(edge_sva)
```

To access the proportional of null p-values estimate, p-values, q-values and local false discovery rates for each gene, use the function `qvalueObj`:
```R
qval_obj <- qvalueObj(edge_odp)
qvals <- qval_obj$qvalues
pvals <- qval_obj$pvalues
lfdr <- qval_obj$lfdr
pi0 <- qval_obj$pi0
```

See the vignette for more detailed explanations of the edge package.

