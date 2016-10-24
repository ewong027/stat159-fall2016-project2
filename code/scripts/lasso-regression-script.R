#loading in required packages and data.
library(glmnet)
load('data/train-test-sets.RData')
scaled_credit <- read.csv('data/scaled-credit.csv')

#setting a random seed to run the ten-cross validation 
set.seed(31415)

#initializing arguments 
grid <- 10^seq(10, -2, length = 100) #lambda
X <- as.matrix(train_set[ ,-12])

#calculating the cross validation.
cv_lasso <- cv.glmnet(X, train_set$Balance, lambda = grid, 
                      intercept = FALSE, standardize = FALSE, 
                      alpha = 1) #alpha of one is for lasso regression.

#finding the "best" model using the lambda.min arument
lambda_min_lasso <- cv_lasso$lambda.min
cv_lasso_coef <- coef(cv_lasso, s = lambda_min_lasso)

#Plotting the output of cv.glmnet
png(filename = "images/cv-lasso-mse-plot.png")
plot(cv_lasso)
dev.off()

#Using the model above to test using the test data set. 
#initializing the inputs: 
X_new <- as.matrix(test_set[ ,-12])
lasso_predictions <- predict(cv_lasso, X_new, s = lambda_min_lasso)

#Finding the MSE of the test data model fit. 
lasso_mse <- mean((lasso_predictions-test_set$Balance)^2)

#Now we find the official coefficents by 

#saving these coefficients into an RData file
save(cv_lasso, lambda_min_lasso, lasso_mse, file = "data/lasso-regression.RData")

