
<!-- README.md is generated from README.Rmd. Please edit that file -->

# clusterpin

<!-- badges: start -->
<!-- badges: end -->

The goal of clusterpin is to speed up the process of producing PiNs
calculations for clusters.

## Installation

You can install the released version of clusterpin from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("clusterpin")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("lilos404/clusterpin")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(clusterpin)
cluster_questions_df <- rio::import("/Users/mac/Downloads/PIN_HNO_Indicators_Testing.xlsx",sheet="Wash Thresholds")


pin_code_generator(cluster_questions_df = cluster_questions_df,
                   cluster_name= "wash",
                   col_name_indicator = "Indicator 2021",
                   col_name_severity_1 = "SEVERITY 1" ,
                   col_name_severity_2 = "SEVERITY 2" ,
                   col_name_severity_3 = "SEVERITY 3" ,
                   col_name_severity_4 = "SEVERITY 4" ,
                   col_name_severity_5 = "SEVERITY 5" 
                   )
```
