
clear



*** ENDOGAMY -- SOCIAL INTERCOURSE ***


use"G:\Stata data and do\BHPS + US\UKDA-6614-stata\stata\stata13_se\bhps_w10\bj_indresp"

gen age=.
replace age = bj_age if bj_age>=20 & bj_age<=65

keep if !missing(age)

tab bj_jbsoc90_cc

gen jobsoc=bj_jbsoc90_cc

replace jobsoc=. if jobsoc<10

tab jobsoc

tab bj_spsoc90_cc

gen partnersoc=bj_spsoc90_cc

replace partnersoc=. if partnersoc<10


gen jobfinal=. 
replace jobfinal=1 if (jobsoc==10 | jobsoc==13 | jobsoc==15)
replace jobfinal=2 if (jobsoc==11 | jobsoc==14 | jobsoc==16)
replace jobfinal=3 if (jobsoc==12)
replace jobfinal=4 if (jobsoc==17)
replace jobfinal=5 if (jobsoc==19)
replace jobfinal=6 if (jobsoc==20 | jobsoc==21)
replace jobfinal=7 if (jobsoc==22 | jobsoc==24 | jobsoc==25 | jobsoc==26 | jobsoc==27 | jobsoc==29)
replace jobfinal=8 if (jobsoc==23)
replace jobfinal=9 if (jobsoc==30 | jobsoc==31 | jobsoc==32 | jobsoc==33 | jobsoc==39)
replace jobfinal=10 if (jobsoc==34 | jobsoc==37)
replace jobfinal=11 if (jobsoc==35 | jobsoc==36 | jobsoc==38)
replace jobfinal=12 if (jobsoc==40)
replace jobfinal=13 if (jobsoc==41)
replace jobfinal=14 if (jobsoc==42)
replace jobfinal=15 if (jobsoc==43)
replace jobfinal=16 if (jobsoc==44 | jobsoc==49)
replace jobfinal=17 if (jobsoc==45 | jobsoc==46)
replace jobfinal=18 if (jobsoc==50 | jobsoc==52)
replace jobfinal=19 if (jobsoc==51 | jobsoc==53 | jobsoc==54)
replace jobfinal=20 if (jobsoc==55 | jobsoc==56 | jobsoc==58 | jobsoc==59)
replace jobfinal=21 if (jobsoc==60 | jobsoc==61)
replace jobfinal=22 if (jobsoc==62)
replace jobfinal=23 if (jobsoc==63 | jobsoc==66 | jobsoc==67 | jobsoc==69)
replace jobfinal=24 if (jobsoc==64)
replace jobfinal=25 if (jobsoc==65)
replace jobfinal=26 if (jobsoc==70 | jobsoc==71)
replace jobfinal=27 if (jobsoc==72 | jobsoc==73 | jobsoc==79)
replace jobfinal=28 if (jobsoc==80 | jobsoc==81 | jobsoc==82 | jobsoc==83 | jobsoc==84 | jobsoc==85 | jobsoc==86 | jobsoc==89)
replace jobfinal=29 if (jobsoc==87 | jobsoc==88)
replace jobfinal=30 if (jobsoc==90 | jobsoc==91 | jobsoc==92 | jobsoc==93 | jobsoc==99)
replace jobfinal=31 if (jobsoc==94 | jobsoc==95)


label define soc_lbl 1"GMA" 2"PDM" 3"SM" 4"MPS" 5"OMO" 6"SET" 7"HP" 8"TPE" 9"API" 10"APH" 11"APB" 12"AOA" 13"NCC" 14"FRC" 15"OCW" 16"SDC" 17"SEC" 18"SMC" 19"SMM" 20"SMO" 21"PSP" 22"CW" 23"PSW" 24"HW" 25"CCW" 26"BSR" 27"SW" 28"PMO" 29"TO" 30"GL" 31"RWS"
label values jobfinal soc_lbl 

gen partnerfinal=. 
replace partnerfinal=1 if (partnersoc==10 | partnersoc==13 | partnersoc==15)
replace partnerfinal=2 if (partnersoc==11 | partnersoc==14 | partnersoc==16)
replace partnerfinal=3 if (partnersoc==12)
replace partnerfinal=4 if (partnersoc==17)
replace partnerfinal=5 if (partnersoc==19)
replace partnerfinal=6 if (partnersoc==20 | partnersoc==21)
replace partnerfinal=7 if (partnersoc==22 | partnersoc==24 | partnersoc==25 | partnersoc==26 | partnersoc==27 | partnersoc==29)
replace partnerfinal=8 if (partnersoc==23)
replace partnerfinal=9 if (partnersoc==30 | partnersoc==31 | partnersoc==32 | partnersoc==33 | partnersoc==39)
replace partnerfinal=10 if (partnersoc==34 | partnersoc==37)
replace partnerfinal=11 if (partnersoc==35 | partnersoc==36 | partnersoc==38)
replace partnerfinal=12 if (partnersoc==40)
replace partnerfinal=13 if (partnersoc==41)
replace partnerfinal=14 if (partnersoc==42)
replace partnerfinal=15 if (partnersoc==43)
replace partnerfinal=16 if (partnersoc==44 | partnersoc==49)
replace partnerfinal=17 if (partnersoc==45 | partnersoc==46)
replace partnerfinal=18 if (partnersoc==50 | partnersoc==52)
replace partnerfinal=19 if (partnersoc==51 | partnersoc==53 | partnersoc==54)
replace partnerfinal=20 if (partnersoc==55 | partnersoc==56 | partnersoc==58 | partnersoc==59)
replace partnerfinal=21 if (partnersoc==60 | partnersoc==61)
replace partnerfinal=22 if (partnersoc==62)
replace partnerfinal=23 if (partnersoc==63 | partnersoc==66 | partnersoc==67 | partnersoc==69)
replace partnerfinal=24 if (partnersoc==64)
replace partnerfinal=25 if (partnersoc==65)
replace partnerfinal=26 if (partnersoc==70 | partnersoc==71)
replace partnerfinal=27 if (partnersoc==72 | partnersoc==73 | partnersoc==79)
replace partnerfinal=28 if (partnersoc==80 | partnersoc==81 | partnersoc==82 | partnersoc==83 | partnersoc==84 | partnersoc==85 | partnersoc==86 | partnersoc==89)
replace partnerfinal=29 if (partnersoc==87 | partnersoc==88)
replace partnerfinal=30 if (partnersoc==90 | partnersoc==91 | partnersoc==92 | partnersoc==93 | partnersoc==99)
replace partnerfinal=31 if (partnersoc==94 | partnersoc==95)
label values partnerfinal soc_lbl 


tab jobfinal partnerfinal 

keep if !missing(jobfinal, partnerfinal)

tabulate jobfinal partnerfinal, row matcell(rowpct) matrow(names)

** insert here the proportion of homogamy for 31 occupational groupings, then standardise... test this agains the MDS approach and assess

cd"G:\Stata data and do\do files\Status"


infile GMA PDM SM MPS OMO SET HP TPE API APH APB AOA NCC FRC OCW SDC SEC SMC SMM SMO PSP CW PSW HW CCW BSR SW PMO TO GL RWS using "fullocctextprop.txt", clear

matrix dissimilarity D = GMA PDM SM MPS OMO SET HP TPE API APH APB AOA NCC FRC OCW SDC SEC SMC SMM SMO PSP CW PSW HW CCW BSR SW PMO TO GL RWS, variables 

mat list D

matrix D = 0.01 * D
mat list D


mdsmat D, dimensions(3)

estat config
estat stress

mdsconfig, dimensions(2 1)
mdsconfig, dimensions(3 1)
mdsconfig, dimensions(3 2)


screeplot
estat config



***

clear

use"G:\Stata data and do\BHPS + US\UKDA-6614-stata\stata\stata13_se\bhps_w10\bj_indresp"

gen age=.
replace age = bj_age if bj_age>=20 & bj_age<=65

keep if !missing(age)

gen cambridge=. 
replace cambridge=bj_jbcssm if  bj_sex==1 & bj_jbcssm>=0
replace cambridge=bj_jbcssf if  bj_sex==2 & bj_jbcssf>=0


tab bj_jbsoc90_cc

gen jobsoc=bj_jbsoc90_cc

replace jobsoc=. if jobsoc<10

tab jobsoc

gen jobfinal=. 
replace jobfinal=1 if (jobsoc==10 | jobsoc==13 | jobsoc==15)
replace jobfinal=2 if (jobsoc==11 | jobsoc==14 | jobsoc==16)
replace jobfinal=3 if (jobsoc==12)
replace jobfinal=4 if (jobsoc==17)
replace jobfinal=5 if (jobsoc==19)
replace jobfinal=6 if (jobsoc==20 | jobsoc==21)
replace jobfinal=7 if (jobsoc==22 | jobsoc==24 | jobsoc==25 | jobsoc==26 | jobsoc==27 | jobsoc==29)
replace jobfinal=8 if (jobsoc==23)
replace jobfinal=9 if (jobsoc==30 | jobsoc==31 | jobsoc==32 | jobsoc==33 | jobsoc==39)
replace jobfinal=10 if (jobsoc==34 | jobsoc==37)
replace jobfinal=11 if (jobsoc==35 | jobsoc==36 | jobsoc==38)
replace jobfinal=12 if (jobsoc==40)
replace jobfinal=13 if (jobsoc==41)
replace jobfinal=14 if (jobsoc==42)
replace jobfinal=15 if (jobsoc==43)
replace jobfinal=16 if (jobsoc==44 | jobsoc==49)
replace jobfinal=17 if (jobsoc==45 | jobsoc==46)
replace jobfinal=18 if (jobsoc==50 | jobsoc==52)
replace jobfinal=19 if (jobsoc==51 | jobsoc==53 | jobsoc==54)
replace jobfinal=20 if (jobsoc==55 | jobsoc==56 | jobsoc==58 | jobsoc==59)
replace jobfinal=21 if (jobsoc==60 | jobsoc==61)
replace jobfinal=22 if (jobsoc==62)
replace jobfinal=23 if (jobsoc==63 | jobsoc==66 | jobsoc==67 | jobsoc==69)
replace jobfinal=24 if (jobsoc==64)
replace jobfinal=25 if (jobsoc==65)
replace jobfinal=26 if (jobsoc==70 | jobsoc==71)
replace jobfinal=27 if (jobsoc==72 | jobsoc==73 | jobsoc==79)
replace jobfinal=28 if (jobsoc==80 | jobsoc==81 | jobsoc==82 | jobsoc==83 | jobsoc==84 | jobsoc==85 | jobsoc==86 | jobsoc==89)
replace jobfinal=29 if (jobsoc==87 | jobsoc==88)
replace jobfinal=30 if (jobsoc==90 | jobsoc==91 | jobsoc==92 | jobsoc==93 | jobsoc==99)
replace jobfinal=31 if (jobsoc==94 | jobsoc==95)


label define soc_lbl 1"GMA" 2"PDM" 3"SM" 4"MPS" 5"OMO" 6"SET" 7"HP" 8"TPE" 9"API" 10"APH" 11"APB" 12"AOA" 13"NCC" 14"FRC" 15"OCW" 16"SDC" 17"SEC" 18"SMC" 19"SMM" 20"SMO" 21"PSP" 22"CW" 23"PSW" 24"HW" 25"CCW" 26"BSR" 27"SW" 28"PMO" 29"TO" 30"GL" 31"RWS"
label values jobfinal soc_lbl 

gen status=. 
replace status=0.0672 if(jobfinal==1)
replace status=-0.0249 if(jobfinal==2)
replace status=0.0649 if(jobfinal==3)
replace status=-0.0250 if(jobfinal==4)
replace status=0.0436 if(jobfinal==5)
replace status=0.0310 if(jobfinal==6)
replace status=0.0802 if(jobfinal==7)
replace status=0.2356  if(jobfinal==8)
replace status=0.0316 if(jobfinal==9)
replace status=0.0841 if(jobfinal==10)
replace status=0.1143 if(jobfinal==11)
replace status=0.0066 if(jobfinal==12)
replace status=0.0403 if(jobfinal==13)
replace status=0.0258 if(jobfinal==14)
replace status=0.0167 if(jobfinal==15)
replace status=-0.0415 if(jobfinal==16)
replace status=0.0500 if(jobfinal==17)
replace status=-0.1088 if(jobfinal==18)
replace status=-0.1427 if(jobfinal==19)
replace status=-0.0845 if(jobfinal==20)
replace status=0.0243 if(jobfinal==21)
replace status=-0.0084 if(jobfinal==22)
replace status=0.0021 if(jobfinal==23)
replace status=-0.0223 if(jobfinal==24)
replace status=0.0308 if(jobfinal==25)
replace status=0.0381 if(jobfinal==26)
replace status=-0.0586 if(jobfinal==27)
replace status=-0.2110 if(jobfinal==28)
replace status=-0.1054 if(jobfinal==29)
replace status=-0.0533 if(jobfinal==30)
replace status=-0.1009 if(jobfinal==31)

label values status soc_lbl

gen chanstat=.
replace chanstat=0.4114 if(jobfinal==1)
replace chanstat=-0.0625 if(jobfinal==2)
replace chanstat=0.5107 if(jobfinal==3)
replace chanstat=-0.0453 if(jobfinal==4)
replace chanstat=0.2355 if(jobfinal==5)
replace chanstat=0.3115 if(jobfinal==6)
replace chanstat=0.5643 if(jobfinal==7)
replace chanstat=0.5017  if(jobfinal==8)
replace chanstat=0.3116 if(jobfinal==9)
replace chanstat=0.2228 if(jobfinal==10)
replace chanstat=0.5337 if(jobfinal==11)
replace chanstat=0.2274 if(jobfinal==12)
replace chanstat=0.2238 if(jobfinal==13)
replace chanstat=0.2559 if(jobfinal==14)
replace chanstat=0.1443 if(jobfinal==15)
replace chanstat=-0.3353 if(jobfinal==16)
replace chanstat=0.1539 if(jobfinal==17)
replace chanstat=-0.5014 if(jobfinal==18)
replace chanstat=-0.5121 if(jobfinal==19)
replace chanstat=-0.4072 if(jobfinal==20)
replace chanstat=0.2288 if(jobfinal==21)
replace chanstat=-0.3261 if(jobfinal==22)
replace chanstat=0.2261 if(jobfinal==23)
replace chanstat=-0.2121 if(jobfinal==24)
replace chanstat=0.1097 if(jobfinal==25)
replace chanstat=0.1193 if(jobfinal==26)
replace chanstat=-0.1151 if(jobfinal==27)
replace chanstat=-0.5589 if(jobfinal==28)
replace chanstat=-0.4114 if(jobfinal==29)
replace chanstat=-0.5979 if(jobfinal==30)
replace chanstat=-0.2974 if(jobfinal==31)

label values chanstat soc_lbl


* Standardize the 'status' variable
egen mean_status= mean(status)
egen sd_status = sd(status)
gen status_z = (status - mean_status) / sd_status

egen mean_chanstat= mean(chanstat)
egen sd_chanstat = sd(chanstat)
gen chanstat_z = (chanstat - mean_chanstat) / sd_chanstat

egen mean_cambridge= mean(cambridge)
egen sd_cambridge = sd(cambridge)
gen cambridge_z = (cambridge - mean_cambridge) / sd_cambridge



gen yearlyincome= bj_fiyrl

replace yearlyincome=. if (yearlyincome<0)

gen zincome = (yearlyincome-8568.461)/11492.03
sum zincome 

egen median_income = median(yearlyincome), by(jobfinal)
replace median_income =. if(median_income<0)

* Generate a scatterplot of median income by social status with labels
scatter median_income status, mlabel(jobfinal) ///
    ytitle("Median Income") xtitle("Social Status") ///
    title("Scatterplot of Median Income by Social Status") ///
    legend(off) ///
    || lfit median_income status
	
scatter median_income chanstat, mlabel(jobfinal) ///
    ytitle("Median Income") xtitle("Social Status") ///
    title("Scatterplot of Median Income by Social Status") ///
    legend(off) ///
    || lfit median_income chanstat


corr median_income status chanstat cambridge


gen nssec= bj_jbnssec8_dv
replace nssec=. if(nssec<0)

mean status_z, over(nssec)

mean chanstat_z, over(nssec)

mean cambridge_z, over(nssec)


graph box status, over(nssec)



*** WITHIN GROUP ***

tab bj_netph_1

gen bf1=.
replace bf1=1 if bj_netph_1==4
replace bf1=2 if bj_netph_1==3
replace bf1=3 if bj_netph_1==2
replace bf1=4 if bj_netph_1==1

gen bf2=.
replace bf2=1 if bj_netph_2==4
replace bf2=2 if bj_netph_2==3
replace bf2=3 if bj_netph_2==2
replace bf2=4 if bj_netph_2==1

gen bf3=.
replace bf3=1 if bj_netph_3==4
replace bf3=2 if bj_netph_3==3
replace bf3=3 if bj_netph_3==2
replace bf3=4 if bj_netph_3==1


gen closeness= bf1+bf2+bf3

* Standardize the 'closeness' variable
egen mean_closeness = mean(closeness)
egen sd_closeness = sd(closeness)
gen closeness_z = (closeness - mean_closeness) / sd_closeness

summarize closeness_z 


*** CULTURAL PRACTICES ***
gen sport=.
replace sport=0 if bj_lacta==5
replace sport=1 if bj_lacta==4
replace sport=2 if bj_lacta==3
replace sport=3 if bj_lacta==2
replace sport=4 if bj_lacta==1

gen wsport=.
replace wsport=0 if bj_lactb==5
replace wsport=1 if bj_lactb==4
replace wsport=2 if bj_lactb==3
replace wsport=3 if bj_lactb==2
replace wsport=4 if bj_lactb==1

gen cinema=.
replace cinema=0 if bj_lactc==5
replace cinema=1 if bj_lactc==4
replace cinema=2 if bj_lactc==3
replace cinema=3 if bj_lactc==2
replace cinema=4 if bj_lactc==1	
	
gen theatre=.
replace theatre=0 if bj_lactd==5
replace theatre=1 if bj_lactd==4
replace theatre=2 if bj_lactd==3
replace theatre=3 if bj_lactd==2
replace theatre=4 if bj_lactd==1	
	
gen eatout=.
replace eatout=0 if bj_lacte==5
replace eatout=1 if bj_lacte==4
replace eatout=2 if bj_lacte==3
replace eatout=3 if bj_lacte==2
replace eatout=4 if bj_lacte==1	

gen drink=.
replace drink=0 if bj_lactf==5
replace drink=1 if bj_lactf==4
replace drink=2 if bj_lactf==3
replace drink=3 if bj_lactf==2
replace drink=4 if bj_lactf==1	

gen garden=.
replace garden=0 if bj_lacth==5
replace garden=1 if bj_lacth==4
replace garden=2 if bj_lacth==3
replace garden=3 if bj_lacth==2
replace garden=4 if bj_lacth==1

gen diy=.
replace diy=0 if bj_lacti==5
replace diy=1 if bj_lacti==4
replace diy=2 if bj_lacti==3
replace diy=3 if bj_lacti==2
replace diy=4 if bj_lacti==1

gen eclass=.
replace eclass=0 if bj_lactj==5
replace eclass=1 if bj_lactj==4
replace eclass=2 if bj_lactj==3
replace eclass=3 if bj_lactj==2
replace eclass=4 if bj_lactj==1

gen lgroup=.
replace lgroup=0 if bj_lactk==5
replace lgroup=1 if bj_lactk==4
replace lgroup=2 if bj_lactk==3
replace lgroup=3 if bj_lactk==2
replace lgroup=4 if bj_lactk==1

gen vol=.
replace vol=0 if bj_lactl==5
replace vol=1 if bj_lactl==4
replace vol=2 if bj_lactl==3
replace vol=3 if bj_lactl==2
replace vol=4 if bj_lactl==1


gen emerging= wsport+cinema+drink+diy

gen highbrow= sport+theatre+eatout+garden+eclass+lgroup+vol

summarize emerging highbrow


* Standardize the 'emerging' variable
egen mean_emerging = mean(emerging)
egen sd_emerging = sd(emerging)
gen emerging_z = (emerging - mean_emerging) / sd_emerging

* Standardize the 'highbrow' variable
egen mean_highbrow = mean(highbrow)
egen sd_highbrow = sd(highbrow)
gen highbrow_z = (highbrow - mean_highbrow) / sd_highbrow

summarize emerging_z highbrow_z


*** MONOPOLOISTIC AQUISITION ***

tab bj_qfedhi


gen degree=. 
replace degree=0 if bj_qfedhi>=6 &bj_qfedhi<=12
replace degree=1 if bj_qfedhi>=1 &bj_qfedhi<=5
tab degree

gen nonbenifit=. 
replace nonbenifit=1 if bj_jbub==2
replace nonbenifit=0 if bj_jbub==1
tab nonbenifit

gen salary=.
replace salary=0 if bj_paytyp_bh==3
replace salary=0 if bj_paytyp_bh==4
replace salary=1 if bj_paytyp_bh==1
replace salary=1 if bj_paytyp_bh==2
replace salary=1 if bj_mrjsemp==2
tab salary

gen nonmanual=.
replace nonmanual=1 if (jobfinal>=1 & jobfinal <=17)
replace nonmanual=0 if (jobfinal>=18 & jobfinal <=31)
tab nonmanual

gen mono= degree+nonbenifit+salary+nonmanual 

* Standardize the 'highbrow' variable
egen mean_mono = mean(mono)
egen sd_mono = sd(mono)
gen mono_z = (mono - mean_mono) / sd_mono

summarize mono_z 


*** FACTOR ANALYSIS ***

factor status_z closeness_z emerging_z highbrow_z mono_z, pcf

rotate

predict factor1 factor2

corr factor1 status_z chanstat_z cambridge_z median_income

screeplot

sort factor1 

list factor1 status_z chanstat_z cambridge_z nssec closeness_z emerging_z highbrow_z mono_z  

hist factor1

mean factor1, over(jobfinal)

bysort jobfinal: egen mean_factor1 = mean(factor1)

tabstat mean_factor1, by(jobfinal) statistics(mean) format(%9.2f)

* Regressions will need a standardised measure... 

egen mean_factor1_b = mean(mean_factor1)
egen sd_factor1 = sd(mean_factor1)
gen factor1_z = (mean_factor1 - mean_factor1_b) / sd_factor1


keep if !missing(chanstat_z, factor1_z, cambridge_z)

corr median_income factor1 
corr median_income factor1 if bj_sex==1
corr median_income factor1 if bj_sex==2

ktau factor1 degree 
ktau factor1 degree if bj_sex==1
ktau factor1 degree if bj_sex==2


twoway (scatter median_income mean_factor1, mlabel(jobfinal) mlabposition(0)) ///
       (lfit median_income mean_factor1), ///
       title("Scatter Plot of Median Income by Mean Status Score") ///
       xtitle("Mean Status Score (mean_pc1)") ///
       ytitle("Median Income") ///
       caption("Correlation: 0.58", size(small) color(red)) ///
       note("Data from BHPS wave 10. N=6,964", size(small) color(black))
corr median_income mean_factor1


gen alevel=. 
replace alevel=1 if bj_qfedhi>=1 & bj_qfedhi<=6
replace alevel=0 if bj_qfedhi>=7 & bj_qfedhi<=12


egen total_with_alevel = total(alevel == 1), by(jobfinal)
egen total_individuals = count(alevel), by(jobfinal)

gen prop_alevel = total_with_alevel / total_individuals

	   
twoway (scatter prop_alevel mean_factor1, mlabel(jobfinal) mlabposition(0)) ///
       (lfit prop_alevel mean_factor1), ///
       title("Scatter Plot of Proportion of A'levels by Mean Status Score") ///
       xtitle("Mean Status Score (mean_pc1)") ///
       ytitle("Proportion of A'Levels") ///
       caption("Correlation: 0.89", size(small) color(red)) ///
       note("Data from BHPS wave 10. N=6,964", size(small) color(black))
corr prop_alevel mean_factor1


**	   
cd"G:\Stata data and do\BHPS + US\UKDA-6614-stata\stata\stata13_se\bhps"

merge 1:m pidp using xwavedat.dta

svyset psu [pweight=bj_xrwtsw1], strata(strata) singleunit(scaled)


tabstat factor1_z, by(jobfinal) statistics(mean) format(%9.2f)
tabstat chanstat_z, by(jobfinal) statistics(mean) format(%9.2f)
tabstat cambridge_z, by(jobfinal) statistics(mean) format(%9.2f)

tabstat factor1_z, by(nssec) statistics(mean) format(%9.2f)
tabstat chanstat_z, by(nssec) statistics(mean) format(%9.2f)
tabstat cambridge_z, by(nssec) statistics(mean) format(%9.2f)

list factor1_z status_z chanstat_z cambridge_z nssec closeness_z emerging_z highbrow_z mono_z if nssec==1
list factor1_z status_z chanstat_z cambridge_z nssec closeness_z emerging_z highbrow_z mono_z if nssec==8



regress chanstat_z median_income prop_alevel

svy: regress chanstat_z median_income prop_alevel 

etable

regress factor1_z median_income prop_alevel

svy: regress factor1_z median_income prop_alevel 

etable, append 

svy: regress cambridge_z median_income prop_alevel 
etable, append 


cd "G:\Stata data and do\do files\Status\figures"

collect style showbase all

collect label levels etable_depvar 1 "Chan-Goldthorpe Duplication #1" ///
										2 "Social Status Duplication #1", modify

collect style cell, font(Book Antiqua)

etable, replay column(depvar) ///
cstat(_r_b, nformat(%4.2f))  ///
		cstat(_r_se, nformat(%6.2f))  ///
		showstars showstarsnote  ///
		stars(.05 "*" .01 "**" .001 "***", attach(_r_b)) ///
		mstat(N) mstat(aic) mstat(bic) mstat(r2_a)	///
		title("Table 1: Regression Models of relationship between income and education on status measures") ///
		titlestyles(font(Arial Narrow, size(14) bold)) ///
		note("Data Source: BHPS. Adjusted for Complex Sample. N=7,001") ///
		notestyles(font(Book Antiqua, size(8) italic)) ///
		export("incomeeducationreg.docx", replace)



***
gen finaljob=jobfinal

graph box factor1, over(nssec) ///
    title("Box Plot of Status Score by NS-SEC Categories") ///
    ytitle("Social Status") ///
    note("Data from BHPS wave 10. Adjusted for Complex Sample. N=6,964", size(small) color(black))



graph bar (count) factor1, over(finaljob) by(nssec) 


    title("Count of occupations ordered by social status within each NS-SEC category") ///
    ytitle("Social Status") ///
    note("Data from BHPS wave 10. Adjusted for Complex Sample. N=6,964", size(small) color(black))

graph bar (count) factor1, over(nssec) 


* Test regressions 
* smoking status

collect clear 

gen smoke=.
replace smoke=0 if bj_smoker==1
replace smoke=1 if bj_smoker==2

svy: logit smoke ib3.nssec
etable 

svy: logit smoke factor1_z ib3.nssec
etable, append
khb logit smoke ib3.nssec || factor1_z , summary

svy: logit smoke chanstat_z ib3.nssec
etable, append
khb logit smoke ib3.nssec || chanstat_z , summary


svy: logit smoke cambridge_z ib3.nssec
etable, append
khb logit smoke ib3.nssec || cambridge_z , summary

collect style showbase all

collect label levels etable_depvar 1 "Null Model + NS-SEC" ///
										2 "Social Status" /// 
										3 "Chan-Goldthorpe" ///
										4 "Cambridge Scale" , modify

collect style cell, font(Book Antiqua)

etable, replay column(depvar) ///
cstat(_r_b, nformat(%4.2f))  ///
		cstat(_r_se, nformat(%6.2f))  ///
		showstars showstarsnote  ///
		stars(.05 "*" .01 "**" .001 "***", attach(_r_b)) ///
		mstat(N) mstat(aic) mstat(bic) mstat(r2_a)	///
		title("Table 1: Regression Models of Smoking Status") ///
		titlestyles(font(Arial Narrow, size(14) bold)) ///
		note("Data Source: BHPS. Adjusted for Complex Sample. N=6,959") ///
		notestyles(font(Book Antiqua, size(8) italic)) ///
		export("smokingstatus.docx", replace)

*voting or not

collect clear 

gen vote=.
replace vote=0 if bj_vote7==1
replace vote=1 if bj_vote7==2

svy: logit vote ib3.nssec
etable

svy: logit vote factor1_z ib3.nssec
etable, append

svy: logit vote chanstat_z ib3.nssec
etable, append

svy: logit vote cambridge_z ib3.nssec
etable, append

collect style showbase all

collect label levels etable_depvar 1 "Null Model + NS-SEC" ///
										2 "Social Status" /// 
										3 "Chan-Goldthorpe" ///
										4 "Cambridge Scale" , modify

collect style cell, font(Book Antiqua)

etable, replay column(depvar) ///
cstat(_r_b, nformat(%4.2f))  ///
		cstat(_r_se, nformat(%6.2f))  ///
		showstars showstarsnote  ///
		stars(.05 "*" .01 "**" .001 "***", attach(_r_b)) ///
		mstat(N) mstat(aic) mstat(bic) mstat(r2_a)	///
		title("Table 1: Regression Models of Voting Status") ///
		titlestyles(font(Arial Narrow, size(14) bold)) ///
		note("Data Source: BHPS. Adjusted for Complex Sample. N=6,959") ///
		notestyles(font(Book Antiqua, size(8) italic)) ///
		export("votingstatus.docx", replace)

* attittude scale

collect clear 

gen wealth=.
replace wealth= bj_ophlc if bj_ophlc>=1 & bj_ophlc<=5

svy: ologit wealth ib3.nssec
etable

svy: ologit wealth factor1_z ib3.nssec
etable, append

svy: ologit wealth chanstat_z ib3.nssec
etable, append

svy: ologit wealth cambridge_z ib3.nssec
etable, append

collect style showbase all

collect label levels etable_depvar 1 "Null Model + NS-SEC" ///
										2 "Social Status" /// 
										3 "Chan-Goldthorpe" ///
										4 "Cambridge Scale" , modify

collect style cell, font(Book Antiqua)

etable, replay column(depvar) ///
cstat(_r_b, nformat(%4.2f))  ///
		cstat(_r_se, nformat(%6.2f))  ///
		showstars showstarsnote  ///
		stars(.05 "*" .01 "**" .001 "***", attach(_r_b)) ///
		mstat(N) mstat(aic) mstat(bic) mstat(r2_a)	///
		title("Table 1: Regression Models of 'Unfair that wealth buys medical priority'") ///
		titlestyles(font(Arial Narrow, size(14) bold)) ///
		note("Data Source: BHPS. Adjusted for Complex Sample. N=6,959") ///
		notestyles(font(Book Antiqua, size(8) italic)) ///
		export("attitudereg.docx", replace)

* Economic Life chances - unemployment 

collect clear 

gen unspell=.
replace unspell=0 if bj_njusp==0
replace unspell=1 if bj_njusp>=1 & bj_njusp<=3

svy: logit unspell ib3.nssec
etable

svy: logit unspell ib3.nssec factor1_z
etable, append

svy: logit unspell ib3.nssec chanstat_z
etable, append

svy: logit unspell ib3.nssec cambridge_z
etable, append

collect style showbase all

collect label levels etable_depvar 1 "Null Model + NS-SEC" ///
										2 "Social Status" /// 
										3 "Chan-Goldthorpe" ///
										4 "Cambridge Scale" , modify

collect style cell, font(Book Antiqua)

etable, replay column(depvar) ///
cstat(_r_b, nformat(%4.2f))  ///
		cstat(_r_se, nformat(%6.2f))  ///
		showstars showstarsnote  ///
		stars(.05 "*" .01 "**" .001 "***", attach(_r_b)) ///
		mstat(N) mstat(aic) mstat(bic) mstat(r2_a)	///
		title("Table 1: Regression Models of Unemployment Spell") ///
		titlestyles(font(Arial Narrow, size(14) bold)) ///
		note("Data Source: BHPS. Adjusted for Complex Sample. N=6,959") ///
		notestyles(font(Book Antiqua, size(8) italic)) ///
		export("unemploymentspell.docx", replace)


*** Really interesting one...
collect clear 

gen homo=.
replace homo= bj_opfamr if bj_opfamr>=1 & bj_opfamr<=5

svy: ologit homo ib3.nssec
etable

svy: ologit homo factor1_z ib3.nssec
etable, append 
margins, at(factor1_z=(-2.0(0.1)2.0))
marginsplot, recast(line) 

svy: ologit homo chanstat_z ib3.nssec
etable, append 
margins, at(chanstat_z=(-1.5(0.1)1.2))
marginsplot, recast(line) 

svy: ologit homo cambridge_z ib3.nssec
etable, append 
margins, at(cambridge_z=(-2.0(0.1)3.0))
marginsplot, recast(line) 

collect style showbase all

collect label levels etable_depvar 1 "Null Model + NS-SEC" ///
										2 "Social Status" /// 
										3 "Chan-Goldthorpe" ///
										4 "Cambridge Scale" , modify

collect style cell, font(Book Antiqua)

etable, replay column(depvar) ///
cstat(_r_b, nformat(%4.2f))  ///
		cstat(_r_se, nformat(%6.2f))  ///
		showstars showstarsnote  ///
		stars(.05 "*" .01 "**" .001 "***", attach(_r_b)) ///
		mstat(N) mstat(aic) mstat(bic) mstat(r2_a)	///
		title("Table 1: Ordinal Logistic Regression Models of Views Toward Homosexuality") ///
		titlestyles(font(Arial Narrow, size(14) bold)) ///
		note("Data Source: BHPS. Adjusted for Complex Sample. N=6,959") ///
		notestyles(font(Book Antiqua, size(8) italic)) ///
		export("homoreg.docx", replace)


***
*Attitudes Survey

clear 

use "G:\Stata data and do\British Attitudes Survey 2001\stata\stata6\bsa01.dta"


gen mog=. 
replace mog=10 if rnsoc90>=100 & rnsoc90<=109
replace mog=11 if rnsoc90>=110 & rnsoc90<=119
replace mog=12 if rnsoc90>=120 & rnsoc90<=129
replace mog=13 if rnsoc90>=130 & rnsoc90<=139
replace mog=14 if rnsoc90>=140 & rnsoc90<=149
replace mog=15 if rnsoc90>=150 & rnsoc90<=159
replace mog=16 if rnsoc90>=160 & rnsoc90<=169
replace mog=17 if rnsoc90>=170 & rnsoc90<=179
replace mog=18 if rnsoc90>=180 & rnsoc90<=189
replace mog=19 if rnsoc90>=190 & rnsoc90<=199

replace mog=20 if rnsoc90>=200 & rnsoc90<=209
replace mog=21 if rnsoc90>=210 & rnsoc90<=219
replace mog=22 if rnsoc90>=220 & rnsoc90<=229
replace mog=23 if rnsoc90>=230 & rnsoc90<=239
replace mog=24 if rnsoc90>=240 & rnsoc90<=249
replace mog=25 if rnsoc90>=250 & rnsoc90<=259
replace mog=26 if rnsoc90>=260 & rnsoc90<=269
replace mog=27 if rnsoc90>=270 & rnsoc90<=279
replace mog=28 if rnsoc90>=280 & rnsoc90<=289
replace mog=29 if rnsoc90>=290 & rnsoc90<=299

replace mog=30 if rnsoc90>=300 & rnsoc90<=309
replace mog=31 if rnsoc90>=310 & rnsoc90<=319
replace mog=32 if rnsoc90>=320 & rnsoc90<=329
replace mog=33 if rnsoc90>=330 & rnsoc90<=339
replace mog=34 if rnsoc90>=340 & rnsoc90<=349
replace mog=35 if rnsoc90>=350 & rnsoc90<=359
replace mog=36 if rnsoc90>=360 & rnsoc90<=369
replace mog=37 if rnsoc90>=370 & rnsoc90<=379
replace mog=38 if rnsoc90>=380 & rnsoc90<=389
replace mog=39 if rnsoc90>=390 & rnsoc90<=399

replace mog=40 if rnsoc90>=400 & rnsoc90<=409
replace mog=41 if rnsoc90>=410 & rnsoc90<=419
replace mog=42 if rnsoc90>=420 & rnsoc90<=429
replace mog=43 if rnsoc90>=430 & rnsoc90<=439
replace mog=44 if rnsoc90>=440 & rnsoc90<=449
replace mog=45 if rnsoc90>=450 & rnsoc90<=459
replace mog=46 if rnsoc90>=460 & rnsoc90<=469
replace mog=47 if rnsoc90>=470 & rnsoc90<=479
replace mog=48 if rnsoc90>=480 & rnsoc90<=489
replace mog=49 if rnsoc90>=490 & rnsoc90<=499

replace mog=50 if rnsoc90>=500 & rnsoc90<=509
replace mog=51 if rnsoc90>=510 & rnsoc90<=519
replace mog=52 if rnsoc90>=520 & rnsoc90<=529
replace mog=53 if rnsoc90>=530 & rnsoc90<=539
replace mog=54 if rnsoc90>=540 & rnsoc90<=549
replace mog=55 if rnsoc90>=550 & rnsoc90<=559
replace mog=56 if rnsoc90>=560 & rnsoc90<=569
replace mog=57 if rnsoc90>=570 & rnsoc90<=579
replace mog=58 if rnsoc90>=580 & rnsoc90<=589
replace mog=59 if rnsoc90>=590 & rnsoc90<=599

replace mog=60 if rnsoc90>=600 & rnsoc90<=609
replace mog=61 if rnsoc90>=610 & rnsoc90<=619
replace mog=62 if rnsoc90>=620 & rnsoc90<=629
replace mog=63 if rnsoc90>=630 & rnsoc90<=639
replace mog=64 if rnsoc90>=640 & rnsoc90<=649
replace mog=65 if rnsoc90>=650 & rnsoc90<=659
replace mog=66 if rnsoc90>=660 & rnsoc90<=669
replace mog=67 if rnsoc90>=670 & rnsoc90<=679
replace mog=68 if rnsoc90>=680 & rnsoc90<=689
replace mog=69 if rnsoc90>=690 & rnsoc90<=699

replace mog=70 if rnsoc90>=700 & rnsoc90<=709
replace mog=71 if rnsoc90>=710 & rnsoc90<=719
replace mog=72 if rnsoc90>=720 & rnsoc90<=729
replace mog=73 if rnsoc90>=730 & rnsoc90<=739
replace mog=74 if rnsoc90>=740 & rnsoc90<=749
replace mog=75 if rnsoc90>=750 & rnsoc90<=759
replace mog=76 if rnsoc90>=760 & rnsoc90<=769
replace mog=77 if rnsoc90>=770 & rnsoc90<=779
replace mog=78 if rnsoc90>=780 & rnsoc90<=789
replace mog=79 if rnsoc90>=790 & rnsoc90<=799

replace mog=80 if rnsoc90>=800 & rnsoc90<=809
replace mog=81 if rnsoc90>=810 & rnsoc90<=819
replace mog=82 if rnsoc90>=820 & rnsoc90<=829
replace mog=83 if rnsoc90>=830 & rnsoc90<=839
replace mog=84 if rnsoc90>=840 & rnsoc90<=849
replace mog=85 if rnsoc90>=850 & rnsoc90<=859
replace mog=86 if rnsoc90>=860 & rnsoc90<=869
replace mog=87 if rnsoc90>=870 & rnsoc90<=879
replace mog=88 if rnsoc90>=880 & rnsoc90<=889
replace mog=89 if rnsoc90>=890 & rnsoc90<=899

replace mog=90 if rnsoc90>=900 & rnsoc90<=909
replace mog=91 if rnsoc90>=910 & rnsoc90<=919
replace mog=92 if rnsoc90>=920 & rnsoc90<=929
replace mog=93 if rnsoc90>=930 & rnsoc90<=939
replace mog=94 if rnsoc90>=940 & rnsoc90<=949
replace mog=95 if rnsoc90>=950 & rnsoc90<=959
replace mog=96 if rnsoc90>=960 & rnsoc90<=969
replace mog=97 if rnsoc90>=970 & rnsoc90<=979
replace mog=98 if rnsoc90>=980 & rnsoc90<=989
replace mog=99 if rnsoc90>=990 & rnsoc90<=999


gen jobfinal=. 
replace jobfinal=1 if (mog==10 | mog==13 | mog==15)
replace jobfinal=2 if (mog==11 | mog==14 | mog==16)
replace jobfinal=3 if (mog==12)
replace jobfinal=4 if (mog==17)
replace jobfinal=5 if (mog==19)
replace jobfinal=6 if (mog==20 | mog==21)
replace jobfinal=7 if (mog==22 | mog==24 | mog==25 | mog==26 | mog==27 | mog==29)
replace jobfinal=8 if (mog==23)
replace jobfinal=9 if (mog==30 | mog==31 | mog==32 | mog==33 | mog==39)
replace jobfinal=10 if (mog==34 | mog==37)
replace jobfinal=11 if (mog==35 | mog==36 | mog==38)
replace jobfinal=12 if (mog==40)
replace jobfinal=13 if (mog==41)
replace jobfinal=14 if (mog==42)
replace jobfinal=15 if (mog==43)
replace jobfinal=16 if (mog==44 | mog==49)
replace jobfinal=17 if (mog==45 | mog==46)
replace jobfinal=18 if (mog==50 | mog==52)
replace jobfinal=19 if (mog==51 | mog==53 | mog==54)
replace jobfinal=20 if (mog==55 | mog==56 | mog==58 | mog==59)
replace jobfinal=21 if (mog==60 | mog==61)
replace jobfinal=22 if (mog==62)
replace jobfinal=23 if (mog==63 | mog==66 | mog==67 | mog==69)
replace jobfinal=24 if (mog==64)
replace jobfinal=25 if (mog==65)
replace jobfinal=26 if (mog==70 | mog==71)
replace jobfinal=27 if (mog==72 | mog==73 | mog==79)
replace jobfinal=28 if (mog==80 | mog==81 | mog==82 | mog==83 | mog==84 | mog==85 | mog==86 | mog==89)
replace jobfinal=29 if (mog==87 | mog==88)
replace jobfinal=30 if (mog==90 | mog==91 | mog==92 | mog==93 | mog==99)
replace jobfinal=31 if (mog==94 | mog==95)


label define soc_lbl 1"GMA" 2"PDM" 3"SM" 4"MPS" 5"OMO" 6"SET" 7"HP" 8"TPE" 9"API" 10"APH" 11"APB" 12"AOA" 13"NCC" 14"FRC" 15"OCW" 16"SDC" 17"SEC" 18"SMC" 19"SMM" 20"SMO" 21"PSP" 22"CW" 23"PSW" 24"HW" 25"CCW" 26"BSR" 27"SW" 28"PMO" 29"TO" 30"GL" 31"RWS"
label values jobfinal soc_lbl 


gen chanstat=.
replace chanstat=0.4114 if(jobfinal==1)
replace chanstat=-0.0625 if(jobfinal==2)
replace chanstat=0.5107 if(jobfinal==3)
replace chanstat=-0.0453 if(jobfinal==4)
replace chanstat=0.2355 if(jobfinal==5)
replace chanstat=0.3115 if(jobfinal==6)
replace chanstat=0.5643 if(jobfinal==7)
replace chanstat=0.5017  if(jobfinal==8)
replace chanstat=0.3116 if(jobfinal==9)
replace chanstat=0.2228 if(jobfinal==10)
replace chanstat=0.5337 if(jobfinal==11)
replace chanstat=0.2274 if(jobfinal==12)
replace chanstat=0.2238 if(jobfinal==13)
replace chanstat=0.2559 if(jobfinal==14)
replace chanstat=0.1443 if(jobfinal==15)
replace chanstat=-0.3353 if(jobfinal==16)
replace chanstat=0.1539 if(jobfinal==17)
replace chanstat=-0.5014 if(jobfinal==18)
replace chanstat=-0.5121 if(jobfinal==19)
replace chanstat=-0.4072 if(jobfinal==20)
replace chanstat=0.2288 if(jobfinal==21)
replace chanstat=-0.3261 if(jobfinal==22)
replace chanstat=0.2261 if(jobfinal==23)
replace chanstat=-0.2121 if(jobfinal==24)
replace chanstat=0.1097 if(jobfinal==25)
replace chanstat=0.1193 if(jobfinal==26)
replace chanstat=-0.1151 if(jobfinal==27)
replace chanstat=-0.5589 if(jobfinal==28)
replace chanstat=-0.4114 if(jobfinal==29)
replace chanstat=-0.5979 if(jobfinal==30)
replace chanstat=-0.2974 if(jobfinal==31)

label values chanstat soc_lbl

gen status=. 
replace status=0.8686893 if(jobfinal==1)
replace status=0.2653986 if(jobfinal==2)
replace status=0.9040708 if(jobfinal==3)
replace status=0.093616 if(jobfinal==4)
replace status=0.6771903 if(jobfinal==5)
replace status=0.7662023 if(jobfinal==6)
replace status=1.097037 if(jobfinal==7)
replace status=1.842329  if(jobfinal==8)
replace status=0.6382437 if(jobfinal==9)
replace status=0.8581756 if(jobfinal==10)
replace status=1.066187 if(jobfinal==11)
replace status=0.3335406 if(jobfinal==12)
replace status=0.4343797 if(jobfinal==13)
replace status=0.4039141 if(jobfinal==14)
replace status=0.2727689 if(jobfinal==15)
replace status=-0.2988098 if(jobfinal==16)
replace status=0.4549837 if(jobfinal==17)
replace status=-0.8901918 if(jobfinal==18)
replace status=-1.174013 if(jobfinal==19)
replace status=-0.9848496 if(jobfinal==20)
replace status=-0.0442964 if(jobfinal==21)
replace status=-0.7247445 if(jobfinal==22)
replace status=-0.3768193 if(jobfinal==23)
replace status=-0.6460063 if(jobfinal==24)
replace status=-0.0574259 if(jobfinal==25)
replace status=0.1399988 if(jobfinal==26)
replace status=-0.8360533 if(jobfinal==27)
replace status=-1.595859 if(jobfinal==28)
replace status=-0.9827569 if(jobfinal==29)
replace status=-0.641479 if(jobfinal==30)
replace status=-1.130757 if(jobfinal==31)

label values status soc_lbl


gen redis=.
replace redis=1 if redistrb==1
replace redis=2 if redistrb==2
replace redis=3 if redistrb==3
replace redis=4 if redistrb==4
replace redis=5 if redistrb==5

gen big=.
replace big=1 if bigbusnn==1
replace big=2 if bigbusnn==2
replace big=3 if bigbusnn==3
replace big=4 if bigbusnn==4
replace big=5 if bigbusnn==5

gen fair=. 
replace fair=1 if wealth==1
replace fair=2 if wealth==2
replace fair=3 if wealth==3
replace fair=4 if wealth==4
replace fair=5 if wealth==5

gen law=.
replace law=1 if richlaw==1
replace law=2 if richlaw==2
replace law=3 if richlaw==3
replace law=4 if richlaw==4
replace law=5 if richlaw==5

gen better=.
replace better=1 if indust4==1
replace better=2 if indust4==2
replace better=3 if indust4==3
replace better=4 if indust4==4
replace better=5 if indust4==5

gen leftright= redis+big+fair+law+better


gen trad=.
replace trad=1 if tradvals==1
replace trad=2 if tradvals==2
replace trad=3 if tradvals==3
replace trad=4 if tradvals==4
replace trad=5 if tradvals==5

gen stiff=.
replace stiff=1 if stifsent==1
replace stiff=2 if stifsent==2
replace stiff=3 if stifsent==3
replace stiff=4 if stifsent==4
replace stiff=5 if stifsent==5

gen death=.
replace death=1 if deathapp==1
replace death=2 if deathapp==2
replace death=3 if deathapp==3
replace death=4 if deathapp==4
replace death=5 if deathapp==5

gen school=.
replace school=1 if obey==1
replace school=2 if obey==2
replace school=3 if obey==3
replace school=4 if obey==4
replace school=5 if obey==5

gen wrong=.
replace wrong=1 if wronglaw==1
replace wrong=2 if wronglaw==2
replace wrong=3 if wronglaw==3
replace wrong=4 if wronglaw==4
replace wrong=5 if wronglaw==5

gen film=.
replace film=1 if censor==1
replace film=2 if censor==2
replace film=3 if censor==3
replace film=4 if censor==4
replace film=5 if censor==5

gen authlib= trad+stiff+death+school+wrong+film


gen age=. 
replace age= rage if rage>=18 & rage<=97

tab rsex

gen income=.
replace income=1 if hhincome>=1 & hhincome<=4
replace income=2 if hhincome>=5 & hhincome<=9
replace income=3 if hhincome>=10 & hhincome<=16
replace income=4 if hhincome>=17 

lab define income 1"<10k" 2"10-23k" 3"23-44k" 4">44k"
lab val income income

gen qual=. 
replace qual=1 if hedqual==7
replace qual=2 if hedqual==5
replace qual=3 if hedqual==4
replace qual=4 if hedqual==3
replace qual=5 if hedqual==2
replace qual=6 if hedqual==1

lab def qual 1"no qual" 2"CSE" 3"O'LEVEL" 4"A'LEVEL" 5"SUBDEGREE" 6"DEGREE"
lab val qual qual

gen nssec=.
replace nssec=1 if rnssec==2
replace nssec=2 if rnssec>=3.1 & rnssec<=3.4
replace nssec=3 if rnssec>=4 & rnssec<=6
replace nssec=4 if rnssec>=7 & rnssec<=7.4
replace nssec=5 if rnssec>=8 & rnssec<=9.2
replace nssec=6 if rnssec>=10 & rnssec<=11.2
replace nssec=7 if rnssec>=12 & rnssec<=12.7
replace nssec=8 if rnssec>=13 & rnssec<=13.5

lab def nssec 1"1.1" 2"1.2" 3"2" 4"3" 5"4" 6"5" 7"6" 8"7"
lab val nssec nssec


egen mean_status = mean(status)
egen sd_status = sd(status)
gen status_z = (status - mean_status) / sd_status

egen mean_chanstat= mean(chanstat)
egen sd_chanstat = sd(chanstat)
gen chanstat_z = (chanstat - mean_chanstat) / sd_chanstat

keep if !missing(leftright, age, rsex, income, qual, nssec, status_z, chanstat_z, authlib)

collect clear
regress leftright age rsex ib1.income ib1.qual ib3.nssec status_z
etable
regress leftright age rsex ib1.income ib1.qual ib3.nssec chanstat_z
etable, append

regress authlib age rsex ib1.income ib1.qual ib1.nssec c.status_z
etable, append

margins, at(status_z=(-1.60(0.12)2.10)) atmeans saving(plot1, replace)


marginsplot, ciopts(fcolor(blue%20)) ///
    title("Effect of Social Status on Libertarian-Authoritarian Axis") ///
    ytitle("Predicted Libertarian-Authoritarian Score") ///
    xtitle("Social Status") ///
    plotopts(lwidth(medium)) ///
    recast(line) ///
    xscale(range(-1.64 2.11)) ///
	name(plot1, replace) 




regress authlib age rsex ib1.income ib1.qual ib1.nssec c.chanstat_z
etable, append

margins, at(chanstat_z=(-1.62(0.10)1.60)) atmeans saving(plot2, replace)

marginsplot, ciopts(fcolor(blue%20)) ///
    title("Effect of Social Status on Libertarian-Authoritarian Axis") ///
    ytitle("Predicted Libertarian-Authoritarian Score") ///
    xtitle("Chan-Goldthorpe Scale") ///
    plotopts(lwidth(medium)) ///
    recast(line) ///
    xscale(range(-1.64 2.11)) ///
	name(plot2, replace) ///
	saving(plot2, replace)


graph combine plot1 plot2, ycommon


collect style showbase all

collect label levels etable_depvar 1 "Left-Right Social Status" ///
										2 "Left-Right Chan-Goldthorpe" /// 
										3 "Libertarian-Authoritarian Social Status" ///
										4 "Libertarian-Authoritarian Chan-Goldthorpe" , modify

collect style cell, font(Book Antiqua)

etable, replay column(depvar) ///
cstat(_r_b, nformat(%4.2f))  ///
		cstat(_r_se, nformat(%6.2f))  ///
		showstars showstarsnote  ///
		stars(.05 "*" .01 "**" .001 "***", attach(_r_b)) ///
		mstat(N) mstat(aic) mstat(bic) mstat(r2_a)	///
		title("Table 1: Regression Models of Poltical Axis") ///
		titlestyles(font(Arial Narrow, size(14) bold)) ///
		note("Data Source: BHPS. Adjusted for Complex Sample. N=6,959") ///
		notestyles(font(Book Antiqua, size(8) italic)) ///
		export("polticalaxis.docx", replace)



* Nearly double the substantive effect, my measure appears to be slightly more sensitive. 