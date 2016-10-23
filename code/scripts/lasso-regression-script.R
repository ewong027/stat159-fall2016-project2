#loading in required packages and data.
library(glmnet)
load("data/train-test-sets.RData")

#setting a random seed to run the ten-cross validation 
set.seed(31415)

