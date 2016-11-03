# initializing variables to be used in the makefile
dataout = data/outputs
codescr = code/scripts
dataR = data/RData-files
repmd = report/report.Rmd
reppdf = report/report.pdf
rephtml = report/report.html
sections = report/sections/*
slides = report/slides

# initializing the phony targets
.PHONY: all data tests eda ols ridge lasso pcr plsr regressions report slides session clean processing traintest 

# this will tell make which are the main targets to run
all: eda regressions report

# this target dowloads the credit data. 
data:
	curl 'http://www-bcf.usc.edu/~gareth/ISL/Credit.csv' > data/datasets/Credit.csv

# this target takes in the credit data set loaded in the data target and standardizes it.
processing: data/datasets/scaled_credit.csv

# this target assigns the file outout for the output of the data processing script.
data/datasets/scaled_credit.csv: $(codescr)/data-processing-script.R
	Rscript $(codescr)/data-processing-script.R

# this target takes the scaled data set and creates train and test sets. 
traintest: data/RData-files/train-test-sets.RData

data/RData-files/train-test-sets.RData: $(codescr)/train-test-sets-script.R
	Rscript $(codescr)/train-test-sets-script.R

# this target will run the script file that has command to run the tests of the regression funcitons.
tests: code/test-that/R
	Rscript code/test-that.R

# this target will run the script eda-script.R. This will output eda-out.txt which contains exploratory information and eda-correlation-matrix.txt. For this reason, we made two separate targets with the two output files.
eda: $(dataout)/eda-output.txt $(dataout)/eda-correlation-matrix.txt

# this target is for the output eda-output.txt.
$(dataout)/eda-output.txt: $(codescr)/eda-script.R
	Rscript $(codescr)/eda-script.R

# this target is for the eda-correlation-matrix.txt output. 
$(dataout)/eda-correlation-matrix.txt: $(codescr)/eda-script.R
	Rscript $(codescr)/eda-script.R 


# this target will run the script ols-regression-script.R which will run the OLS regression analysis. There are two data outputs for this analysis, ols-regression-output.txt and  ols-regression.RData which contain informationabout the regresison analysis. 
ols: $(dataout)/ols-regression-output.txt $(dataR)/ols-regression.RData

# this is the target that creates the output ols-regression-output.txt.
$(dataout)/ols-regression-output.txt: $(codescr)/ols-regression-script.R
	Rscript $(codescr)/ols-regression-script.R

# this is the target that creates the output ols-regression.RData. 
$(dataR)/ols-regression.RData: $(codescr)/ols-regression-script.R
	Rscript $(codescr)/ols-regression-script.R


# this target will run the script ridge-regression-script.R which will run the ridge regression analysis. There are two data outputs for this analysis, ridge-regression-output.txt and  ridge-regression.RData which contain information about the regresison analysis.
ridge: $(dataout)/ridge-regression-output.txt $(dataR)/ridge-regression.RData

# this is the target that creates the output ridge-regression-output.txt.
$(dataout)/ridge-regression-output.txt: $(codescr)/ridge-regression-script.R
	Rscript $(codescr)/ridge-regression-script.R

# this is the target that creates the output ridge-regression.RData.
$(dataR)/ridge-regression.RData: $(codescr)/ridge-regression-script.R
	Rscript $(codescr)/ridge-regression-script.R


# this target will run the script lasso-regression-script.R which will run the lasso regression analysis. There are two data outputs for this analysis, lasso-regression-output.txt and  lasso-regression.RData which contain information about the regresison analysis.
lasso: $(dataout)/lasso-regression-output.txt $(dataR)/lasso-regression.RData

# this is the target that creates the output lasso-regression-output.txt.
$(dataout)/lasso-regression-output.txt: $(codescr)/lasso-regression-script.R
	Rscript $(codescr)/lasso-regression-script.R

# this is the target that creates the output lasso-regression.RData.
$(dataR)/lasso-regression.RData:
	Rscript $(codescr)/lasso-regression-script.R

# this target will run the script pc-regression-script.R which will run the principal components regression analysis. There are two data outputs for this analysis, pc-regression-output.txt and  pc-regression.RData which contain information about the regresison analysis.
pcr: $(dataout)/pc-regression-output.txt $(dataR)/pc-regression.RData

# this is the target that creates the output pc-regression-output.txt.
$(dataout)/pc-regression-output.txt: $(codescr)/pc-regression-script.R
	Rscript $(codescr)/pc-regression-script.R

# this is the target that creates the output pc-regression.RData.
$(dataR)/pc-regression.RData:
	Rscript $(codescr)/pc-regression-script.R


# this target will run the script pls-regression-script.R which will run the partial least squares regression analysis. There are two data outputs for this analysis, pls-regression-output.txt and  pls-regression.RData which contain information about the regresison analysis.
plsr: $(dataout)/pls-regression-output.txt $(dataR)/pls-regression.RData

# this is the target that creates the output pls-regression-output.txt.
$(dataout)/pls-regression-output.txt: $(codescr)/pls-regression-script.R
	Rscript $(codescr)/pls-regression-script.R

# this is the target that creates the output pls-regression.RData.
$(dataR)/pls-regression.RData:
	Rscript $(codescr)/pls-regression-script.R

# this target will run the targets ols, ridge, lasso, pcr, and plsr. It will run all the regression scripts and generate their data outputs.
regressions: 
	make ols
	make ridge
	make lasso
	make pcr
	make plsr

# this target will generate the final reports report.pdf and report.html from report.Rmd which will be creates from the section files pasted together.
report: $(repmd) $(reppdf) $(rephtml)

# This target will take in all the sections of the report and create the file report.Rmd which will paste all the files together.
$(repmd): $(sections)
	cat $(sections)

# This target will take the Rmd file report.Rmd and will knit the pdf document report.pdf
$(reppdf): $(repmd)
	Rscript -e "library(rmarkdown); render('$(repmd)', output_format = 'pdf_document')"

# This target will take the Rmd file report.Rmd and will knit the html document report.html
$(reppdf): $(repmd)
	Rscript -e "library(rmarkdown); render('$(repmd)', output_format = 'html_document')"

# This target will generate the html version of the report slides.
slides: $(slides)/presentation.html

# this target will generate the presentation in html output. 
$(slides)/presentation.html: 
	Rscript -e "library(rmarkdown); render('$(slides)/presentation.html')"

# this target will output session-info.txt. 
session: session-info.txt

# this target allocates a target file for the output of sesison.sh
session-info.txt: $(codescr)/session.sh
	bash $(codescr)/session.sh

# This target will delete the generated reports, report.pdf and report.html
clean: 
	rm -f $(reppdf) $(rephtml)

