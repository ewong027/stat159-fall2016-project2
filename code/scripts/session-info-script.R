# Loading Packages that are Used 
library(ggplot2)
library(xtable)
library(glmnet)
library(pls)
library(testthat)
library(PNG)
library(grid)
library(knitr)
library(rmarkdown)
library(reshape)

# Generating Session-Info.txt
sink('session-info.txt', append = TRUE)
cat('General Information about R\n\n')
print(sessionInfo())
devtools::session_info()
sink()
