#Loading in the data. 

scaled_credit <- read.csv("data/datasets/scaled-credit.csv", header = TRUE)

#Creating the OLS regression model. 
ols_reg <- lm(Balance ~ ., data = scaled_credit)
