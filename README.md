
# glitrpatch

<!-- badges: start -->
<!-- badges: end -->

The goal of glitrpatch is to ...

## Installation

You can install the development version of glitrpatch from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("USAID-OHA-SI/glitrpatch")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(glitrpatch)
library(glitr)
library(glamr)
library(gophr)
## basic example code

# Set up
genie_path <- file.path(si_path(), "Genie/Genie-PSNUByIMs-Zambia-Daily-2022-05-16.zip")

msd_source <- source_info(genie_path)
curr_pd <- source_info(genie_path, return = "period")
curr_fy <- source_info(genie_path, return = "fiscal_year")
curr_qtr <- source_info(genie_path, return = "quarter")
plot_name <- glue::glue("{msd_source}\n Created by: USAID OHA SI Team")

df <- read_msd(genie_path)

# Plot
create_cascade(df)
# You will then be prompted for which cascade to be returned.
```

