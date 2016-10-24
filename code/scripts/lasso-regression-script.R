#loading in required packages and data.
library(glmnet)
load('data/train-test-sets.RData')
scaled_credit <- read.csv('data/scaled-credit.csv')
scaled_credit$X <- NULL

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

#Now we find the official coefficents by using the model calculated above on the full 
#data set

#initializing inputs: 
X_full <- as.matrix(scaled_credit[ , -12])

#finding the full model:
lasso_fit <- glmnet(X_full, scaled_credit$Balance, lambda = lambda_min_lasso, 
                    intercept = FALSE, standardize = FALSE, alpha = 1)

#finding the official coefficients: 
lasso_coef_full <- coef(lasso_fit)

#saving these coefficients into an RData file
save(cv_lasso, lambda_min_lasso, lasso_mse, lasso_coef_full, file = 'data/lasso-regression.RData')

#Now we want to make a text file of the intermediary step of this regression analysis: 
sink(file = 'data/lasso-regression-output.txt')
cat('This is the output of the ten-fold cross validation using Lasso regression\n on the training data set\n')
print(cv_lasso)
cat('\nThis is the minimum lambda that represents the "best" model\n')
print(lambda_min_lasso)
cat('\nThis is the MSE of the testing data set when the training model is implemented\n')
print(lasso_mse)
cat('\nThese are the official coefficients calcualted using the "best" model lambda and the full datset')
sink()