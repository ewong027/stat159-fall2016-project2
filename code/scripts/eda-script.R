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

# Making Qualitative Variable Information Tables
# Gender
gender_freq <- table(credit$Gender)
gender_rel_freq <- gender_freq/nrow(credit)
gender_df <- data.frame(gender_freq, gender_rel_freq)
gender_df$Var1.1 <- NULL
colnames(gender_df) <- c('Gender', 'Frequency', 'Relative Frequency')

# Student
student_freq <- table(credit$Student)
student_rel_freq <- student_freq/nrow(credit)
student_df <- data.frame(student_freq, student_rel_freq)
student_df$Var1.1 <- NULL
colnames(student_df) <- c('Student?', 'Frequency', 'Relative Frequency')

# Married
married_freq <- table(credit$Married)
married_rel_freq <- married_freq/nrow(credit)
married_df <- data.frame(married_freq, married_rel_freq)
married_df$Var1.1 <- NULL
colnames(married_df) <- c('Married?', 'Frequency', 'Relative Frequency')

# Ethnicity
ethnicity_freq <- table(credit$Ethnicity)
ethnicity_rel_freq <- ethnicity_freq/nrow(credit)
ethnicity_df <- data.frame(ethnicity_freq, ethnicity_rel_freq)
ethnicity_df$Var1.1 <- NULL
colnames(ethnicity_df) <- c('Ethnicity', 'Frequency', 'Relative Frequency')

#Producing Eda Output File
sink('data/eda-output.txt')
cat('Quantitative Variable Information\n')
cat('\nSummary of Income\n')
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
cat('\n\nQualitative Variable Tables\n')
cat('\nGender Table\n')
print(gender_df)
cat('\nStudent Table\n')
print(student_df)
cat('\nMarried Table\n')
print(married_df)
cat('\nEthnicity Table\n')
print(ethnicity_df)
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

# Barcharts for Qualitative Variables
png('images/barchart-gender.png')
barplot(table(credit$Gender), ylab = 'Count', xlab = 'Gender',
        col = '#f6ef40')
dev.off()

png('images/barchart-student.png')
barplot(table(credit$Student), ylab = 'Count', xlab = 'Student?',
        col = '#6521d0')
dev.off()

png('images/barchart-married.png')
barplot(table(credit$Married), ylab = 'Count', xlab = 'Married?',
        col = '#f40e82')
dev.off()

png('images/barchart-ethnicity.png')
barplot(table(credit$Ethnicity), ylab = 'Count', xlab = 'Ethnicity',
        col = '#49f277', ylim = c(0, 250))
dev.off()




