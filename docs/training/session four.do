
* Session Four

* STEP 1: Simulate Data
clear
set obs 200
set seed 42

* Continuous outcome
gen income = round(rnormal(50000, 10000))

* Continuous predictor
gen age = rnormal(40, 10)

* Binary predictor
gen gender = runiform() > 0.5

* Ordinal predictor
gen u = runiform()
gen byte education = .
replace education = 1 if u < 0.3
replace education = 2 if u >= 0.3 & u < 0.8
replace education = 3 if u >= 0.8
label define edu_lbl 1 "low" 2 "med" 3 "high"
label values education edu_lbl

* Auxiliary variables (fully observed)
gen aux1 = rnormal(age + 5, 5)
gen aux2 = rnormal(income/10000, 2)

* STEP 2: Induce Missingness
gen byte miss_age = runiform() < 0.15
gen byte miss_gender = runiform() < 0.10
gen byte miss_edu = runiform() < 0.125
gen byte miss_income = runiform() < 0.10

replace age = . if miss_age
replace gender = . if miss_gender
replace education = . if miss_edu
replace income = . if miss_income

drop miss_*

* STEP 3: Register data for multiple imputation
mi set mlong

* Declare imputed and passive variables
mi register imputed age gender education income 
mi register regular aux1 aux2

* STEP 4: Imputation using chained equations
mi impute chained (regress) age income ///
                   (logit) gender ///
                   (ologit) education ///
                   = aux1 aux2, add(20) rseed(12345) savetrace(trace, replace)

* STEP 5: Diagnostics
mi describe
mi misstable summarize

* STEP 6: Analyze imputed datasets
mi estimate: regress income age i.gender i.education

* STEP 7: Diagnostics
mi estimate, vartable dftable

* Take a look at some of our imputation diagnostic measures and plots to assess if anything needs to be changed about our imputation model. Let's again examine the RVI, FMI, DF, RE as well as the between imputation and the within imputation variance estimates. As can be seen in the table below, the highest estimated RVI (25%) and FMI (20%) are associated with high. This indicates that the imputation could potentially be improved by increasing the number of imputations to 20 or 25 as well as including an auxiliary variable(s) associated with high.

* Trace Plot

use trace, clear

describe

reshape wide *mean *sd, i(iter) j(m)
tsset iter

tsline income_mean1, name(mice1, replace) legend(off) ytitle("Mean of Income")

tsline income_mean*, name(mice1a, replace) legend(off) ytitle("Mean of Income")
tsline income_sd*, name(mice1b, replace) legend(off) ytitle("SD of Income")
graph combine mice1a mice1b, xcommon cols(1) title(Trace plots of summaries of imputed values)
