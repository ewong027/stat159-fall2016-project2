# Loading Data and Necessary Packages
credit <- read.csv('data/Credit.csv', header = TRUE)
credit$X <- NULL
library(ggplot2)


#Making Data Frames for Quantitative Variables Not Included in Summary()
categories <- c('Income', 'Limit', 'Rating', 'Cards', 
                'Age', 'Education', 'Balance')
sd <- c(sd(credit$Income), sd(credit$Limit), sd(credit$Rating),
        sd(credit$Cards), sd(credit$Age), sd(credit$Education),
        sd(credit$Balance))
iqr <- c(IQR(credit$Income), IQR(credit$Limit), IQR(credit$Rating),
         IQR(credit$Cards), IQR(credit$Age), IQR(credit$Education),
         IQR(credit$Balance))
range <- c(max(credit$Income)-min(credit$Income), 
           max(credit$Limit)-min(credit$Limit),
           max(credit$Rating)-min(credit$Rating),
           max(credit$Cards)-min(credit$Cards),
           max(credit$Age)-min(credit$Age),
           max(credit$Eduation)-min(credit$Eduation),
           max(credit$Balance)-min(credit$Balance))
data_frame <- data.frame (categories, sd, iqr, range)

#Producing Quantitative Variable Comparison Output
sink('data/eda-output.txt')
cat('Summary of Income\n')
summary(credit$Income)
cat('\nSummary of Limit\n')
summary(credit$Limit)
cat('\nSummary of Rating\n')
summary(credit$Rating)
cat('\nSummary of Cards\n')
summary(credit$Cards)
cat('\nSummary of Age\n')
summary(credit$Age)
cat('\nSummary of Education\n')
summary(credit$Education)
cat('\nSummary of Balance\n')
summary(credit$Balance)
cat('\nSummary of Other Descriptive Statistics\n')
print(data_frame)
sink()

# Histograms for Quantitative Variables
png('images/histogram-income.png')
ggplot(data = credit) +
  geom_histogram(aes(Income), binwidth = 30,
                 col = '#000000',fill = '#f55449') +
  xlab('Income') +
  ylab('Count') +
  ggtitle('Histogram of Income')
dev.off()

png('images/histogram-limit.png')
ggplot(data = credit) +
  geom_histogram(aes(Limit), binwidth = 2000,
                 col = '#000000',fill = '#f69c12') +
  xlab('Limit') +
  ylab('Count') +
  ggtitle('Histogram of Limit')
dev.off()

png('images/histogram-rating.png')
ggplot(data = credit) +
  geom_histogram(aes(Rating), binwidth = 100,
                 col = '#000000',fill = '#f9ee02') +
  xlab('Rating') +
  ylab('Count') +
  ggtitle('Histogram of Rating')
dev.off()

png('images/histogram-cards.png')
ggplot(data = credit) +
  geom_histogram(aes(Cards), binwidth = 2,
                 col = '#000000',fill = '#ae49f5') +
  xlab('Cards') +
  ylab('Count') +
  ggtitle('Histogram of Cards')
dev.off()

png('images/histogram-age.png')
ggplot(data = credit) +
  geom_histogram(aes(Age), binwidth = 10,
                 col = '#000000',fill = '#37e70f') +
  xlab('Age') +
  ylab('Count') +
  ggtitle('Histogram of Age')
dev.off()

png('images/histogram-education.png')
ggplot(data = credit) +
  geom_histogram(aes(Education), binwidth = 3,
                 col = '#000000',fill = '#49f5b4') +
  xlab('Education') +
  ylab('Count') +
  ggtitle('Histogram of Education')
dev.off()

png('images/histogram-balance.png')
ggplot(data = credit) +
  geom_histogram(aes(Balance), binwidth = 250,
                 col = '#000000',fill = '#49cef5') +
  xlab('Balance') +
  ylab('Count') +
  ggtitle('Histogram of Balance')
dev.off()

# Boxplots for Quantitative Variables
png('images/boxplot-income.png')
boxplot(credit$Income, ylab = 'Frequency', main = 'Boxplot of Income')
dev.off()

png('images/boxplot-limit.png')
boxplot(credit$Limit, ylab = 'Frequency', main = 'Boxplot of Limit')
dev.off()

png('images/boxplot-rating.png')
boxplot(credit$Rating, ylab = 'Frequency', main = 'Boxplot of Rating')
dev.off()

png('images/boxplot-cards.png')
boxplot(credit$Cards, ylab = 'Frequency', main = 'Boxplot of Cards')
dev.off()

png('images/boxplot-age.png')
boxplot(credit$Age, ylab = 'Frequency', main = 'Boxplot of Age')
dev.off()

png('images/boxplot-education.png')
boxplot(credit$Education, ylab = 'Frequency', main = 'Boxplot of Education')
dev.off()

png('images/boxplot-balance.png')
boxplot(credit$Balance, ylab = 'Frequency', main = 'Boxplot of Balance')
dev.off()


