#downloading the data into the script as a data frame so that we may be able to manipulate it. 
credit <- read.csv("data/Credit.csv", header = TRUE)

#dummy out categorical variables
temp_credit <- model.matrix(Balance ~ ., data = credit)

#removing column of ones, and appending Balance
new_credit <- cbind(temp_credit[ ,-1], Balance = credit$Balance)

#scaling and centering
scaled_credit_pre <- scale(new_credit, center = TRUE, scale = TRUE)

#removing the first column which is just a scaled counter
scaled_credit <- scaled_credit_pre[ ,-1]

#export scaled data
write.csv(scaled_credit, file = "data/scaled-credit.csv")
