## Overview of Data Folder

In this folder, you will find all of the different data files that were used and produced in this project.

### Files in this Folder

This folder is further divided into 3 different folders.

* datasets: This folder contains the data that we are working with in Project 2.
    * Credit.csv: This is the original data set that we are using in Project 2. The research and file was done by Gareth James, Daniela Witten, Trevor Hastie and Robert Tibshirani. [Here is a link to the source of Credit.csv.](http://www-bcf.usc.edu/~gareth/ISL/Credit.csv). We use this dataset when doing eda-processing. This data set contains information from a sample of people about their balance (average credit card debt), age, number of credit cards, years of education, income, credit limit, credit rating, gender, student status, martial status, and ethnicity.
    * scaled-credit.csv: This is a cleaned, centered, and standarized version of Credit.csv. In this csv, we have converted factors into dummy variables, centered the mean, and standardized our data. When we are doing our analysis for our regression models, this is the dataset that we are using. 
* outputs: This folder contains all of the outputs that are generated from the different scripts we wrote for this project. This folder contains all four of the different regression outputs that were created when we did regression via ridge, lasso, principal components, and partial least squares regression. Additionally, it has the eda-output.txt generated from our eda-regression-script.R, which contains the summary of the quantitative varaibles, frequencies and relative frequencies of qualitative varaibles, and the relationship between balance the qualitative variables.
* RData-files: This folder contains all of the R binary format files of our regression objects that were created in our various regression scripts.
