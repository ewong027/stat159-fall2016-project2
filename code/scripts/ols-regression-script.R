#Loading in the data. 
scaled_credit <- read.csv("data/datasets/scaled-credit.csv", header = TRUE)
scaled_credit$X <- NULL

#Creating the OLS regression model. 
ols_reg <- lm(Balance ~ ., data = train_set)

#Calculating MSE 
ols_mse <- mean(ols_reg$residuals^2)

ols_matrix_new <- test_set[ ,-12]
ols_preditctions <- predict(ols_reg, ols_matrix_new)
ols_MSE <- mean((ols_preditctions-test_set$Balance)^2)

#Generating Coefficents
ols_summary <- summary(lm(Balance ~ ., data = scaled_credit))

#Generating OLS Output
sink('data/outputs/ols-regression-output.txt')
cat('MSE of OLS Regression\n')
print(ols_mse)
cat('\nCoefficients of Full Model using OLS Regression\n')
print(ols_summary$coefficients[ ,1])
sink()


#Saving Data
save(ols_reg, ols_summary, ols_mse, file = 'data/RData-files/ols-regression.RData')
