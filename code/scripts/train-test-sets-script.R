#This code will parse out what data is used for the train or tests sets. 
#The train set will be used to build the model, and the test will be used to test the model. 

#Loading in the data to be parsed. 
scaled_credit <- read.csv('data/scaled-credit.csv', header = TRUE)
scaled_credit$X <- NULL

#creating a sample of indices 
set.seed(12345)
indx <- sample(1:400, 300)

#creating a train set using the indices chosen from the sample above. 
train_set <- scaled_credit[ indx, ]

#creating a test set from the indices not chosen from the sample above. 
test_set <- scaled_credit[!(1:400 %in% indx), ]

#Saving the data sets.
save(train_set, test_set, file = "data/train-test-sets.RData")
