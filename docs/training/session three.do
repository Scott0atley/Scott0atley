

* session three

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

* FIML mechanism
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

sem (y <- x1 x2 x3), method(ml)
etable, append

sem (y <- x1 x2 x3), method(mlmv)
etable, append

sem (y <- x1 x2 x3), method(adf)
etable, append





collect style showbase all

collect label levels etable_depvar 1 "OLS God Model" ///
								   2 "ML God Model" ///
								   3 "FIML God Model" ///
								   4 "ADF God Model", modify

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
		export("semgodmodels.docx", replace)  

		
		
* FIML MAR metric

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

sem (y <- x1 x2 x3), method(ml)
etable 

* FIML mechanism
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

sem (y <- x1 x2 x3), method(mlmv)
etable, append


collect style showbase all

collect label levels etable_depvar 1 "ML God Model" ///
								   2 "FIML Model", modify

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
		export("metricsem.docx", replace)  






* categorical variable 

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

sem (y <- x1 x2 x3), method(ml)
etable


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

sem (y <- x1 x2 x3), method(mlmv)
etable, append



collect style showbase all

collect label levels etable_depvar 1 "ML God Model" ///
								   2 "FIML Model", modify

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
		export("binsem.docx", replace)  


* Ordinal 

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

tabulate x2, generate(x2_)

sem (y <- x1 x2_2 x2_3 x2_4 x2_5 x3), method(ml)
etable


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

tabulate x2, generate(x2_)

sem (y <- x1 x2_2 x2_3 x2_4 x2_5 x3), method(mlmv)
etable, append



collect style showbase all

collect label levels etable_depvar 1 "ML God Model" ///
								   2 "FIML Model", modify

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
		export("ordfiml.docx", replace)  




