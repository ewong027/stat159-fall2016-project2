# Inital Set-Up for Code
library(glmnet)
load('data/train-test-sets.RData')
set.seed(14153)

matrix <- 
cv.glmnet(x = train_set, y = balance, intercept = FALSE, standardize = FALSE)
