#Loading in the data. 
scaled_credit <- read.csv("data/datasets/scaled-credit.csv", header = TRUE)

#Creating the OLS regression model. 
ols_reg <- lm(Balance ~ ., data = scaled_credit)

#Calculating MSE 
ols_mse <- mean(ols_reg$residuals^2)

#Saving Data
save(ols_reg, ols_mse, file = 'data/RData-files/ols-regression.RData')
