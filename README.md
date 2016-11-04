## Comparing Different Regression Models 

Project Name: stat159-fall2016-project2

Authors: Erica Wong and Bryana Gutierrez

Description: This project was created for the purpose of comparing different regression models. In this report we attempt to describe the differences between ridge, lasso, principal components, partial least squares, and ordinary least squares regressions. We base our analysis on Chapter 6 *Linear Model Selection and Regularization* of the book **An Introduction to Statistical Learning** by Gareth James, Daniela Witten, Trevor Hastie and Robert Tibshirani. [You can find a link to their book and data set by clicking on this sentence.](http://www-bcf.usc.edu/~gareth/ISL/) This analysis looks and financial and demographic information to fit a model for credit balance. 

Organization:
* Code: This folder contains all of our R Scripts. Within the code folder, the scripts are further divided into functions, scripts, and tests.
* Data: This folder contains all of the different data files were produced in this project. Within the data folder, the outputs are further seperated into datasets, outputs, and RData-files.
* .gitignore: In the .gitignore file, we would put files and directories that we want to ignore in Git. In this project, we want to ignore files such as .Rhistory and .DS_Store, so that will be in our .gitignore file.
* Images: This folder contains all of my plots and charts that were made throughout the project in PNG form.
* Makefile: This files contains the commands that will run our R scripts and allow for reproducibility. Additonally, through Makefile, we are going to produce everything that exists in the data folder and the report.
* LICENSE: This document contains the full BSD-2-Clause for our project.  
* Report: This file contains my Report for this homework assignment in both .Rmd and .pdf form. Additonally, because we wrote the Report.Rmd in different sections, there is a sections folder that contains all of the different parts of our report. Finally, there is a folder called slides. Within slides you will find the presentation for this project in Rmd and HTML format via ioslides. 
* session-info.txt: This document contains information about all of the softwares that we used in this project.

Instructions on How to Reproduce (Assuming you have already have all the scripts made and ready to use):

1. First start off by cloning our project. To do this you will type ` git clone https://github.com/ewong027/stat159-fall2016-project2.git` into your terminal.
2. Next, to reproduce our report, you will first have to start by deleting the report that we already have in our project. To do this, run the command `make clean`.
3. Then, you will run through all of the different scripts just to make sure that everything is up to date and that you have a version of each of the output files you will do this by `make data eda session processing traintest regressions`
4. In this project, we also had to create tests to be tested under testthat functions. To run the test-that tests, run the command `make tests`.
5. Now you are ready to generate the report. To make the report, run the command `make report`, this will run the report.Rmd and generate the report.pdf.
6. Finally, you can run `make slides` to generate the HTML presentation slides.

List of Make Commands for Phony Targets:
If you type `make` followed by a phony target you will get the following results.

* `make all`: This will tell make which are the main targets to run.
* `make data`: This target downloads the credit data. 
* `make processing`: This target takes in the credit data set loaded in the data target and standardizes it.
* `make traintest`: This target assigns the file outout for the output of the data processing script.
* `make tests`: This target will run the script file that has command to run the tests of the regression functions.
* `make eda`: This target will run the script eda-script.R. This will output eda-out.txt which contains exploratory information and eda-correlation-matrix.txt.
* `make ols`: This target will run the script ols-regression-script.R which will run the OLS regression analysis. here are two data outputs for this analysis, ols-regression-output.txt and  ols-regression.RData which contain information about the regression analysis. 
* `make ridge`: This target will run the script ridge-regression-script.R which will run the ridge regression analysis. There are two data outputs for this analysis, ridge-regression-output.txt and ridge-regression.RData which contain information about the regresison analysis.
* `make lasso`: This target will run the script lasso-regression-script.R which will run the lasso regression analysis. There are two data outputs for this analysis, lasso-regression-output.txt and lasso-regression.RData which contain information about the regression analysis.
* `make pcr`: This target will run the script pc-regression-script.R which will run the principal components regression analysis. There are two data outputs for this analysis, pc-regression-output.txt and pc-regression.RData which contain information about the regression analysis.
* `make plsr`: This target will run the script pls-regression-script.R which will run the partial least squares regression analysis. There are two data outputs for this analysis, pls-regression-output.txt and pls-regression.RData which contain information about the regression analysis.
* `make regressions`: This target will run the targets ols, ridge, lasso, pcr, and plsr. It will run all the regression scripts and generate their data outputs.
* `make report`: This target will generate the final reports report.pdf and report.html from report.Rmd which will be creates from the section files pasted together.
* `make slides`: This target will generate the html version of the report slides.
* `make session`: This target will output session-info.txt. 
* `make clean`: This target will delete the generated reports, report.pdf and report.html.

Licenses: All media in this work is licensed under a [Creative Commons Attribution-NonCommercial 4.0 International](https://creativecommons.org/licenses/by-nc/4.0/legalcode). All code is licensed under BSD-2-Clause, more information about this license can be found in the License file.

