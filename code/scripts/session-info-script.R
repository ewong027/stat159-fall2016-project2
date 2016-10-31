# Loading Packages that are Used 
library(ggplot2)
library(xtable)
library(glmnet)
library(pls)
library(testthat)
library(PNG)
library(grid)

# Generating Session-Info.txt
sink('session-info.txt')
cat('General Information about R\n\n')
sessionInfo()
cat('\nVerison Nickname\n')
version$nickname
cat('\nLicense Relating to R\n')
license()
cat('Packages that are used\n')
cat('ggplot2, xtable, glmnet, pls, testthat, PNG, and grid')
sink()
