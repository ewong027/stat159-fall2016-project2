repdf = report/report.pdf
rehtml = report/report.html


#initializing the phony targets
.PHONY: all data tests eda ols ridge lasso pcr plsr regressions report slides session clean

#this will tell make which are the main targets to run
all: eda regressions report

#this target dowloads the credit data. 
data:
	curl 'http://www-bcf.usc.edu/~gareth/ISL/Credit.csv' > data/Credit.csv

tests: 

eda: 

ols: 

ridge: 

lasso: 

pcr:

plsr: 

regressions: 

report: 

slides: 

session: 

#This target will delete the generated reports, report.pdf and report.html
clean: 
	rm -f $(repdf) $(rehtml)

