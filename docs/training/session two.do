

* Ways to handle missing data
* Single Mean Imputation Comparison:

*God Model

clear
set seed 12345
* Set number of observations
set obs 1000
    
* Generate metric independent variable #1
drawnorm x1, n(1000) means(40) sds(12)

* Generate metric independent variable #2
drawnorm x2, n(1000) means(200) sds(50)

* Generate metric independent variable #3
drawnorm x3, n(1000) means(150) sds(5)

* Generate metric dependent variable
gen y = 30*x1 + 40*x2 + 50*x3 + rnormal(5000, 1500)

regress y x1 x2 x3
etable 

* MAR mechanism
clear
set seed 12345
* Set number of observations
set obs 1000
    
* Generate metric independent variable #1
drawnorm x1, n(1000) means(40) sds(12)

* Generate metric independent variable #2
drawnorm x2, n(1000) means(200) sds(50)

* Generate metric independent variable #3
drawnorm x3, n(1000) means(150) sds(5)

* Generate metric dependent variable
gen y = 30*x1 + 40*x2 + 50*x3 + rnormal(5000, 1500)

* Generate MAR
gen prob_mar = logistic(y-21791)
gen rmar = runiform() < prob_mar     
replace x2 = . if rmar == 1  

regress y x1 x2 x3

etable, append

* Single Mean Imputation
* Set number of observations
clear
set seed 12345
set obs 1000
    
* Generate metric independent variable #1
drawnorm x1, n(1000) means(40) sds(12)

* Generate metric independent variable #2
drawnorm x2, n(1000) means(200) sds(50)

* Generate metric independent variable #3
drawnorm x3, n(1000) means(150) sds(5)

* Generate metric dependent variable
gen y = 30*x1 + 40*x2 + 50*x3 + rnormal(5000, 1500)

* Generate MAR
gen prob_mar = logistic(y-21791)
gen rmar = runiform() < prob_mar     
replace x2 = . if rmar == 1   

summarize x2, meanonly
replace x2 = r(mean) if missing(x2)

regress y x1 x2 x3

etable, append

** Tables

collect style showbase all

collect label levels etable_depvar 1 "God Model" ///
								   2 "MAR Model" ///
								   3 "Single Mean Imp", modify

collect style cell, font(Book Antiqua)

etable, replay column(depvar) ///
cstat(_r_b, nformat(%4.2f))  ///
		cstat(_r_se, nformat(%6.2f))  ///
		showstars showstarsnote  ///
		stars(.05 "*" .01 "**" .001 "***", attach(_r_b)) ///
		mstat(N) mstat(aic) mstat(bic) mstat(r2_a)	///
		title("Table 1: Regression Models") ///
		titlestyles(font(Arial Narrow, size(14) bold)) ///
		note("Data Source: Simulated") ///
		notestyles(font(Book Antiqua, size(8) italic)) ///
		export("meanimp.docx", replace)  

		

*Single Mode Imputation:		
*God Model

clear
set seed 12345
* Set number of observations
set obs 1000
    
* Generate metric independent variable #1
drawnorm x1, n(1000) means(40) sds(12)

* Generate binary independent variable #2
gen x2 = runiform() < 0.55

* Generate metric independent variable #3
drawnorm x3, n(1000) means(150) sds(5)

* Generate metric dependent variable
gen y = 30*x1 + 400*x2 + 50*x3 + rnormal(5000, 1500)

regress y x1 i.x2 x3
etable 


* MAR mechanism
clear
set seed 12345
* Set number of observations
set obs 1000
    
* Generate metric independent variable #1
drawnorm x1, n(1000) means(40) sds(12)

* Generate binary independent variable #2
gen x2 = runiform() < 0.55

* Generate metric independent variable #3
drawnorm x3, n(1000) means(150) sds(5)

* Generate metric dependent variable
gen y = 30*x1 + 400*x2 + 50*x3 + rnormal(5000, 1500)


* Generate MAR
gen prob_mar = logistic(y-13500)
gen rmar = runiform() < prob_mar     
replace x2 = . if rmar == 1   

regress y x1 i.x2 x3

etable, append

* Single Mode Imputation
* Set number of observations
clear
set seed 12345
set obs 1000
    
* Generate metric independent variable #1
drawnorm x1, n(1000) means(40) sds(12)

* Generate binary independent variable #2
gen x2 = runiform() < 0.55

* Generate metric independent variable #3
drawnorm x3, n(1000) means(150) sds(5)

* Generate metric dependent variable
gen y = 30*x1 + 400*x2 + 50*x3 + rnormal(5000, 1500)

* Generate MAR
gen prob_mar = logistic(y-13500)
gen rmar = runiform() < prob_mar     
replace x2 = . if rmar == 1  

* Count number of 1s and 0s
count if x2 == 1
scalar ones = r(N)

count if x2 == 0
scalar zeros = r(N)

* Determine the mode
scalar mode_x2 = cond(ones >= zeros, 1, 0)

* Replace missing values with the mode
replace x2 = mode_x2 if missing(x2)

regress y x1 i.x2 x3

etable, append 


collect style showbase all

collect label levels etable_depvar 1 "God Model" ///
								   2 "MAR Model" ///
								   3 "Single Modal Imp", modify

collect style cell, font(Book Antiqua)

etable, replay column(depvar) ///
cstat(_r_b, nformat(%4.2f))  ///
		cstat(_r_se, nformat(%6.2f))  ///
		showstars showstarsnote  ///
		stars(.05 "*" .01 "**" .001 "***", attach(_r_b)) ///
		mstat(N) mstat(aic) mstat(bic) mstat(r2_a)	///
		title("Table 1: Regression Models") ///
		titlestyles(font(Arial Narrow, size(14) bold)) ///
		note("Data Source: Simulated") ///
		notestyles(font(Book Antiqua, size(8) italic)) ///
		export("modeimp.docx", replace)  


		
*God Model

clear
set seed 12345
* Set number of observations
set obs 1000
    
* Generate metric independent variable #1
drawnorm x1, n(1000) means(40) sds(12)

* Generate binary independent variable #2
gen x2 = ceil(runiform() * 5)

* Generate metric independent variable #3
drawnorm x3, n(1000) means(150) sds(5)

* Generate metric dependent variable
gen y = 30*x1 + 400*x2 + 50*x3 + rnormal(5000, 1500)

regress y x1 i.x2 x3
etable 


* MAR mechanism
clear
set seed 12345
* Set number of observations
set obs 1000
    
* Generate metric independent variable #1
drawnorm x1, n(1000) means(40) sds(12)

* Generate binary independent variable #2
gen x2 = ceil(runiform() * 5)

* Generate metric independent variable #3
drawnorm x3, n(1000) means(150) sds(5)

* Generate metric dependent variable
gen y = 30*x1 + 400*x2 + 50*x3 + rnormal(5000, 1500)


* Generate MAR
gen prob_mar = logistic(y-13500)
gen rmar = runiform() < prob_mar     
replace x2 = . if rmar == 1   

regress y x1 i.x2 x3

etable, append		

* Single Median Imputation
* Set number of observations
clear
set seed 12345
set obs 1000
    
* Generate metric independent variable #1
drawnorm x1, n(1000) means(40) sds(12)

* Generate ordinal independent variable #2
gen x2 = ceil(runiform() * 5)

* Generate metric independent variable #3
drawnorm x3, n(1000) means(150) sds(5)

* Generate metric dependent variable
gen y = 30*x1 + 400*x2 + 50*x3 + rnormal(5000, 1500)


* Generate MAR
gen prob_mar = logistic(y-13500)
gen rmar = runiform() < prob_mar     
replace x2 = . if rmar == 1   

* Step 1: Get the median of non-missing x2
summarize x2 if !missing(x2), detail
scalar med_x2 = r(p50)

* Step 2: Replace missing values with the median
replace x2 = med_x2 if missing(x2)

regress y x1 i.x2 x3

etable, append



collect style showbase all

collect label levels etable_depvar 1 "God Model" ///
								   2 "MAR Model" ///
								   3 "Single Median Imp", modify

collect style cell, font(Book Antiqua)

etable, replay column(depvar) ///
cstat(_r_b, nformat(%4.2f))  ///
		cstat(_r_se, nformat(%6.2f))  ///
		showstars showstarsnote  ///
		stars(.05 "*" .01 "**" .001 "***", attach(_r_b)) ///
		mstat(N) mstat(aic) mstat(bic) mstat(r2_a)	///
		title("Table 1: Regression Models") ///
		titlestyles(font(Arial Narrow, size(14) bold)) ///
		note("Data Source: Simulated") ///
		notestyles(font(Book Antiqua, size(8) italic)) ///
		export("medianimp.docx", replace)  

		
		
		
* Less than gold standard

*God Model

clear
set seed 12345
* Set number of observations
set obs 1000
    
* Generate metric independent variable #1
drawnorm x1, n(1000) means(40) sds(12)

* Generate binary independent variable #2
gen x2 = runiform() < 0.55

* Generate metric independent variable #3
drawnorm x3, n(1000) means(150) sds(5)

* Generate metric dependent variable
gen y = 30*x1 + 400*x2 + 50*x3 + rnormal(5000, 1500)

regress y x1 i.x2 x3
etable 


* MAR mechanism
clear
set seed 12345
* Set number of observations
set obs 1000
    
* Generate metric independent variable #1
drawnorm x1, n(1000) means(40) sds(12)

* Generate binary independent variable #2
gen x2 = runiform() < 0.55

* Generate metric independent variable #3
drawnorm x3, n(1000) means(150) sds(5)

* Generate metric dependent variable
gen y = 30*x1 + 400*x2 + 50*x3 + rnormal(5000, 1500)


* Generate MAR
gen prob_mar = logistic(y-13500)
gen rmar = runiform() < prob_mar     
replace x2 = . if rmar == 1   

regress y x1 i.x2 x3

etable, append

* Dumm var adjustment = 0
* Set number of observations
clear
set seed 12345
set obs 1000
    
* Generate metric independent variable #1
drawnorm x1, n(1000) means(40) sds(12)

* Generate binary independent variable #2
gen x2 = runiform() < 0.55

* Generate metric independent variable #3
drawnorm x3, n(1000) means(150) sds(5)

* Generate metric dependent variable
gen y = 30*x1 + 400*x2 + 50*x3 + rnormal(5000, 1500)

* Generate MAR
gen prob_mar = logistic(y-13500)
gen rmar = runiform() < prob_mar     
replace x2 = . if rmar == 1  

* Replace missing values equal to zero
replace x2 = 0 if x2==.

regress y x1 i.x2 x3

etable, append 


* Dumm var adjustment = 1
* Set number of observations
clear
set seed 12345
set obs 1000
    
* Generate metric independent variable #1
drawnorm x1, n(1000) means(40) sds(12)

* Generate binary independent variable #2
gen x2 = runiform() < 0.55

* Generate metric independent variable #3
drawnorm x3, n(1000) means(150) sds(5)

* Generate metric dependent variable
gen y = 30*x1 + 400*x2 + 50*x3 + rnormal(5000, 1500)

* Generate MAR
gen prob_mar = logistic(y-13500)
gen rmar = runiform() < prob_mar     
replace x2 = . if rmar == 1  

* Replace missing values equal to zero
replace x2 = 1 if x2==.

regress y x1 i.x2 x3

etable, append 


collect style showbase all

collect label levels etable_depvar 1 "God Model" ///
								   2 "MAR Model" ///
								   3 "Dummy = 0" ///
								   4 "Dummy = 1", modify

collect style cell, font(Book Antiqua)

etable, replay column(depvar) ///
cstat(_r_b, nformat(%4.2f))  ///
		cstat(_r_se, nformat(%6.2f))  ///
		showstars showstarsnote  ///
		stars(.05 "*" .01 "**" .001 "***", attach(_r_b)) ///
		mstat(N) mstat(aic) mstat(bic) mstat(r2_a)	///
		title("Table 1: Regression Models") ///
		titlestyles(font(Arial Narrow, size(14) bold)) ///
		note("Data Source: Simulated") ///
		notestyles(font(Book Antiqua, size(8) italic)) ///
		export("dummyadjust.docx", replace)  		
		
		
		
		
* FIML based approach  

*God Model

clear
set seed 12345
* Set number of observations
set obs 1000
    
* Generate metric independent variable #1
drawnorm x1, n(1000) means(40) sds(12)

* Generate binary independent variable #2
drawnorm x2, n(1000) means(200) sds(50)

* Generate metric independent variable #3
drawnorm x3, n(1000) means(150) sds(5)

* Generate metric dependent variable
gen y = 30*x1 + 40*x2 + 50*x3 + rnormal(5000, 1500)

regress y x1 x2 x3
etable 


* MAR mechanism
clear
set seed 12345
* Set number of observations
set obs 1000
    
* Generate metric independent variable #1
drawnorm x1, n(1000) means(40) sds(12)

* Generate binary independent variable #2
drawnorm x2, n(1000) means(200) sds(50)

* Generate metric independent variable #3
drawnorm x3, n(1000) means(150) sds(5)

* Generate metric dependent variable
gen y = 30*x1 + 40*x2 + 50*x3 + rnormal(5000, 1500)


* Generate MAR
gen prob_mar = logistic(y-21791)
gen rmar = runiform() < prob_mar     
replace x2 = . if rmar == 1  

regress y x1 x2 x3

etable, append


* FIML 
clear
set seed 12345
* Set number of observations
set obs 1000
    
* Generate metric independent variable #1
drawnorm x1, n(1000) means(40) sds(12)

* Generate binary independent variable #2
drawnorm x2, n(1000) means(200) sds(50)

* Generate metric independent variable #3
drawnorm x3, n(1000) means(150) sds(5)

* Generate metric dependent variable
gen y = 30*x1 + 40*x2 + 50*x3 + rnormal(5000, 1500)


* Generate MAR
gen prob_mar = logistic(y-21791)
gen rmar = runiform() < prob_mar     
replace x2 = . if rmar == 1  

sem (y <- x1 x2 x3), method(mlmv)

etable, append



collect style showbase all

collect label levels etable_depvar 1 "God Model" ///
								   2 "MAR Model" ///
								   3 "FIML", modify

collect style cell, font(Book Antiqua)

etable, replay column(depvar) ///
cstat(_r_b, nformat(%4.2f))  ///
		cstat(_r_se, nformat(%6.2f))  ///
		showstars showstarsnote  ///
		stars(.05 "*" .01 "**" .001 "***", attach(_r_b)) ///
		mstat(N) mstat(aic) mstat(bic) mstat(r2_a)	///
		title("Table 1: Regression Models") ///
		titlestyles(font(Arial Narrow, size(14) bold)) ///
		note("Data Source: Simulated") ///
		notestyles(font(Book Antiqua, size(8) italic)) ///
		export("FIMLmodels.docx", replace)  
		
		
		
* MI based approach  

*God Model

clear
set seed 12345
* Set number of observations
set obs 1000
    
* Generate metric independent variable #1
drawnorm x1, n(1000) means(40) sds(12)

* Generate binary independent variable #2
drawnorm x2, n(1000) means(200) sds(50)

* Generate metric independent variable #3
drawnorm x3, n(1000) means(150) sds(5)

* Generate metric dependent variable
gen y = 30*x1 + 40*x2 + 50*x3 + rnormal(5000, 1500)

regress y x1 x2 x3
etable 


* MAR mechanism
clear
set seed 12345
* Set number of observations
set obs 1000
    
* Generate metric independent variable #1
drawnorm x1, n(1000) means(40) sds(12)

* Generate binary independent variable #2
drawnorm x2, n(1000) means(200) sds(50)

* Generate metric independent variable #3
drawnorm x3, n(1000) means(150) sds(5)

* Generate metric dependent variable
gen y = 30*x1 + 40*x2 + 50*x3 + rnormal(5000, 1500)


* Generate MAR
gen prob_mar = logistic(y-21791)
gen rmar = runiform() < prob_mar     
replace x2 = . if rmar == 1  

regress y x1 x2 x3

etable, append


* MAR mechanism
clear
set seed 12345
* Set number of observations
* Set number of observations
set obs 1000
    
* Generate metric independent variable #1
drawnorm x1, n(1000) means(40) sds(12)

* Generate metric independent variable #2
drawnorm x2, n(1000) means(200) sds(50)

* Generate metric independent variable #3
drawnorm x3, n(1000) means(150) sds(5)

* Generate metric dependent variable
gen y = 30*x1 + 40*x2 + 50*x3 + rnormal(5000, 1500)

* Generate MAR
gen prob_mar = logistic(y-21791)
gen rmar = runiform() < prob_mar     
replace x2 = . if rmar == 1   
	
	
* Generate Auxiliary Variables Predictive of Probability of Missingness and Missing Values 	
gen aux1 = 0.7*x2 + 0.3*y + rnormal(0, 10)   // Correlated with x2 and y
gen aux2 = 0.5*x2 + 0.5*y + rnormal(0, 15)   // Balanced correlation with x2 and y
gen aux3 = 0.6*x2 + 0.2*x1 + 0.2*y + rnormal(0, 12)   // Adds x1 for slight variation
gen aux4 = 0.4*x2 + 0.6*y + rnormal(0, 20)   // Heavier weight on y (missingness predictor)
gen aux5 = 0.3*x2 + 0.3*y + 0.4*x3 + rnormal(0, 18)  // Introduces correlation with x3

* Generate Auxiliary Variables Predictive of ONLY Missing Values 

gen aux6 = 0.9*x2 + rnormal(0, 10)   // Strong correlation with x2, no y dependence
gen aux7 = 0.8*x2 + 0.2*x3 + rnormal(0, 12)   // Includes x3, but no direct link to missingness
gen aux8 = 0.85*x2 + 0.1*x1 + rnormal(0, 15)  // Includes x1, but missingness-independent
	
* setting MI data up

mi set wide

mi register imputed y x1 x2 x3 aux1 aux2 aux3 aux4 aux5 aux6 aux7 aux8 


mi impute chained ///
///
(regress) y x1 x2 x3 aux1 aux2 aux3 aux4 aux5 aux6 aux7 aux8 ///
, rseed(12345) dots force add(10) burnin(10) 


* mi model

mi estimate, post dots: regress y x1 x2 x3


etable, append


collect style showbase all

collect label levels etable_depvar 1 "God Model" ///
								   2 "MAR Model" ///
								   3 "MI", modify

collect style cell, font(Book Antiqua)

etable, replay column(depvar) ///
cstat(_r_b, nformat(%4.2f))  ///
		cstat(_r_se, nformat(%6.2f))  ///
		showstars showstarsnote  ///
		stars(.05 "*" .01 "**" .001 "***", attach(_r_b)) ///
		mstat(N) mstat(aic) mstat(bic) mstat(r2_a)	///
		title("Table 1: Regression Models") ///
		titlestyles(font(Arial Narrow, size(14) bold)) ///
		note("Data Source: Simulated") ///
		notestyles(font(Book Antiqua, size(8) italic)) ///
		export("MIModel.docx", replace)  		