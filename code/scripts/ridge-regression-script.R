# Inital Set-Up for Code
library(glmnet)
load('data/train-test-sets.RData')
set.seed(98765)
scaled_credit <- read.csv('data/scaled-credit.csv')
scaled_credit <- 

# Running cv.glmnet()
grid <- 10^seq(10, -2, length = 100) 
ridge_matrix <- as.matrix(train_set[ ,-12])
cv_ridge <- cv.glmnet(x = ridge_matrix, y = train_set$Balance, lambda = grid,
          intercept = FALSE, standardize = FALSE, alpha = 0)
# We set alpha = 0 because in ridge regression, elasticity for ridge regression is 0.

# Saving the Output
lambda_min_ridge <- cv_ridge$lambda.min
cv_ridge_coef <- coef(cv_ridge, s = cv_ridge$lambda.min)

# Plotting Ridge Regression
png('images/cv-ridge-mse-plot.png')
plot(cv_ridge)
dev.off()

# Calculating the MSE
ridge_matrix_new <- as.matrix(test_set[ ,-12])
ridge_preditctions <- predict(cv_ridge,ridge_matrix_new, s = lambda_min_ridge)
ridge_MSE <- mean((ridge_preditctions-test_set$Balance)^2)


# Saving Data and Generating an Output
save(lambda_min_ridge, cv_ridge, ridge_MSE, file = 'data/ridge-regression.RData')



