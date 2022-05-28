
<!-- README.md is generated from README.Rmd. Please edit that file -->

# glitrpatch

<!-- badges: start -->
<!-- badges: end -->

The goal of glitrpatch is to generate standard cascade plots of
different types.

## Installation

You can install the development version of glitrpatch like so:

``` r
## SETUP

  #install package with vignettes
    install.packages("remotes")
    remotes::install_github("USAID-OHA-SI/glitrpatch", build_vignettes = TRUE)
    
  #load the package
    library(glitrpatch)

## LIST TYPES OF STYLES INCLUDED WITH PACKAGE
  ls(package:glitrpatch)
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(glitrpatch)
## basic example code
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this. You could also
use GitHub Actions to re-render `README.Rmd` every time you push. An
example workflow can be found here:
<https://github.com/r-lib/actions/tree/v1/examples>.

*Disclaimer: The findings, interpretation, and conclusions expressed
herein are those of the authors and do not necessarily reflect the views
of United States Agency for International Development. All errors remain
our own.*
