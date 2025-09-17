

* Session One *

* Viable Tests

* Set Directory 

cd"G:\Stata data and do\do files\missing data training\data"

* Load Dataset 
use datasetone.dta

* Identify missingness
misstable summarize y x1 x2 x3

misstable pattern x1 x2 x3, freq

* Look at the Regression model (complete cases by default)
regress y x1 x2 x3

* MCAR test
mcartest y x1 x2 x3

* T-test on y by missingness in x2
gen byte miss = missing(x2)

ttest y, by(miss)

* Logistic regression on missingness in x2
gen missing=.
replace missing=0 if !missing(x2)
replace missing=1 if missing(x2)
tab missing

logit missing y x1 x3

* Replicate this structure for Datasets two and three. Once done, attempt to make a matchup of which dataset reflects which missingness mechanism.
