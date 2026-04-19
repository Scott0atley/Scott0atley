* Using full sample, only core members but all workers allowed. 


******************************************************************************
******************************************************************************
* 							General set-up
******************************************************************************
******************************************************************************
	clear
	set maxvar 30000
	set more off
	macro drop _all
	capture log close
******************************************************************************
* Create global paths.

* Path 1: Main UKHLS Survey data	
global path1 "C:\Users\scott\OneDrive - The University of Manchester\ELSA\Wave 0-11 UKDS\.dta Files\UKDA-5050-stata\stata\stata13_se"

* Path 2: Working Data	
global path2 "C:\Users\scott\OneDrive - The University of Manchester\ELSA\Wave 0-11 UKDS\.dta Files\Working Data"

* Path 3: Tables/Figures
global path3 "C:\Users\scott\OneDrive - The University of Manchester\ELSA\Wave 0-11 UKDS\Output"

* Path 4: do files
global path4 "C:\Users\scott\OneDrive - The University of Manchester\ELSA\Wave 0-11 UKDS\.do Files"

	
******************************************************************************
******************************************************************************

*							Data Management

******************************************************************************
******************************************************************************

********************************************************************************
*							Person's datasets
********************************************************************************

********************************************************************************
* Wave 10
********************************************************************************
	use "$path1/wave_10_elsa_data_eul_v4.dta", clear
	
	generate wave = 10
	label variable wave "ELSA wave"
	
	merge 1:1 idauniq using "$path1/wave_10_financial_derived_variables.dta"
	drop _merge 
	merge 1:1 idauniq using "$path1/wave_10_ifs_derived_variables.dta"
	drop _merge
	
	save "$path2/TEMP_ELSA_wave10_v1.dta", replace	
	
********************************************************************************
*						Data Checks	
********************************************************************************

keep if corepartner==1

count

tab wave 

duplicates report idauniq	

* Leaves us with a sample size of 3,888 individuals that are 66 or over and not in paid employment

********************************************************************************
*						Latent Variable Measures
********************************************************************************

* ECONOMIC

* Net Income 
* total net income is at the benefit unit level. It includes total income from employment, self-employment, private pension, state pension, state benefit, asset, and other income sources
summarize eqtotinc_bu_s
* extreme outliers all over the place, winsorization used 
summ eqtotinc_bu_s, detail
local p1 = r(p1)
local p99 = r(p99)

* Make a copy of your variable
gen eqtotinc_w = eqtotinc_bu_s

* Replace extreme values with boundary values
replace eqtotinc_w = `p1' if eqtotinc_w < `p1'
replace eqtotinc_w = `p99' if eqtotinc_w > `p99'

sum eqtotinc_w, detail

graph box eqtotinc_bu_s

graph box eqtotinc_w

* Net Wealth
* total net wealth also at the BUL level includes non-housing wealth related to financial and physical wealth as well as primary housing wealth.
summarize nettotw_bu_s

graph box nettotw_bu_s
* extreme outliers all over the place, winsorization used 
summ nettotw_bu_s, detail
local p1 = r(p1)
local p99 = r(p99)

* Make a copy of your variable
gen wealth_w = nettotw_bu_s

* Replace extreme values with boundary values
replace wealth_w = `p1' if wealth_w < `p1'
replace wealth_w = `p99' if wealth_w > `p99'

sum wealth_w, detail
* check that missing values aren't being given random 



* SOCIAL
* UCLA 3-item loneliness scale - higher values indicate higher levels of loneliness - Hughes et al 2004
tab scfeela
gen companion=.
replace companion=1 if scfeela==1
replace companion=2 if scfeela==2
replace companion=3 if scfeela==3

tab scfeelb
gen leftout=.
replace leftout=1 if scfeelb==1
replace leftout=2 if scfeelb==2
replace leftout=3 if scfeelb==3

tab scfeelc
gen isolated=.
replace isolated=1 if scfeelc==1
replace isolated=2 if scfeelc==2
replace isolated=3 if scfeelc==3

gen loneliness=companion+leftout+isolated

* Social Isolation higher values indicate higher levels of social isolation - Gale et al 2018

* Marriage
gen married=.
replace married=0 if marstat==1 | marstat==2
replace married=1 if marstat>=3 & marstat<=6
tab married

* Other family members contact 
tab scfamg
gen otherfam=.
replace otherfam=0 if scfamg==1
replace otherfam=0 if scfamg==2
replace otherfam=0 if scfamg==3
replace otherfam=1 if scfamg==4
replace otherfam=1 if scfamg==5
replace otherfam=1 if scfamg==6

gen otherfamp=.
replace otherfamp=0 if scfamh>=1 & scfamh<=3
replace otherfamp=1 if scfamh>=4 & scfamh<=6

gen otherfamw=.
replace otherfamw=0 if scfamj>=1 & scfamj<=3
replace otherfamw=1 if scfamj>=4 & scfamj<=6

gen otherfamt=.
replace otherfamt=0 if scfamk>=1 & scfamk<=3
replace otherfamt=1 if scfamk>=4 & scfamk<=6

gen totalotherfam=. 
replace totalotherfam=0 if otherfam==0 | otherfamp==0 | otherfamw==0 | otherfamt==0
replace totalotherfam=1 if otherfam==1 & otherfamp==1 & otherfamw==1 & otherfamt==1


* Children 
tab scchdg
gen children=.
replace children=0 if scchdg==1
replace children=0 if scchdg==2
replace children=0 if scchdg==3
replace children=1 if scchdg==4
replace children=1 if scchdg==5
replace children=1 if scchdg==6

gen childrenp=.
replace childrenp=0 if scchdh>=1 & scchdh<=3
replace childrenp=1 if scchdh>=4 & scchdh<=6

gen childrenw=.
replace childrenw=0 if scchdj>=1 & scchdj<=3
replace childrenw=1 if scchdj>=4 & scchdj<=6

gen childrent=.
replace childrent=0 if scchdk>=1 & scchdk<=3
replace childrent=1 if scchdk>=4 & scchdk<=6


gen totalchildren=. 
replace totalchildren=0 if children==0 | childrenp==0 | childrenw==0 | childrent==0
replace totalchildren=1 if children==1 & childrenp==1 & childrenw==1 & childrent==1

* Friends
tab scfrdg
gen friends=.
replace friends=0 if scfrdg==1
replace friends=0 if scfrdg==2
replace friends=0 if scfrdg==3
replace friends=1 if scfrdg==4
replace friends=1 if scfrdg==5
replace friends=1 if scfrdg==6

gen friendsp=.
replace friendsp=0 if scfrdh>=1 & scfrdh<=3
replace friendsp=1 if scfrdh>=4 & scfrdh<=6

gen friendsw=.
replace friendsw=0 if scfrdj>=1 & scfrdj<=3
replace friendsw=1 if scfrdj>=4 & scfrdj<=6

gen friendst=.
replace friendst=0 if scfrdk>=1 & scfrdk<=3
replace friendst=1 if scfrdk>=4 & scfrdk<=6

gen totalfriends=. 
replace totalfriends=0 if friends==0 | friendsp==0 | friendsw==0 | friendst==0
replace totalfriends=1 if friends==1 & friendsp==1 & friendsw==1 & friendst==1

* Member of orgs, religious or social groups 
tab scorg96
gen member=.
replace member=0 if scorg96==1
replace member=1 if scorg96==0 

gen socialisolation=married+totalotherfam+totalchildren+totalfriends+member


* Cultural Capital 
tab scacta
gen cinema=.
replace cinema=0 if scacta==6
replace cinema=0 if scacta==5
replace cinema=0 if scacta==4
replace cinema=0 if scacta==3
replace cinema=1 if scacta==2
replace cinema=1 if scacta==1
lab def cinema 0"Cinema-" 1"Cinema+"
lab val cinema cinema

tab scactb
gen eatout=.
replace eatout=0 if scactb==6
replace eatout=0 if scactb==5
replace eatout=0 if scactb==4
replace eatout=0 if scactb==3
replace eatout=1 if scactb==2
replace eatout=1 if scactb==1
lab def eatout 0"Eatout-" 1"Eatout+"
lab val eatout eatout

tab scactc
gen art=.
replace art=0 if scactc==6
replace art=0 if scactc==5
replace art=0 if scactc==4
replace art=0 if scactc==3
replace art=1 if scactc==2
replace art=1 if scactc==1
lab def art 0"Art-" 1"Art+"
lab val art art

tab scactd
gen theatre=.
replace theatre=0 if scactd==6
replace theatre=0 if scactd==5
replace theatre=0 if scactd==4
replace theatre=0 if scactd==3
replace theatre=1 if scactd==2
replace theatre=1 if scactd==1
lab def theatre 0"Theatre-" 1"Theatre+"
lab val theatre theatre

tab heactb
gen sports=.
replace sports=0 if scorgsp==0
replace sports=1 if scorgsp==1
lab def sports 0"Sports-" 1"Sports+"
lab val sports sports

gen vgames=.
replace vgames=0 if scinagm==0
replace vgames=1 if scinagm==1
lab def vgames 0"VGames-" 1"VGames+"
lab val vgames vgames

gen snetwork=.
replace snetwork=0 if scinasn==0
replace snetwork=1 if scinasn==1
lab def snetwork 0"SNetwork-" 1"SNetwork+"
lab val snetwork snetwork

tab scorged
gen eveningclass=. 
replace eveningclass=0 if scorged==0
replace eveningclass=1 if scorged==1
lab def eveningclass 0"EClass-" 1"EClass+"
lab val eveningclass eveningclass

tab scinamu
gen music=. 
replace music=0 if scinamu==0
replace music=1 if scinamu==1
lab def music 0"Music-" 1"Music+"
lab val music music

tab scinaeb
gen ebook=. 
replace ebook=0 if scinaeb==0
replace ebook=1 if scinaeb==1
lab def ebook 0"EBook-" 1"EBook+"
lab val ebook ebook

tab scinanw
gen enews=. 
replace enews=0 if scinanw==0
replace enews=1 if scinanw==1
lab def enews 0"ENews-" 1"ENews+"
lab val enews enews

* multiple correspondance analysis 

mca cinema vgames snetwork sports eatout art theatre eveningclass music ebook enews
mcaplot, overlay legend(off) xline(0) yline(0) scale(.8)

/* mobility v non 
mca cinema vgames snetwork sports eatout art theatre eveningclass music ebook enews hemobwa
mcaplot, overlay legend(off) xline(0) yline(0) scale(.8)
*/
* Going off this mapping, two clear clusters appear

gen emerging=vgames+snetwork+music+ebook+enews+sports
gen highbrow=cinema+theatre+art+eveningclass+eatout



mat mcamat=e(cGS)
mat colnames mcamat = mass qual inert co1 rel1 abs1 co2 rel2 abs2
svmat2 mcamat, rname(varname) name(col)
tabstat mass rel1 abs1 rel2 abs2, stat(mean sum)

twoway (scatter co2 co1 [aweight=mass], xline(0) yline(0)  mlabsize(vsmall) msymbol(oh) msize(small) legend(off)) (scatter co2 co1, mlabsize(vsmall) msymbol(i) mlabel(varname) legend(off))

* Standardize Latent Varaibles to provide equal weighting


* Standardize the 'totinc_bu_s' variable
egen mean_totinc_bu_s = mean(eqtotinc_w)
egen sd_totinc_bu_s = sd(eqtotinc_w)
gen totinc_bu_s_z = (eqtotinc_w - mean_totinc_bu_s) / sd_totinc_bu_s

* Standardize the 'nettotw_bu_s' variable
egen mean_nettotw_bu_s = mean(wealth_w)
egen sd_nettotw_bu_s = sd(wealth_w)
gen nettotw_bu_s_z = (wealth_w - mean_nettotw_bu_s) / sd_nettotw_bu_s

* Standardize the 'loneliness' variable
egen mean_loneliness = mean(loneliness)
egen sd_loneliness= sd(loneliness)
gen loneliness_z = (loneliness - mean_loneliness) / sd_loneliness

* Standardize the 'socialisolation' variable
egen mean_socialisolation = mean(socialisolation)
egen sd_socialisolation = sd(socialisolation)
gen socialisolation_z = (socialisolation - mean_socialisolation) / sd_socialisolation

* Standardize the 'highbrow' variable
egen mean_highbrow = mean(highbrow)
egen sd_highbrow = sd(highbrow)
gen highbrow_z = (highbrow - mean_highbrow) / sd_highbrow

* Standardize the 'emerging' variable
egen mean_emerging = mean(emerging)
egen sd_emerging = sd(emerging)
gen emerging_z = (emerging - mean_emerging) / sd_emerging


* Internal Consistency 

save "$path2/TEMP_CLEAN_v1.dta", replace	

use "$path2/TEMP_CLEAN_v1.dta", clear	

alpha totinc_bu_s_z nettotw_bu_s_z loneliness_z socialisolation_z highbrow_z emerging_z, item 

corr totinc_bu_s_z nettotw_bu_s_z loneliness_z socialisolation_z highbrow_z emerging_z

* Removing needless vars from dataset to increase speed 


* latent trait model 

svyset idahhw10 [pweight = w10xwgt], strata(gor) vce(linearized) singleunit(centered)

quietly gsem (totinc_bu_s_z nettotw_bu_s_z loneliness_z socialisolation_z highbrow_z emerging_z <- ) [pweight = w10xwgt], lclass(A 1)

estimates store lc1 

quietly gsem (totinc_bu_s_z nettotw_bu_s_z loneliness_z socialisolation_z highbrow_z emerging_z <- ) [pweight = w10xwgt], lclass(A 2)

estimates store lc2

quietly gsem (totinc_bu_s_z nettotw_bu_s_z loneliness_z socialisolation_z highbrow_z emerging_z <- ) [pweight = w10xwgt], lclass(A 3)

estimates store lc3

quietly gsem (totinc_bu_s_z nettotw_bu_s_z loneliness_z socialisolation_z highbrow_z emerging_z <- ) [pweight = w10xwgt], lclass(A 4)

estimates store lc4

quietly gsem (totinc_bu_s_z nettotw_bu_s_z loneliness_z socialisolation_z highbrow_z emerging_z <- ) [pweight = w10xwgt], lclass(A 5)

estimates store lc5

quietly gsem (totinc_bu_s_z nettotw_bu_s_z loneliness_z socialisolation_z highbrow_z emerging_z <- ) [pweight = w10xwgt], lclass(A 6)

estimates store lc6

quietly gsem (totinc_bu_s_z nettotw_bu_s_z loneliness_z socialisolation_z highbrow_z emerging_z <- ) [pweight = w10xwgt], lclass(A 7)

estimates store lc7

quietly gsem (totinc_bu_s_z nettotw_bu_s_z loneliness_z socialisolation_z highbrow_z emerging_z <- ) [pweight = w10xwgt], lclass(A 8)

estimates store lc8

quietly gsem (totinc_bu_s_z nettotw_bu_s_z loneliness_z socialisolation_z highbrow_z emerging_z <- ) [pweight = w10xwgt], lclass(A 9)
estimates store lc9

quietly gsem (totinc_bu_s_z nettotw_bu_s_z loneliness_z socialisolation_z highbrow_z emerging_z <- ) [pweight = w10xwgt], lclass(A 10)
estimates store lc10

quietly gsem (totinc_bu_s_z nettotw_bu_s_z loneliness_z socialisolation_z highbrow_z emerging_z <- ) [pweight = w10xwgt], lclass(A 11)
*convergence not acheived 

quietly gsem (totinc_bu_s_z nettotw_bu_s_z loneliness_z socialisolation_z highbrow_z emerging_z <- ) [pweight = w10xwgt], lclass(A 12)
*convergence not achieved 

lcstats lc1 lc2 lc3 lc4 lc5 lc6 lc7 lc8 lc9 lc10, allic split

lcstats lc1 lc2 lc3 lc4 lc5 lc6 lc7 lc8 lc9 lc10, results(k_classes ll bic aic lmr p_lmr vlmr p_vlmr entropy) noshownames

estimates restore lc1
estat lcprob, post
collect get _r_b _r_se, tag(estimates[lc1])
estimates restore lc2
estat lcprob, post
collect get _r_b _r_se, tag(estimates[lc2])
estimates restore lc3
estat lcprob, post
collect get _r_b _r_se, tag(estimates[lc3])
estimates restore lc4
estat lcprob, post
collect get _r_b _r_se, tag(estimates[lc4])
estimates restore lc5
estat lcprob, post
collect get _r_b _r_se, tag(estimates[lc5])
estimates restore lc6
estat lcprob, post
collect get _r_b _r_se, tag(estimates[lc6])
estimates restore lc7
estat lcprob, post
collect get _r_b _r_se, tag(estimates[lc7])
estimates restore lc8
estat lcprob, post
collect get _r_b _r_se, tag(estimates[lc8])
estimates restore lc9
estat lcprob, post
collect get _r_b _r_se, tag(estimates[lc9])
estimates restore lc10
estat lcprob, post
collect get _r_b _r_se, tag(estimates[lc10])


collect composite define pse = _r_b _r_se, replace
collect label levels result pse "Class marginal probabilities (SE)", modify
collect style cell result[pse], halign(left) nformat(%4.2f)
collect style column, dups(center)
collect style header colname, level(hide)
collect layout (estimates) (result[k_classes bic] colname#result[pse])

cd "$path3"

collect export lctab.docx, replace

* elbow plot

* ----------------------------
* Elbow plot based on % improvement < 1%
* ----------------------------

* Preserve current dataset
preserve

* Create the dataset for classes 1-10
clear
input class LL BIC AIC
1   -43262.99   86630.81   86549.98
2   -38241.46   76648.92   76520.93
3   -36987.49   74202.12   74026.98
4   -36459.88   73208.07   72985.77
5   -35943.22   72235.89   71966.43
6   -35363.33   71137.27   70820.65
7   -35123.59   70718.95   70355.18
8   -34763.96   70060.84   69649.92
9   -34557.21   69708.50   69250.42
10  -34538.23   69731.69   69226.45
end

* ----------------------------
* Step 1: Calculate first differences (Δ) with intuitive direction
* ----------------------------
gen dBIC = BIC - BIC[_n-1]
gen dAIC = AIC - AIC[_n-1]

* Step 2: Calculate percentage differences
gen dBIC_pct = abs(dBIC) / BIC[_n-1] * 100
gen dAIC_pct = abs(dAIC) / AIC[_n-1] * 100

* ----------------------------
* Step 3: Identify elbow class (first % improvement < 1)
* ----------------------------
gen elbowBIC_flag = dBIC_pct < 1
gen elbowAIC_flag = dAIC_pct < 1

* Find first class where Δ% < 1
* Find the first class where % improvement < 1 for BIC
summarize class if elbowBIC_flag==1, meanonly
local first_elbowBIC = r(min)

gen elbowBIC = .
replace elbowBIC = BIC if class == `first_elbowBIC'

* Do the same for AIC
summarize class if elbowAIC_flag==1, meanonly
local first_elbowAIC = r(min)

gen elbowAIC = .
replace elbowAIC = AIC if class == `first_elbowAIC'


* Optional: List elbow classes
list class BIC dBIC dBIC_pct if elbowBIC_flag==1, noobs
list class AIC dAIC dAIC_pct if elbowAIC_flag==1, noobs

* ----------------------------
* Step 4: Plot BIC, AIC, LL, and elbow
* ----------------------------
twoway (line BIC class, sort lcolor(blue) lwidth(medium)) ///
       (line AIC class, sort lcolor(green) lwidth(medium)) ///
       (line LL class, sort lcolor(red) lwidth(medium) yaxis(2)) ///
       (scatter elbowBIC class if elbowBIC<., mcolor(blue) msymbol(diamond) msize(small)) ///
       (scatter elbowAIC class if elbowAIC<., mcolor(green) msymbol(diamond) msize(small)), ///
       title("Elbow Plot of Fit Indices for Latent Models") ///
       subtitle("Elbow determined where % improvement < 1%", size(small)) ///
       xtitle("Number of Classes") ///
       ytitle("BIC / AIC") ///
       xlabel(1(1)10) ///
       legend(order(1 "BIC" 2 "AIC" 3 "BIC Elbow" 4 "AIC Elbow" 5 "Log-Likelihood")) ///
       note("Data Source: ELSA Wave 10. N=6,286", size(vsmall)) ///
       caption("All models appropriately weighted.", size(vsmall))

* Restore original dataset
restore








gsem (totinc_bu_s_z nettotw_bu_s_z loneliness_z socialisolation_z highbrow_z emerging_z <- ) [pweight = w10xwgt], lclass(A 7)

predict pra*, classposteriorpr

generate class = .

egen maxvar = rowmax(pra1-pra7)

forvalues i = 1/7 {
    replace class = `i' if pra`i' == maxvar
}

tab class

foreach i in 1 2 3 4 5 6 {
    summarize pra`i'
}


list class totinc_bu_s_z nettotw_bu_s_z loneliness_z socialisolation_z highbrow_z in 1/200 if !missing(totinc_bu_s_z, nettotw_bu_s_z, loneliness_z, socialisolation_z, highbrow_z, emerging_z)

tab class
tab class if !missing(totinc_bu_s_z, nettotw_bu_s_z, loneliness_z, socialisolation_z, highbrow_z, emerging_z)


gen orderedclass=class
replace orderedclass=1 if class==4
replace orderedclass=2 if class==3
replace orderedclass=3 if class==2
replace orderedclass=4 if class==6
replace orderedclass=5 if class==5
replace orderedclass=6 if class==1
replace orderedclass=6 if class==1


tab orderedclass

lab def orderedclass 1"Wealth Elite" 2"Income Elite" 3"Established Middle" 4"Culturally Engaged" 5"Traditional Working Class" 6"Precarious Working Class"
lab val orderedclass orderedclass
tab orderedclass

svy: mean totinc_bu_s nettotw_bu_s loneliness socialisolation highbrow emerging 

svy: mean totinc_bu_s nettotw_bu_s loneliness socialisolation highbrow emerging if orderedclass==1 
svy: mean totinc_bu_s nettotw_bu_s loneliness socialisolation highbrow emerging if orderedclass==2

svy: mean totinc_bu_s nettotw_bu_s loneliness socialisolation highbrow emerging if orderedclass==3
svy: mean totinc_bu_s nettotw_bu_s loneliness socialisolation highbrow emerging if orderedclass==4
svy: mean totinc_bu_s nettotw_bu_s loneliness socialisolation highbrow emerging if orderedclass==5

svy: mean totinc_bu_s nettotw_bu_s loneliness socialisolation highbrow emerging if orderedclass==6
svy: mean totinc_bu_s nettotw_bu_s loneliness socialisolation highbrow emerging if orderedclass==7
svy: mean totinc_bu_s nettotw_bu_s loneliness socialisolation highbrow emerging if orderedclass==8

svy: mean totinc_bu_s nettotw_bu_s loneliness socialisolation highbrow emerging if orderedclass==9


tab orderedclass

tab orderedclass if age>=66
tab orderedclass if age>=50 & age<66

tab orderedclass if wpdes==1
tab orderedclass if wpdes!=1


*

gen ethnic=.
replace ethnic=0 if fqethnmr==2
replace ethnic=1 if fqethnmr==1
lab def ethnic 0"Non-White" 1"White"
lab val ethnic ethnic
tab ethnic

tab orderedclass ethnic, row chi2
tab orderedclass ethnic, col 

tab sex
tab orderedclass sex, row chi2

dtable i.ethnic, by(orderedclass) export("Table1a", as(docx) replace)

dtable i.sex, by(orderedclass) export("Table2a", as(docx) replace)

summarize age
summarize age if orderedclass==1
summarize age if orderedclass==2
summarize age if orderedclass==3
summarize age if orderedclass==4
summarize age if orderedclass==5
summarize age if orderedclass==6
summarize age if orderedclass==7


gen degree=.
replace degree=0 if edqual>=2
replace degree=1 if edqual==1

tab orderedclass degree, row chi2

dtable i.degree, by(orderedclass) export("Table3a", as(docx) replace)


*** Legacy NS-SEC construction 
	save "$path2/finalclassmaster.dta", replace

	use "$path1/wave_1_core_data_v3.dta", clear
	keep idauniq anssec enssec 
	
gen nssechsew1=. 
replace nssechsew1=1 if (anssec==2)
replace nssechsew1=2 if (anssec==3.1)
replace nssechsew1=2 if (anssec==3.2)
replace nssechsew1=2 if (anssec==3.3)
replace nssechsew1=3 if (anssec==4.1)
replace nssechsew1=3 if (anssec==4.2)
replace nssechsew1=3 if (anssec==4.3)
replace nssechsew1=3 if (anssec==5)
replace nssechsew1=4 if (anssec==7.1)
replace nssechsew1=4 if (anssec==7.2)
replace nssechsew1=4 if (anssec==7.3)
replace nssechsew1=4 if (anssec==7.4)
replace nssechsew1=5 if (anssec==8.1)
replace nssechsew1=5 if (anssec==9.1)
replace nssechsew1=5 if (anssec==9.2)
replace nssechsew1=6 if (anssec==10)
replace nssechsew1=6 if (anssec==11.1)
replace nssechsew1=6 if (anssec==11.2)
replace nssechsew1=7 if (anssec==12.1)
replace nssechsew1=7 if (anssec==12.2)
replace nssechsew1=7 if (anssec==12.3)
replace nssechsew1=7 if (anssec==12.4)
replace nssechsew1=7 if (anssec==12.5)
replace nssechsew1=7 if (anssec==12.6)
replace nssechsew1=7 if (anssec==12.7)
replace nssechsew1=8 if (anssec==13.1)
replace nssechsew1=8 if (anssec==13.2)
replace nssechsew1=8 if (anssec==13.3)
replace nssechsew1=8 if (anssec==13.4)
replace nssechsew1=8 if (anssec==13.5)

gen nssecelsaw1=. 
replace nssecelsaw1=1 if (enssec==2)
replace nssecelsaw1=2 if (enssec==3.1)
replace nssecelsaw1=2 if (enssec==3.2)
replace nssecelsaw1=2 if (enssec==3.3)
replace nssecelsaw1=3 if (enssec==4.1)
replace nssecelsaw1=3 if (enssec==4.2)
replace nssecelsaw1=3 if (enssec==4.3)
replace nssecelsaw1=3 if (enssec==5)
replace nssecelsaw1=4 if (enssec==7.1)
replace nssecelsaw1=4 if (enssec==7.2)
replace nssecelsaw1=4 if (enssec==7.3)
replace nssecelsaw1=4 if (enssec==7.4)
replace nssecelsaw1=5 if (enssec==8.1)
replace nssecelsaw1=5 if (enssec==9.1)
replace nssecelsaw1=5 if (enssec==9.2)
replace nssecelsaw1=6 if (enssec==10)
replace nssecelsaw1=6 if (enssec==11.1)
replace nssecelsaw1=6 if (enssec==11.2)
replace nssecelsaw1=7 if (enssec==12.1)
replace nssecelsaw1=7 if (enssec==12.2)
replace nssecelsaw1=7 if (enssec==12.3)
replace nssecelsaw1=7 if (enssec==12.4)
replace nssecelsaw1=7 if (enssec==12.5)
replace nssecelsaw1=7 if (enssec==12.6)
replace nssecelsaw1=7 if (enssec==12.7)
replace nssecelsaw1=8 if (enssec==13.1)
replace nssecelsaw1=8 if (enssec==13.2)
replace nssecelsaw1=8 if (enssec==13.3)
replace nssecelsaw1=8 if (enssec==13.4)
replace nssecelsaw1=8 if (enssec==13.5)	

gen nssecw1total=nssechsew1
replace nssecw1total=nssecelsaw1 if nssechsew1==.
	
	gen wave=1

	save "$path2/nssectempfile.dta", replace
	use "$path1/wave_2_core_data_v4.dta", clear
	keep idauniq w2nssec8
	gen wave=2 
	
	append using "$path2/nssectempfile.dta"	
	save "$path2/nssectempfile.dta", replace
	
	use "$path1/wave_3_elsa_data_v4.dta", clear
	keep idauniq w3nssec8
	gen wave=3
	
	append using "$path2/nssectempfile.dta"	
	save "$path2/nssectempfile.dta", replace
	
	use "$path1/wave_4_elsa_data_v3.dta", clear
	keep idauniq w4nssec8
	gen wave=4
	
	append using "$path2/nssectempfile.dta"	
	save "$path2/nssectempfile.dta", replace
	
	use "$path1/wave_5_elsa_data_v4.dta", clear
	keep idauniq w5nssec8
	gen wave=5
	
	append using "$path2/nssectempfile.dta"	
	save "$path2/nssectempfile.dta", replace

	use "$path1/wave_6_elsa_data_v2.dta", clear
	keep idauniq w6nssec8
	gen wave=6
	
	append using "$path2/nssectempfile.dta"	
	save "$path2/nssectempfile.dta", replace	
	
	use "$path1/wave_7_elsa_data.dta", clear
	keep idauniq NSSEC
	
gen nssecw7=. 
replace nssecw7=1 if (NSSEC==2)
replace nssecw7=2 if (NSSEC==3.1)
replace nssecw7=2 if (NSSEC==3.2)
replace nssecw7=2 if (NSSEC==3.3)
replace nssecw7=3 if (NSSEC==4.1)
replace nssecw7=3 if (NSSEC==4.2)
replace nssecw7=3 if (NSSEC==4.3)
replace nssecw7=3 if (NSSEC==5)
replace nssecw7=4 if (NSSEC==7.1)
replace nssecw7=4 if (NSSEC==7.2)
replace nssecw7=4 if (NSSEC==7.3)
replace nssecw7=4 if (NSSEC==7.4)
replace nssecw7=5 if (NSSEC==8.1)
replace nssecw7=5 if (NSSEC==9.1)
replace nssecw7=5 if (NSSEC==9.2)
replace nssecw7=6 if (NSSEC==10)
replace nssecw7=6 if (NSSEC==11.1)
replace nssecw7=6 if (NSSEC==11.2)
replace nssecw7=7 if (NSSEC==12.1)
replace nssecw7=7 if (NSSEC==12.2)
replace nssecw7=7 if (NSSEC==12.3)
replace nssecw7=7 if (NSSEC==12.4)
replace nssecw7=7 if (NSSEC==12.5)
replace nssecw7=7 if (NSSEC==12.6)
replace nssecw7=7 if (NSSEC==12.7)
replace nssecw7=8 if (NSSEC==13.1)
replace nssecw7=8 if (NSSEC==13.2)
replace nssecw7=8 if (NSSEC==13.3)
replace nssecw7=8 if (NSSEC==13.4)
replace nssecw7=8 if (NSSEC==13.5)	
	
	gen wave=7
	
	append using "$path2/nssectempfile.dta"	
	save "$path2/nssectempfile.dta", replace	
	
	use "$path1/wave_8_elsa_data_eul_v2.dta", clear
	keep idauniq w8nssec8
	gen wave=8
	
	append using "$path2/nssectempfile.dta"	
	save "$path2/nssectempfile.dta", replace		
	
	use "$path1/wave_9_elsa_data_eul_v2.dta", clear
	keep idauniq w9nssec8
	gen wave=9
	
	append using "$path2/nssectempfile.dta"	
	save "$path2/nssectempfile.dta", replace	
	
	append using "$path2/finalclassmaster.dta"	
	
*** NS-SEC

gen nssec10 = w10nssec8 if w10nssec8>=1 & w10nssec8<=9
gen nssec9 = w9nssec8 if w9nssec8>=1 & w9nssec8<=9
gen nssec8 = w8nssec8 if w8nssec8>=1 & w8nssec8<=9
gen nssec7 = nssecw7 if nssecw7>=1 & nssecw7<=9
gen nssec6 = w6nssec8 if w6nssec8>=1 & w6nssec8<=9
gen nssec5 = w5nssec8 if w5nssec8>=1 & w5nssec8<=9
gen nssec4 = w4nssec8 if w4nssec8>=1 & w4nssec8<=9
gen nssec3 = w3nssec8 if w3nssec8>=1 & w3nssec8<=9
gen nssec2 = w2nssec8 if w2nssec8>=1 & w2nssec8<=9
gen nssec1 = nssecw1total if nssecw1total>=1 & nssecw1total<=9


gen nssectotal = nssec10 if inrange(nssec10,1,9)
replace nssectotal = nssec9 if missing(nssectotal) & inrange(nssec9,1,9)
replace nssectotal = nssec8 if missing(nssectotal) & inrange(nssec8,1,9)
replace nssectotal = nssec7 if missing(nssectotal) & inrange(nssec7,1,9)
replace nssectotal = nssec6 if missing(nssectotal) & inrange(nssec6,1,9)
replace nssectotal = nssec5 if missing(nssectotal) & inrange(nssec5,1,9)
replace nssectotal = nssec4 if missing(nssectotal) & inrange(nssec4,1,9)
replace nssectotal = nssec3 if missing(nssectotal) & inrange(nssec3,1,9)
replace nssectotal = nssec2 if missing(nssectotal) & inrange(nssec2,1,9)
replace nssectotal = nssec1 if missing(nssectotal) & inrange(nssec1,1,9)



sort idauniq wave 

gen nssectotal_new = nssectotal

bysort idauniq (wave): replace nssectotal_new = nssectotal_new[_n-1] if missing(nssectotal_new)

keep if wave==10
	
duplicates list nssectotal_new idauniq if !missing(nssectotal_new)
	
lab def nssectotal_new 1"1.1" 2"1.2" 3"2" 4"3" 5"4" 6"5" 7"6" 8"7" 9"NiE"
lab val nssectotal_new nssectotal_new

tab nssectotal_new

save "$path2/finalclassmaster.dta", replace
 	
keep if !missing(nssectotal_new, orderedclass)
	
tab orderedclass nssectotal_new, row chi2 V

tab orderedclass nssectotal_new if wpactive==1, row chi2 V

tab orderedclass nssectotal_new if wpactive==0, row chi2 V

tab orderedclass nssectotal_new if wpactive==0 & age>80, row chi2 V



tab orderedclass nssectotal_new if age>=66, row chi2 V

tab orderedclass nssectotal_new if age>=50 & age<66, row chi2 V

tab orderedclass nssectotal_new if w10soc==1, row chi2 V
tab orderedclass nssectotal_new if w10soc==0, row chi2 V

	
dtable i.nssectotal_new, by(orderedclass) export("Table3a", as(docx) replace)

dtable i.sex, by(nssectotal_new) export("Table1b", as(docx) replace)

dtable i.ethnic, by(nssectotal_new) export("Table2b", as(docx) replace)

dtable i.degree, by(nssectotal_new) export("Table3b", as(docx) replace)



tab nssectotal_new orderedclass

tab orderedclass nssectotal_new, row V chi2


* Models 
lab var age "Age"
lab var sex "Sex"
lab def sex_lbl 1"Male" 2"Female"
lab val sex sex_lbl 
lab var ethnic "Ethnicity"
lab var nssectotal_new "Legacy NS-SEC"
lab var orderedclass "CAR"



gen polparty=.
replace polparty=0 if scorgpo==0
replace polparty=1 if scorgpo==1

svy: logit polparty ib7.nssectotal_new i.ethnic i.sex c.age, baselevels

svy: logit polparty i.orderedclass i.ethnic i.sex c.age, baselevels



gen lifesat=scovsa
replace lifesat=. if scovsa<0
replace lifesat=. if scovsa>10

svy: regress lifesat ib6.nssectotal_new i.ethnic i.sex c.age, baselevels

svy: regress lifesat i.orderedclass i.ethnic i.sex c.age, baselevels


* CASP-19 summary score 

foreach x in a b c d e f g h i j k l m n o p q r s {
    replace scqol`x' = . if scqol`x' <= 0
}
 
 * D is removed because it is manifest indicator in CAR measure 
gen casptotals=scqola+scqolb+scqolc+scqole+scqolf+scqolg+scqolh+scqoli+scqolj+scqolk+scqoll+scqolm+scqoln+scqolo+scqolp+scqolq+scqolr+scqols

svy: regress casptotals ib7.nssectotal_new i.ethnic i.sex c.age, baselevels
etable
est store NSSEC  


svy: regress casptotals i.orderedclass i.ethnic i.sex c.age, baselevels
etable, append
est store CAR 

svy: regress casptotals ib7.nssectotal_new ib5.orderedclass i.ethnic i.sex c.age, baselevels

collect style showbase all

collect label levels etable_depvar 1 "NS-SEC" ///
										2 "CAR" , modify

collect style cell, font(Book Antiqua)

etable, replay column(depvar) ///
cstat(_r_b, nformat(%4.2f))  ///
		cstat(_r_se, nformat(%6.2f))  ///
		showstars showstarsnote  ///
		stars(.05 "*" .01 "**" .001 "***", attach(_r_b)) ///
		mstat(N) mstat(r2)	///
		title("Table XXXX: Regression Models of CASP-19") ///
		titlestyles(font(Arial Narrow, size(14) bold)) ///
		note("Data Source: ELSA Wave 10. N=4,824") ///
		notestyles(font(Book Antiqua, size(8) italic)) ///
		export("ELSACLASSREG.docx", replace)
		
		
coefplot NSSEC (CAR), ///
	drop(_cons) ///
	baselevels ///
    vertical ///
    yline(0, lcolor(black) lpattern(dash)) ///
	keep(1.nssectotal_new 2.nssectotal_new 3.nssectotal_new 4.nssectotal_new 5.nssectotal_new ///
	6.nssectotal_new 7.nssectotal_new 8.nssectotal_new ///
	1.orderedclass 2.orderedclass 3.orderedclass 4.orderedclass 5.orderedclass 6.orderedclass ///
	7.orderedclass) ///
	groups( ///
	1.nssectotal_new 2.nssectotal_new 3.nssectotal_new 4.nssectotal_new 5.nssectotal_new ///
	6.nssectotal_new 7.nssectotal_new 8.nssectotal_new = "NS-SEC" ///
	1.orderedclass 2.orderedclass 3.orderedclass 4.orderedclass 5.orderedclass 6.orderedclass ///
	7.orderedclass = "CAR", labsize(small)) ///
    ylab(, valuelabel labsize(tiny)) ///   
    xlabel(, labsize(tiny) angle(45)) /// 
	subtitle("Comparison of Social Class Measures", size(vsmall)) ///
    legend(order(2 "NS-SEC" 4 "CAR") pos(2) ring(0) cols(1) size(vsmall)) ///
	title("Coefficient Plot of Social Status (Ladder)", size(small)) ///
	note("Data Source: ELSA Wave 10. N=3,550", size(tiny)) ///
	caption("Adjusted for Complex Survey Design.", size(tiny)) ///
	name(coefplotstatusconly, replace)
	graph save "$path3/coefplotstatusconly.gph", replace
	graph export "$path3/coefplotstatusconly.png", replace	
			
		
		


gen status=sclddr
replace status=. if status<10

collect clear

svy: regress status ib7.nssectotal_new i.ethnic i.sex c.age, baselevels
etable 
est store NSSEC  
qv ib7.nssectotal_new, level(95) plot

svy: regress status ib5.orderedclass i.ethnic i.sex c.age, baselevels
etable, append
est store CAR 
qv ib7.orderedclass, level(95) plot

svy: regress status ib7.nssectotal_new ib5.orderedclass i.ethnic i.sex c.age, baselevels



collect style showbase all

collect label levels etable_depvar 1 "NS-SEC" ///
										2 "CAR" , modify

collect style cell, font(Book Antiqua)

etable, replay column(depvar) ///
cstat(_r_b, nformat(%4.2f))  ///
		cstat(_r_se, nformat(%6.2f))  ///
		showstars showstarsnote  ///
		stars(.05 "*" .01 "**" .001 "***", attach(_r_b)) ///
		mstat(N) mstat(r2)	///
		title("Table XXXX: Regression Models of Subjective Status (Ladder)") ///
		titlestyles(font(Arial Narrow, size(14) bold)) ///
		note("Data Source: ELSA Wave 10. N=3,550") ///
		notestyles(font(Book Antiqua, size(8) italic)) ///
		export("ELSACLASSREG.docx", replace)


coefplot NSSEC (CAR), ///
	drop(_cons) ///
	baselevels ///
    horizontal ///
    ylab(, labsize(vsmall)) ///
    xline(0, lcolor(black) lpattern(dash)) ///
	keep(age ///
	1.sex 2.sex ///
	0.ethnic 1.ethnic ///
	1.nssectotal_new 2.nssectotal_new 3.nssectotal_new 4.nssectotal_new 5.nssectotal_new ///
	6.nssectotal_new 7.nssectotal_new 8.nssectotal_new ///
	1.orderedclass 2.orderedclass 3.orderedclass 4.orderedclass 5.orderedclass 6.orderedclass ///
	7.orderedclass 8.orderedclass 9.orderedclass) ///
	groups( ///
	age = "Age" ///
	1.sex 2.sex = "Sex" ///
	0.ethnic 1.ethnic = "Ethnicity" ///
	1.nssectotal_new 2.nssectotal_new 3.nssectotal_new 4.nssectotal_new 5.nssectotal_new ///
	6.nssectotal_new 7.nssectotal_new 8.nssectotal_new = "NS-SEC" ///
	1.orderedclass 2.orderedclass 3.orderedclass 4.orderedclass 5.orderedclass 6.orderedclass ///
	7.orderedclass 8.orderedclass 9.orderedclass = "CAR", labsize(small)) ///
    ylab(, valuelabel labsize(vsmall)) ///   
    xlabel(, labsize(vsmall)) /// 
	subtitle("Comparison of Social Class Measures", size(vsmall)) ///
    legend(order(2 "NS-SEC" 4 "CAR") pos(3) ring(0) cols(1) size(vsmall)) ///
	title("Coefficient Plot of Social Status (Ladder)", size(small)) ///
	note("Data Source: ELSA Wave 10. N=3,550", size(tiny)) ///
	caption("Adjusted for Complex Survey Design.", size(tiny)) ///
	name(coefplotstatus, replace)
	graph save "$path3/coefplotstatus.gph", replace
	graph export "$path3/coefplotstatus.png", replace

coefplot NSSEC (CAR), ///
	drop(_cons) ///
	baselevels ///
    vertical ///
    yline(0, lcolor(black) lpattern(dash)) ///
	keep(1.nssectotal_new 2.nssectotal_new 3.nssectotal_new 4.nssectotal_new 5.nssectotal_new ///
	6.nssectotal_new 7.nssectotal_new 8.nssectotal_new ///
	1.orderedclass 2.orderedclass 3.orderedclass 4.orderedclass 5.orderedclass 6.orderedclass ///
	7.orderedclass 8.orderedclass 9.orderedclass) ///
	groups( ///
	1.nssectotal_new 2.nssectotal_new 3.nssectotal_new 4.nssectotal_new 5.nssectotal_new ///
	6.nssectotal_new 7.nssectotal_new 8.nssectotal_new = "NS-SEC" ///
	1.orderedclass 2.orderedclass 3.orderedclass 4.orderedclass 5.orderedclass 6.orderedclass ///
	7.orderedclass 8.orderedclass 9.orderedclass = "CAR", labsize(small)) ///
    ylab(, valuelabel labsize(tiny)) ///   
    xlabel(, labsize(tiny) angle(45)) /// 
	subtitle("Comparison of Social Class Measures", size(vsmall)) ///
    legend(order(2 "NS-SEC" 4 "CAR") pos(2) ring(0) cols(1) size(vsmall)) ///
	title("Coefficient Plot of Social Status (Ladder)", size(small)) ///
	note("Data Source: ELSA Wave 10. N=3,550", size(tiny)) ///
	caption("Adjusted for Complex Survey Design.", size(tiny)) ///
	name(coefplotstatusconly, replace)
	graph save "$path3/coefplotstatusconly.gph", replace
	graph export "$path3/coefplotstatusconly.png", replace	
	
		
gen depression=cesd_sc
replace depression=. if depression<1
collect clear

svy: regress depression ib7.nssectotal_new i.ethnic i.sex c.age 
etable
est store NSSEC

svy: regress depression ib5.orderedclass i.ethnic i.sex c.age 
etable, append
est store CAR

collect style showbase all

collect label levels etable_depvar 1 "NS-SEC" ///
										2 "CAR" , modify

collect style cell, font(Book Antiqua)

etable, replay column(depvar) ///
cstat(_r_b, nformat(%4.2f))  ///
		cstat(_r_se, nformat(%6.2f))  ///
		showstars showstarsnote  ///
		stars(.05 "*" .01 "**" .001 "***", attach(_r_b)) ///
		mstat(N) mstat(r2)	///
		title("Table XXXX: Regression Models of CES-D Depression") ///
		titlestyles(font(Arial Narrow, size(14) bold)) ///
		note("Data Source: ELSA Wave 10. N=2,452") ///
		notestyles(font(Book Antiqua, size(8) italic)) ///
		export("ELSACLASSREG2.docx", replace)


coefplot NSSEC (CAR), ///
	drop(_cons) ///
	baselevels ///
    horizontal ///
    ylab(, labsize(vsmall)) ///
    xline(0, lcolor(black) lpattern(dash)) ///
	keep(age ///
	1.sex 2.sex ///
	0.ethnic 1.ethnic ///
	1.nssectotal_new 2.nssectotal_new 3.nssectotal_new 4.nssectotal_new 5.nssectotal_new ///
	6.nssectotal_new 7.nssectotal_new 8.nssectotal_new ///
	1.orderedclass 2.orderedclass 3.orderedclass 4.orderedclass 5.orderedclass 6.orderedclass ///
	7.orderedclass 8.orderedclass 9.orderedclass) ///
	groups( ///
	age = "Age" ///
	1.sex 2.sex = "Sex" ///
	0.ethnic 1.ethnic = "Ethnicity" ///
	1.nssectotal_new 2.nssectotal_new 3.nssectotal_new 4.nssectotal_new 5.nssectotal_new ///
	6.nssectotal_new 7.nssectotal_new 8.nssectotal_new = "NS-SEC" ///
	1.orderedclass 2.orderedclass 3.orderedclass 4.orderedclass 5.orderedclass 6.orderedclass ///
	7.orderedclass 8.orderedclass 9.orderedclass = "CAR", labsize(small)) ///
    ylab(, valuelabel labsize(vsmall)) ///   
    xlabel(, labsize(vsmall)) /// 
	subtitle("Comparison of Social Class Measures", size(vsmall)) ///
    legend(order(2 "NS-SEC" 4 "CAR") pos(3) ring(0) cols(1) size(vsmall)) ///
	title("Coefficient Plot of CES-D Depression", size(small)) ///
	note("Data Source: ELSA Wave 10. N=2,452", size(tiny)) ///
	caption("Adjusted for Complex Survey Design.", size(tiny)) ///
	name(coefplotdep, replace)
	graph save "$path3/coefplotdep.gph", replace
	graph export "$path3/coefplotdep.png", replace		
	
	
	
coefplot NSSEC (CAR), ///
	drop(_cons) ///
	baselevels ///
    vertical ///
    yline(0, lcolor(black) lpattern(dash)) ///
	keep(1.nssectotal_new 2.nssectotal_new 3.nssectotal_new 4.nssectotal_new 5.nssectotal_new ///
	6.nssectotal_new 7.nssectotal_new 8.nssectotal_new ///
	1.orderedclass 2.orderedclass 3.orderedclass 4.orderedclass 5.orderedclass 6.orderedclass ///
	7.orderedclass 8.orderedclass 9.orderedclass) ///
	groups( ///
	1.nssectotal_new 2.nssectotal_new 3.nssectotal_new 4.nssectotal_new 5.nssectotal_new ///
	6.nssectotal_new 7.nssectotal_new 8.nssectotal_new = "NS-SEC" ///
	1.orderedclass 2.orderedclass 3.orderedclass 4.orderedclass 5.orderedclass 6.orderedclass ///
	7.orderedclass 8.orderedclass 9.orderedclass = "CAR", labsize(small)) ///
    ylab(, valuelabel labsize(tiny)) ///   
    xlabel(, labsize(tiny) angle(45)) /// 
	subtitle("Comparison of Social Class Measures", size(vsmall)) ///
    legend(order(2 "NS-SEC" 4 "CAR") pos(4) ring(0) cols(1) size(vsmall)) ///
	title("Coefficient Plot of CES-D Depression", size(small)) ///
	note("Data Source: ELSA Wave 10. N=2,452", size(tiny)) ///
	caption("Adjusted for Complex Survey Design.", size(tiny)) ///
	name(coefplotdeponly, replace)
	graph save "$path3/coefplotdeponly.gph", replace
	graph export "$path3/coefplotdeponly.png", replace		
	
	*
	
