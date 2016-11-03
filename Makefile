repdf = report/report.pdf
rehtml = report/report.html
dataout = data/outputs
codescr = code/scripts
dataR = data/RData-files

# initializing the phony targets
.PHONY: all data tests eda ols ridge lasso pcr plsr regressions report slides session clean 

# this will tell make which are the main targets to run
all: eda regressions report

# this target dowloads the credit data. 
data:
	curl 'http://www-bcf.usc.edu/~gareth/ISL/Credit.csv' > data/datasets/Credit.csv

# this target will run the script file that has command to run the tests of the regression funcitons.
tests: 
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
$(dataR)/ols-regression.RData:
	Rscript $(codescr)/ols-regression-script.R


# this target will run the script ridge-regression-script.R which will run the ridge regression analysis. There are two data outputs for this analysis, ridge-regression-output.txt and  ridge-regression.RData which contain information about the regresison analysis.
ridge: $(dataout)/ridge-regression-output.txt $(dataR)/ridge-regression.RData

# this is the target that creates the output ridge-regression-output.txt.
$(dataout)/ridge-regression-output.txt:
	Rscript $(codescr)/ridge-regression-script.R

# this is the target that creates the output ridge-regression.RData.
$(dataR)/ridge-regression.RData:
	Rscript $(codescr)/ridge-regression-script.R


# this target will run the script lasso-regression-script.R which will run the lasso regression analysis. There are two data outputs for this analysis, lasso-regression-output.txt and  lasso-regression.RData which contain information about the regresison analysis.
lasso: $(dataout)/lasso-regression-output.txt $(dataR)/lasso-regression.RData

# this is the target that creates the output lasso-regression-output.txt.
$(dataout)/lasso-regression-output.txt:
	Rscript $(codescr)/ols-regression-script.R

# this is the target that creates the output ols-regression.RData.
$(dataR)/ols-regression.RData:
        Rscript $(codescr)/ols-regression-script.R

lasso: 

pcr:

plsr: 

regressions: 

report: 

slides: 

session: 
	bash code/scripts/session.sh

# This target will delete the generated reports, report.pdf and report.html
clean: 
	rm -f $(repdf) $(rehtml)

