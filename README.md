
<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Build Status](https://travis-ci.org/vincenzocoia/powers.svg?branch=master)](https://travis-ci.org/vincenzocoia/powers)

**Note**: This R package is not mean to be "serious". It's just for teaching purposes.

powers, Box-Cox transform
=========================

This is an R package that allows you to compute power functions. You can also compute a Box-Cox transform

Installation
------------

You can install powers from github with:

``` r
# install.packages("devtools")
devtools::install_github("MalcolmNSB/powers")
```

Example
-------

See the vignette for more extensive use, but here's an example:

``` r
powers::reciprocal(2)
#> [1] 0.5
powers::square(2)
#> [1] 4
powers::cube(2)
#> [1] 8
powers::Box_Cox_transform(c(1,2), c(3,4))
#> [1] 41.33333 71.66667
powers::Box_Cox_transform(1,2)
#> [1] 0
```

For Developers
--------------

(Again, I don't actually intend for anyone to develop this silly package, but if I did, here's what I'd write.)

Use the internal `pow` function as the machinery for the front-end functions such as `square`, `cube`, `reciprocal`, and `Box_Cox_transform`.
