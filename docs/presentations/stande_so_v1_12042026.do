
clear

set scheme tab2


*** ENDOGAMY -- SOCIAL INTERCOURSE ***


use"G:\Stata data and do\BHPS + US\UKDA-6614-stata\stata\stata13_se\bhps_w10\bj_indresp", clear

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

/* Male only D

use"G:\Stata data and do\BHPS + US\UKDA-6614-stata\stata\stata13_se\bhps_w10\bj_indresp", clear

gen age=.
replace age = bj_age if bj_age>=20 & bj_age<=65

keep if !missing(age)
keep if bj_sex==1


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

* Female only D

use"G:\Stata data and do\BHPS + US\UKDA-6614-stata\stata\stata13_se\bhps_w10\bj_indresp", clear

gen age=.
replace age = bj_age if bj_age>=20 & bj_age<=65

keep if !missing(age)
keep if bj_sex==2


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
*/

** insert here the proportion of homogamy for 31 occupational groupings, then standardise... test this agains the MDS approach and assess

cd"G:\Stata data and do\do files\Status"


infile GMA PDM SM MPS OMO SET HP TPE API APH APB AOA NCC FRC OCW SDC SEC SMC SMM SMO PSP CW PSW HW CCW BSR SW PMO TO GL RWS using "fullocctextprop.txt", clear

matrix dissimilarity D = GMA PDM SM MPS OMO SET HP TPE API APH APB AOA NCC FRC OCW SDC SEC SMC SMM SMO PSP CW PSW HW CCW BSR SW PMO TO GL RWS, variables 

mat list D

matrix D = 0.01 * D
mat list D


mdsmat D, dimensions(3)

cd"G:\Stata data and do\do files\Status\figures"

screeplot, ///
title("Scree Plot of Eigenvalues after MDSCAL", size(small)) ///
note("Data from BHPS wave 10. N=4,769", size(vsmall)) ///
caption("Data taken from indiviudal and partner occupational titles (MOGs)", size(vsmall))
graph export eigenmdscal.png, replace

estat config
estat stress

mdsshepard, ///
title("Goodness-of-fit Shepard Diagram", size(small)) ///
note("Data from BHPS wave 10. N=4,769", size(vsmall)) ///
caption("Data taken from indiviudal and partner occupational titles (MOGs)", size(vsmall))
graph export shepard.png, replace

mdsconfig, dimensions(2 1) aspectratio(0.75) yline(0) xline(0) msymbol(o) msize(small) mlabsize(vsmall) mlabposition(12) ///
title("") note("") caption("") ///
yscale(range(-0.2(0.1)0.2)) ///
ylabel(-0.2(0.1)0.2) ///
xscale(range(-0.3(0.1)0.3)) ///
xlabel(-0.3(0.1)0.3) 
graph save mds1.gph, replace
graph export mds1.png, replace

mdsconfig, dimensions(3 1) aspectratio(0.75) yline(0) xline(0) msymbol(o) msize(small) mlabsize(vsmall) mlabposition(12) ///
title("") note("") caption("") ///
yscale(range(-0.2(0.1)0.2)) ///
ylabel(-0.2(0.1)0.2) ///
xscale(range(-0.3(0.1)0.3)) ///
xlabel(-0.3(0.1)0.3) 

graph save mds2.gph, replace
graph export mds2.png, replace

mdsconfig, dimensions(3 2) aspectratio(0.75) yline(0) xline(0) msymbol(o) msize(small) mlabsize(vsmall) mlabposition(12) ///
title("") note("") caption("") /// 
yscale(range(-0.2(0.1)0.2)) ///
ylabel(-0.2(0.1)0.2) ///
xscale(range(-0.3(0.1)0.3)) ///
xlabel(-0.3(0.1)0.3) 

graph save mds3.gph, replace
graph export mds3.png, replace

graph combine mds1.gph mds2.gph mds3.gph, ///
title("Multi-Dimensional Scaling Configuration Over Three Plains", size(small)) ///
note("Data from BHPS wave 10. N=4,769", size(vsmall)) ///
caption("Data taken from indiviudal and partner occupational titles (MOGs)", size(vsmall))

graph export mdscomb.png, replace



estat config

/* testing male female seperate scales... 


infile GMA PDM SM MPS OMO SET HP TPE API APH APB AOA NCC FRC OCW SDC SEC SMC SMM SMO PSP CW PSW HW CCW BSR SW PMO TO GL RWS using "fullocctextpropmale.txt", clear

matrix dissimilarity D = GMA PDM SM MPS OMO SET HP TPE API APH APB AOA NCC FRC OCW SDC SEC SMC SMM SMO PSP CW PSW HW CCW BSR SW PMO TO GL RWS, variables 

mat list D

matrix D = 0.01 * D
mat list D

mdsmat D, dimensions(3)

estat config


infile GMA PDM SM MPS OMO SET HP TPE API APH APB AOA NCC FRC OCW SDC SEC SMC SMM SMO PSP CW PSW HW CCW BSR SW PMO TO GL RWS using "fullocctextpropfemale.txt", clear

matrix dissimilarity D = GMA PDM SM MPS OMO SET HP TPE API APH APB AOA NCC FRC OCW SDC SEC SMC SMM SMO PSP CW PSW HW CCW BSR SW PMO TO GL RWS, variables 

mat list D

matrix D = 0.01 * D
mat list D


mdsmat D, dimensions(3)

estat config


clear

use"G:\Stata data and do\BHPS + US\UKDA-6614-stata\stata\stata13_se\bhps_w10\bj_indresp"

gen age=.
replace age = bj_age if bj_age>=20 & bj_age<=65

keep if !missing(age)

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
replace status =  0.0288   if jobfinal == 1  & bj_sex == 1
replace status =  0.1507   if jobfinal == 2  & bj_sex == 1
replace status =  0.0589   if jobfinal == 3  & bj_sex == 1
replace status =  0.0088   if jobfinal == 4  & bj_sex == 1
replace status =  0.0959   if jobfinal == 5  & bj_sex == 1
replace status =  0.153    if jobfinal == 6  & bj_sex == 1
replace status =  0.0289   if jobfinal == 7  & bj_sex == 1
replace status = -0.2346   if jobfinal == 8  & bj_sex == 1
replace status =  0.0476   if jobfinal == 9  & bj_sex == 1
replace status = -0.2732   if jobfinal == 10 & bj_sex == 1
replace status =  0.0525   if jobfinal == 11 & bj_sex == 1
replace status = -0.0593   if jobfinal == 12 & bj_sex == 1
replace status = -0.0826   if jobfinal == 13 & bj_sex == 1
replace status =  0.029    if jobfinal == 14 & bj_sex == 1
replace status = -0.137    if jobfinal == 15 & bj_sex == 1
replace status =  0.1119   if jobfinal == 16 & bj_sex == 1
replace status = -0.2616   if jobfinal == 17 & bj_sex == 1
replace status =  0.1636   if jobfinal == 18 & bj_sex == 1
replace status =  0.1626   if jobfinal == 19 & bj_sex == 1
replace status = -0.0299   if jobfinal == 20 & bj_sex == 1
replace status =  0.1317   if jobfinal == 21 & bj_sex == 1
replace status = -0.0026   if jobfinal == 22 & bj_sex == 1
replace status =  0.0485   if jobfinal == 23 & bj_sex == 1
replace status =  0.0102   if jobfinal == 24 & bj_sex == 1
replace status = -0.1288   if jobfinal == 25 & bj_sex == 1
replace status =  0.1216   if jobfinal == 26 & bj_sex == 1
replace status = -0.4072   if jobfinal == 27 & bj_sex == 1
replace status =  0.036    if jobfinal == 28 & bj_sex == 1
replace status =  0.1487   if jobfinal == 29 & bj_sex == 1
replace status =  0.1111   if jobfinal == 30 & bj_sex == 1
replace status = -0.0829   if jobfinal == 31 & bj_sex == 1

replace status =  0.0246   if jobfinal == 1  & bj_sex == 2
replace status = -0.2397   if jobfinal == 2  & bj_sex == 2
replace status =  0.0089   if jobfinal == 3  & bj_sex == 2
replace status = -0.0239   if jobfinal == 4  & bj_sex == 2
replace status =  0.0335   if jobfinal == 5  & bj_sex == 2
replace status =  0.006    if jobfinal == 6  & bj_sex == 2
replace status =  0.0134   if jobfinal == 7  & bj_sex == 2
replace status =  0.1131   if jobfinal == 8  & bj_sex == 2
replace status = -0.0676   if jobfinal == 9  & bj_sex == 2
replace status =  0.1081   if jobfinal == 10 & bj_sex == 2
replace status = -0.0036   if jobfinal == 11 & bj_sex == 2
replace status =  0.1333   if jobfinal == 12 & bj_sex == 2
replace status =  0.1001   if jobfinal == 13 & bj_sex == 2
replace status =  0.1164   if jobfinal == 14 & bj_sex == 2
replace status =  0.1292   if jobfinal == 15 & bj_sex == 2
replace status =  0.0465   if jobfinal == 16 & bj_sex == 2
replace status =  0.1554   if jobfinal == 17 & bj_sex == 2
replace status = -0.3477   if jobfinal == 18 & bj_sex == 2
replace status = -0.2698   if jobfinal == 19 & bj_sex == 2
replace status = -0.0769   if jobfinal == 20 & bj_sex == 2
replace status =  0.0424   if jobfinal == 21 & bj_sex == 2
replace status =  0.1276   if jobfinal == 22 & bj_sex == 2
replace status =  0.1247   if jobfinal == 23 & bj_sex == 2
replace status =  0.1403   if jobfinal == 24 & bj_sex == 2
replace status =  0.152    if jobfinal == 25 & bj_sex == 2
replace status =  0.0128   if jobfinal == 26 & bj_sex == 2
replace status =  0.096    if jobfinal == 27 & bj_sex == 2
replace status = -0.3258   if jobfinal == 28 & bj_sex == 2
replace status = -0.3304   if jobfinal == 29 & bj_sex == 2
replace status = -0.0431   if jobfinal == 30 & bj_sex == 2
replace status =  0.0442   if jobfinal == 31 & bj_sex == 2


preserve 

collapse (mean) status, by(jobfinal bj_sex)
reshape wide status, i(jobfinal) j(bj_sex) 
corr status1 status2


scatter status1 status2, mlabel(jobfinal) ///
    note("Data from BHPS wave 10. N=11,790", size(small) color(black)) ///
    legend(off) ///
    || lfit status1 status2 

restore 

preserve 

	replace jobfinal=. if jobfinal==9	
replace jobfinal=. if jobfinal==11
replace jobfinal=. if jobfinal==17
replace jobfinal=. if jobfinal==27

collapse (mean) status, by(jobfinal bj_sex)
reshape wide status, i(jobfinal) j(bj_sex) 
corr status1 status2


scatter status1 status2, mlabel(jobfinal) ///
    note("Data from BHPS wave 10. N=11,790", size(small) color(black)) ///
    legend(off) ///
    || lfit status1 status2 
	
restore 
*/

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


tab jobfinal bj_sex, row 

gen fem=.
replace fem=1 if bj_sex==2

egen total_females = total(fem), by(jobfinal)
egen total_workers = count(bj_sex), by(jobfinal)
gen female_percent = (total_females / total_workers) * 100


gen d2=. 
replace d2=0.0242 if(jobfinal==1)
replace d2=0.0469 if(jobfinal==2)
replace d2=0.0590 if(jobfinal==3)
replace d2=-0.0160 if(jobfinal==4)
replace d2=0.0282 if(jobfinal==5)
replace d2=0.0439 if(jobfinal==6)
replace d2=0.0651 if(jobfinal==7)
replace d2=0.0530  if(jobfinal==8)
replace d2=0.0771 if(jobfinal==9)
replace d2=-0.0853 if(jobfinal==10)
replace d2=0.0486 if(jobfinal==11)
replace d2=-0.0220 if(jobfinal==12)
replace d2=-0.0684 if(jobfinal==13)
replace d2=-0.0032 if(jobfinal==14)
replace d2=-0.0439 if(jobfinal==15)
replace d2=-0.0147 if(jobfinal==16)
replace d2=-0.0628 if(jobfinal==17)
replace d2=0.1312 if(jobfinal==18)
replace d2=0.1087 if(jobfinal==19)
replace d2=0.0020 if(jobfinal==20)
replace d2=0.0356 if(jobfinal==21)
replace d2=-0.0274 if(jobfinal==22)
replace d2=-0.0555 if(jobfinal==23)
replace d2=-0.0891 if(jobfinal==24)
replace d2=-0.0789 if(jobfinal==25)
replace d2=0.0310 if(jobfinal==26)
replace d2=-0.1752 if(jobfinal==27)
replace d2=0.0362 if(jobfinal==28)
replace d2=0.0776 if(jobfinal==29)
replace d2=0.0321 if(jobfinal==30)
replace d2=-0.1579 if(jobfinal==31)

corr female_percent d2

cd "G:\Stata data and do\do files\Status"

save status_working.dta, replace

keep if !missing(female_percent, d2)
corr female_percent d2

cd"G:\Stata data and do\do files\Status\figures" 

scatter female_percent d2, mlabel(jobfinal) ///
    ytitle("Percentage Female", size(small)) xtitle("MDS Second Dimension Score", size(small)) ///
    title("Second dimension scores plotted against percentage female in each occupation", size(small)) ///
	caption("Correlation: -0.78", size(small) color(red)) ///
    note("Data from BHPS wave 10. N=8,448", size(small) color(black)) ///
    legend(off) ///
    || lfit female_percent d2 
graph export femaleocc.png, replace
	
cd "G:\Stata data and do\do files\Status"

use status_working.dta, clear	

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

keep if !missing(status, chanstat, cambridge)


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

summarize status_z chanstat_z cambridge_z

gen yearlyincome= bj_fiyrl

replace yearlyincome=. if (yearlyincome<0)

gen zincome = (yearlyincome-8568.461)/11492.03
sum zincome 

egen median_income = median(yearlyincome), by(jobfinal)
replace median_income =. if(median_income<0)

* Generate a scatterplot of median income by social status with labels
scatter median_income status, mlabel(jobfinal) ///
    ytitle("Median Income", size(small)) xtitle("Social Status", size(small)) ///
    title("Scatterplot of Median Income by Social Status", size(small)) ///
    legend(off) ///
    || lfit median_income status
	
scatter median_income chanstat, mlabel(jobfinal) ///
    ytitle("Median Income", size(small)) xtitle("Social Status", size(small)) ///
    title("Scatterplot of Median Income by Social Status", size(small)) ///
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
* lot of these variables aren't measured in wave 10 but are in wave 9+11 
cd "G:\Stata data and do\BHPS + US\UKDA-6614-stata\stata\stata13_se\bhps_w11"

merge 1:1 pidp using bk_indresp.dta

cd"G:\Stata data and do\BHPS + US\UKDA-6614-stata\stata\stata13_se\bhps"
drop _merge

merge 1:m pidp using xwavedat.dta
drop _merge


* Licenses
tab bj_jbsoc90_cc
* All occupational titles listed fall under UK requirements for licensing bodies. https://www.gov.uk/government/publications/professions-regulated-by-law-in-the-uk-and-their-regulators/uk-regulated-professions-and-their-regulators

gen license=.
replace license=1 if bj_jbsoc90_cc==23
replace license=1 if bj_jbsoc90_cc==37

replace license=1 if bj_jbsoc90_cc==22
replace license=1 if bj_jbsoc90_cc==34
replace license=1 if bj_jbsoc90_cc==59
replace license=1 if bj_jbsoc90_cc==64


replace license=1 if bj_jbsoc90_cc==24
replace license=1 if bj_jbsoc90_cc==35

replace license=1 if bj_jbsoc90_cc==25
replace license=1 if bj_jbsoc90_cc==26
replace license=1 if bj_jbsoc90_cc==29

replace license=1 if bj_jbsoc90_cc==65

replace license=1 if bj_jbsoc90_cc==33
replace license=1 if bj_jbsoc90_cc==87
replace license=1 if bj_jbsoc90_cc==88
replace license=1 if bj_jbsoc90_cc==39

replace license=1 if bj_jbsoc90_cc==16
replace license=1 if bj_jbsoc90_cc==61

replace license=0 if license!=1 & bj_jbsoc90_cc!=.
tab license

* membership

gen politics=.
replace politics=0 if bk_orgm1==0
replace politics=1 if bk_orgm1==1

gen union=.
replace union=0 if bk_orgm2==0
replace union=1 if bk_orgm2==1

gen proforg=.
replace proforg=0 if bk_orgm10==0
replace proforg=1 if bk_orgm10==1

gen religion=.
replace religion=0 if bk_orgm6==0
replace religion=1 if bk_orgm6==1

tab bj_qfedhi

* credentialisation - barriers to entry 
gen degree=. 
replace degree=0 if bk_hiqual_dv>=3 & bk_hiqual_dv<=9
replace degree=1 if bk_hiqual_dv>=1 & bk_hiqual_dv<=2
tab degree


* Labour status 

* Welfare recipeient 
gen nonbenifit=. 
replace nonbenifit=1 if bj_jbub==2
replace nonbenifit=0 if bj_jbub==1
tab nonbenifit

* salaried professional
gen salary=.
replace salary=0 if bj_paytyp_bh==3
replace salary=0 if bj_paytyp_bh==4
replace salary=1 if bj_paytyp_bh==1
replace salary=1 if bj_paytyp_bh==2
replace salary=1 if bj_mrjsemp==2
tab salary

* service working
gen nonmanual=.
replace nonmanual=1 if (jobfinal>=1 & jobfinal <=17)
replace nonmanual=0 if (jobfinal>=18 & jobfinal <=31)
tab nonmanual


gen mono= license+politics+union+proforg+religion+degree+nonbenifit+salary+nonmanual

* Standardize the 'highbrow' variable
egen mean_mono = mean(mono)
egen sd_mono = sd(mono)
gen mono_z = (mono - mean_mono) / sd_mono

summarize mono_z 

* Internal Consistency 

cd"G:\Stata data and do\do files\Status"
save status_working, replace

keep if !missing(status_z, closeness_z, emerging_z, highbrow_z, mono_z)

alpha status_z closeness_z emerging_z highbrow_z mono_z, item 

corr status_z closeness_z emerging_z highbrow_z mono_z

alpha status_z closeness_z highbrow_z mono_z, item 

corr status_z closeness_z highbrow_z mono_z




*** FACTOR ANALYSIS ***

factor status_z closeness_z emerging_z highbrow_z mono_z, pcf

rotate

* emerging doesn't load onto factor1 well, drop it 


factor status_z closeness_z highbrow_z mono_z, pcf

rotate

predict factor1 





corr factor1 status_z chanstat_z cambridge_z median_income

cd"G:\Stata data and do\do files\Status\figures" 

screeplot, ///
title("Scree Plot of Eigenvalues after Factor Analysis", size(small)) ///
note("Data from BHPS wave 10. N=6,370", size(vsmall)) ///
caption("Data taken from standardised homophily, social closeness, highbrow consumption, and monopolistic acquisition measures", size(vsmall))
graph export eigenfactor.png, replace

sort factor1 

** drop prior standardised measures of cambridge and chanstat and re-generate because of keep if command above! 
summarize chanstat_z cambridge_z
drop chanstat_z cambridge_z mean_chanstat sd_chanstat mean_cambridge sd_cambridge

egen mean_chanstat= mean(chanstat)
egen sd_chanstat = sd(chanstat)
gen chanstat_z = (chanstat - mean_chanstat) / sd_chanstat

egen mean_cambridge= mean(cambridge)
egen sd_cambridge = sd(cambridge)
gen cambridge_z = (cambridge - mean_cambridge) / sd_cambridge


list factor1 status_z chanstat_z cambridge_z closeness_z highbrow_z mono_z if nssec==8

gsort factor1 

list factor1 status_z chanstat_z cambridge_z closeness_z highbrow_z mono_z if nssec==1

sort factor1 


hist factor1

mean factor1, over(jobfinal)

bysort jobfinal: egen mean_factor1 = mean(factor1)

bysort jobfinal: egen mean_chanstatd = mean(chanstat)

tabstat mean_factor1, by(jobfinal) statistics(mean) format(%9.2f)

* Regressions will need a standardised measure... 

egen mean_factor1_b = mean(mean_factor1)
egen sd_factor1 = sd(mean_factor1)
gen factor1_z = (mean_factor1 - mean_factor1_b) / sd_factor1

summarize factor1_z chanstat_z cambridge_z

keep if !missing(chanstat_z, factor1_z, cambridge_z)

corr chanstat factor1 cambridge

corr median_income factor1 
corr median_income chanstat 

corr median_income factor1 if bj_sex==1
corr median_income factor1 if bj_sex==2

ktau factor1 degree 
ktau factor1 degree if bj_sex==1
ktau factor1 degree if bj_sex==2

corr median_income mean_factor1

cd"G:\Stata data and do\do files\Status\figures"
twoway (scatter median_income mean_factor1, mlabel(jobfinal) msymbol(oh) msize(small) mlabsize(vsmall) mlabposition(12)) ///
       (lfit median_income mean_factor1), ///
       title("Scatter Plot of Median Income by Mean Stände Score", size(small)) ///
       xtitle("Mean Status Score", size(small)) ///
       ytitle("Median Income", size(small)) ///
       caption("Correlation: 0.58", size(small) color(red)) ///
       note("Data from BHPS wave 10. N=6,370", size(small) color(black))
graph export incomecorr.png, replace
	   
	   preserve
	   
	   keep if !missing(median_income, factor1, chanstat)
corr median_income factor1
corr median_income chanstat
corr factor1 chanstat

	  restore 


gen alevel=. 
replace alevel=1 if bj_qfedhi>=1 & bj_qfedhi<=6
replace alevel=0 if bj_qfedhi>=7 & bj_qfedhi<=12


egen total_with_alevel = total(alevel == 1), by(jobfinal)
egen total_individuals = count(alevel), by(jobfinal)

gen prop_alevel = total_with_alevel / total_individuals

	   
twoway (scatter prop_alevel mean_factor1, mlabel(jobfinal) msymbol(oh) msize(small) mlabsize(vsmall) mlabposition(12)) ///
       (lfit prop_alevel mean_factor1), ///
       title("Scatter Plot of Proportion of A'levels by Mean Stände Score", size(small)) ///
       xtitle("Mean Status Score", size(small)) ///
       ytitle("Proportion of A'Levels", size(small)) ///
       caption("Correlation: 0.89", size(small) color(red)) ///
       note("Data from BHPS wave 10. N=6,370", size(small) color(black))
graph export educorr.png, replace
	   
corr prop_alevel mean_factor1

	   preserve
	   
	   keep if !missing(prop_alevel, factor1, chanstat)
corr prop_alevel factor1
corr prop_alevel chanstat

	  restore 

**	   
svyset psu [pweight=bj_xrwtsw1], strata(strata) singleunit(scaled)


tabstat factor1_z, by(jobfinal) statistics(mean) format(%9.2f)
tabstat chanstat_z, by(jobfinal) statistics(mean) format(%9.2f)
tabstat cambridge_z, by(jobfinal) statistics(mean) format(%9.2f)

tabstat factor1_z, by(nssec) statistics(mean) format(%9.2f)
tabstat chanstat_z, by(nssec) statistics(mean) format(%9.2f)
tabstat cambridge_z, by(nssec) statistics(mean) format(%9.2f)

list factor1_z status_z chanstat_z cambridge_z nssec closeness_z highbrow_z mono_z if nssec==1
list factor1_z status_z chanstat_z cambridge_z nssec closeness_z highbrow_z mono_z if nssec==8



regress chanstat_z median_income prop_alevel

svy: regress chanstat_z median_income prop_alevel 
regress chanstat_z median_income prop_alevel

etable

regress factor1_z median_income prop_alevel

svy: regress factor1_z median_income prop_alevel 
regress factor1_z median_income prop_alevel

etable, append 

svy: regress cambridge_z median_income prop_alevel 
regress cambridge_z median_income prop_alevel 
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
		note("Data Source: BHPS. Adjusted for Complex Sample. N=6,370") ///
		notestyles(font(Book Antiqua, size(8) italic)) ///
		export("incomeeducationreg.docx", replace)



***
gen finaljob=jobfinal

lab val nssec nssec

graph box factor1, over(nssec) ///
    ytitle("Social Status", size(small)) 
graph save nssecstatus1.gph, replace
graph export nssecstatus1.png, replace

graph box chanstat, over(nssec) ///
    ytitle("Chan-Goldthorpe Scale", size(small)) 
graph save nssecstatus2.gph, replace
graph export nssecstatus2.png, replace

graph combine nssecstatus1.gph nssecstatus2.gph, ///
   title("Comparison Box Plot of Status Measures by NS-SEC Categories", size(small)) ///
   note("Data from BHPS wave 10. N=6,370", size(vsmall) color(black))
graph export boxplotnsseccomp.png, replace


graph box factor1, over(nssec) ///
   ytitle("Stände", size(small)) ///
   title("Box Plot of Stände by NS-SEC Categories", size(small)) ///
   note("Data from BHPS wave 10. N=6,370", size(vsmall) color(black))
graph save nssecstatus3.gph, replace
graph export nssecstatus3.png, replace


graph bar (count) factor1, ///
    over(finaljob) ///
    by(nssec, title("Count of Occupations Ordered by Stände within each NS-SEC Category", size(small))) ///
    ytitle("Count", size(vsmall)) ///
    ylabel(, labsize(vsmall)) 
	





graph bar (percent) factor1, over(nssec) 


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

svy: logit smoke factor1_z ib3.nssec
margins, at(factor1_z=(-1.7(0.2)2.4))

marginsplot, ciopts(fcolor(blue%20)) ///
	title("") ///
    ytitle("Predicted Probabilities of Not Smoking", size(vsmall)) ///
    xtitle("Stände Scale", size(vsmall)) ///
    plotopts(lwidth(medium)) ///
    recast(line) ///
    xscale(range(-1.7 2.4)) ///
    xlabel(-1.7(0.2)2.4, labsize(tiny)) ///	
    ylabel(0.5(0.05)0.9, labsize(tiny)) ///	
	name(plot1, replace) ///
	saving(plot1, replace)

khb logit smoke ib3.nssec || factor1_z , summary

svy: logit smoke chanstat_z ib3.nssec
etable, append

svy: logit smoke chanstat_z ib3.nssec
margins, at(chanstat_z=(-1.7(0.2)1.6))

marginsplot, ciopts(fcolor(blue%20)) ///
	title("") ///
    ytitle("Predicted Probabilities of Not Smoking", size(vsmall)) ///
    xtitle("Chan-Goldthorpe Scale", size(vsmall)) ///
    plotopts(lwidth(medium)) ///
    recast(line) ///
    xscale(range(-1.7 1.6)) ///
    xlabel(-1.7(0.2)1.6, labsize(tiny)) ///	
    ylabel(0.5(0.05)0.9, labsize(tiny)) ///	
	name(plot2, replace) ///
	saving(plot2, replace)
	
khb logit smoke ib3.nssec || chanstat_z , summary


svy: logit smoke cambridge_z ib3.nssec
etable, append

svy: logit smoke cambridge_z ib3.nssec
margins, at(cambridge_z=(-2.0(0.2)3.2))

marginsplot, ciopts(fcolor(blue%20)) ///
	title("") ///
    ytitle("Predicted Probabilities of Not Smoking", size(vsmall)) ///
    xtitle("Cambridge Scale", size(vsmall)) ///
    plotopts(lwidth(medium)) ///
    recast(line) ///
    xscale(range(-2 3.2)) ///
    xlabel(-2(0.2)3.2, labsize(tiny)) ///
    ylabel(0.5(0.05)0.9, labsize(tiny)) ///	
	name(plot3, replace) ///
	saving(plot3, replace)


khb logit smoke ib3.nssec || cambridge_z , summary

graph combine plot1 plot2 plot3, ycommon ///
title("Comparison of Predicted Probabilities of Social Status Measures", size(small)) ///
subtitle("Probability of Not Smoking", size(vsmall)) ///
note("Data Source: BHPS. Adjusted for Complex Sample. N=6,365", size(vsmall)) ///
caption("Produced to avert the rescaling issues of comparing non-linear models main effects", size(vsmall))
graph save smokingmargins.gph, replace
graph export smokingmargins.png, replace


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
		note("Data Source: BHPS. Adjusted for Complex Sample. N=6,365") ///
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

svy: logit vote factor1_z ib3.nssec
margins, at(factor1_z=(-1.7(0.2)2.4))
marginsplot, ciopts(fcolor(blue%20)) ///
	title("") ///
    ytitle("Predicted Probabilities of Not Voting", size(vsmall)) ///
    xtitle("Stände Scale", size(vsmall)) ///
    plotopts(lwidth(medium)) ///
    recast(line) ///
    xscale(range(-1.7 2.4)) ///
    xlabel(-1.7(0.2)2.4, labsize(tiny)) ///	
    ylabel(0.1(0.05)0.4, labsize(tiny)) ///	
	name(plot1, replace) ///
	saving(plot1, replace)

svy: logit vote chanstat_z ib3.nssec
etable, append

svy: logit vote chanstat_z ib3.nssec
margins, at(chanstat_z=(-1.7(0.2)1.6))

marginsplot, ciopts(fcolor(blue%20)) ///
	title("") ///
    ytitle("Predicted Probabilities of Not Voting", size(vsmall)) ///
    xtitle("Chan-Goldthorpe Scale", size(vsmall)) ///
    plotopts(lwidth(medium)) ///
    recast(line) ///
    xscale(range(-1.7 1.6)) ///
    xlabel(-1.7(0.2)1.6, labsize(tiny)) ///	
    ylabel(0.1(0.05)0.4, labsize(tiny)) ///	
	name(plot2, replace) ///
	saving(plot2, replace)

svy: logit vote cambridge_z ib3.nssec
etable, append

svy: logit vote cambridge_z ib3.nssec
margins, at(cambridge_z=(-2.0(0.2)3.2))

marginsplot, ciopts(fcolor(blue%20)) ///
	title("") ///
    ytitle("Predicted Probabilities of Not Voting", size(vsmall)) ///
    xtitle("Cambridge Scale", size(vsmall)) ///
    plotopts(lwidth(medium)) ///
    recast(line) ///
    xscale(range(-2 3.2)) ///
    xlabel(-2(0.2)3.2, labsize(tiny)) ///
    ylabel(0.1(0.05)0.4, labsize(tiny)) ///	
	name(plot3, replace) ///
	saving(plot3, replace)
	
graph combine plot1 plot2 plot3, ycommon ///
title("Comparison of Predicted Probabilities of Social Status Measures", size(small)) ///
subtitle("Probability of Not Voting in Last Election", size(vsmall)) ///
note("Data Source: BHPS. Adjusted for Complex Sample. N=6,142", size(vsmall)) ///
caption("Produced to avert the rescaling issues of comparing non-linear models main effects", size(vsmall))
graph save votingmargins.gph, replace
graph export votingmargins.png, replace	
	

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
		note("Data Source: BHPS. Adjusted for Complex Sample. N=6,142") ///
		notestyles(font(Book Antiqua, size(8) italic)) ///
		export("votingstatus.docx", replace)

* attittude scale

collect clear 

gen wealth=.
replace wealth= bj_ophlc if bj_ophlc>=1 & bj_ophlc<=5

lab def wealth 1"Strong Agree" 2"Agree" 3"Not Agree" 4"Disagree" 5"Strongly Disagree"
lab val wealth

svy: ologit wealth ib3.nssec
etable

svy: ologit wealth factor1_z ib3.nssec
etable, append

svy: ologit wealth factor1_z ib3.nssec
margins, at(factor1_z=(-1.7(0.2)2.4))
marginsplot, ciopts(fcolor(blue%20)) ///
    title("") ///
    ytitle("Predicted Probabilities of Fairness", size(vsmall)) ///
    xtitle("Stände Scale", size(vsmall)) ///
    plotopts(lwidth(medium)) ///
    recast(line) ///
    xscale(range(-1.7 2.4)) ///
    xlabel(-1.7(0.2)2.4, labsize(tiny)) ///	
    ylabel(0.0(0.05)0.45, labsize(tiny)) ///	
    legend(off) ///
    name(plot1, replace) ///
    saving(plot1, replace)

svy: ologit wealth chanstat_z ib3.nssec
etable, append

svy: ologit wealth chanstat_z ib3.nssec
margins, at(chanstat_z=(-1.7(0.2)1.6))
marginsplot, ciopts(fcolor(blue%20)) ///
	title("") ///
    ytitle("Predicted Probabilities of Fairness", size(vsmall)) ///
    xtitle("Chan-Goldthorpe Scale", size(vsmall)) ///
    plotopts(lwidth(medium)) ///
    recast(line) ///
    xscale(range(-1.7 1.6)) ///
    xlabel(-1.7(0.2)1.6, labsize(tiny)) ///	
    ylabel(0.0(0.05)0.45, labsize(tiny)) ///	
    legend(off) ///
    name(plot2, replace) ///
    saving(plot2, replace)

svy: ologit wealth cambridge_z ib3.nssec
etable, append

svy: ologit wealth cambridge_z ib3.nssec
margins, at(cambridge_z=(-2.0(0.2)3.2))
marginsplot, ciopts(fcolor(blue%20)) ///
	title("") ///
    ytitle("Predicted Probabilities of Fairness", size(vsmall)) ///
    xtitle("Cambridge Scale", size(vsmall)) ///
    plotopts(lwidth(medium)) ///
    recast(line) ///
    xscale(range(-2 3.2)) ///
    xlabel(-2(0.2)3.2, labsize(tiny)) ///
    ylabel(0.0(0.05)0.45, labsize(tiny)) ///	
    legend(off) ///
    name(plot3, replace) ///
    saving(plot3, replace)
	
	
graph combine plot1 plot2 plot3, ycommon ///
title("Comparison of Predicted Probabilities of Social Status Measures", size(small)) ///
subtitle("Probability of 'Unfair that wealth buys medical priority'", size(vsmall)) ///
note("Data Source: BHPS. Adjusted for Complex Sample. N=6,362", size(vsmall)) ///
caption("Produced to avert the rescaling issues of comparing non-linear models main effects", size(vsmall))
graph save wealthmargins.gph, replace
graph export wealthmargins.png, replace	
	

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
		note("Data Source: BHPS. Adjusted for Complex Sample. N=6,362") ///
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

svy: logit unspell ib3.nssec factor1_z
margins, at(factor1_z=(-1.7(0.2)2.4))
marginsplot, ciopts(fcolor(blue%20)) ///
	title("") ///
    ytitle("Predicted Probabilities of Unemployment Spell", size(vsmall)) ///
    xtitle("Stände Scale", size(vsmall)) ///
    plotopts(lwidth(medium)) ///
    recast(line) ///
    xscale(range(-1.7 2.4)) ///
    xlabel(-1.7(0.2)2.4, labsize(tiny)) ///	
    ylabel(0.0(0.01)0.1, labsize(tiny)) ///	
	name(plot1, replace) ///
	saving(plot1, replace)

svy: logit unspell ib3.nssec chanstat_z
etable, append
svy: logit unspell ib3.nssec chanstat_z

margins, at(chanstat_z=(-1.7(0.2)1.6))
marginsplot, ciopts(fcolor(blue%20)) ///
	title("") ///
    ytitle("Predicted Probabilities of Unemployment Spell", size(vsmall)) ///
    xtitle("Chan-Goldthorpe Scale", size(vsmall)) ///
    plotopts(lwidth(medium)) ///
    recast(line) ///
    xscale(range(-1.7 1.6)) ///
    xlabel(-1.7(0.2)1.6, labsize(tiny)) ///	
    ylabel(0.0(0.01)0.1, labsize(tiny)) ///	
	name(plot2, replace) ///
	saving(plot2, replace)

svy: logit unspell ib3.nssec cambridge_z
etable, append
svy: logit unspell ib3.nssec cambridge_z

margins, at(cambridge_z=(-2.0(0.2)3.2))
marginsplot, ciopts(fcolor(blue%20)) ///
	title("") ///
    ytitle("Predicted Probabilities of Unemployment Spell", size(vsmall)) ///
    xtitle("Cambridge Scale", size(vsmall)) ///
    plotopts(lwidth(medium)) ///
    recast(line) ///
    xscale(range(-2 3.2)) ///
    xlabel(-2(0.2)3.2, labsize(tiny)) ///
    ylabel(0.0(0.01)0.1, labsize(tiny)) ///	
	name(plot3, replace) ///
	saving(plot3, replace)
	
graph combine plot1 plot2 plot3, ycommon ///
title("Comparison of Predicted Probabilities of Social Status Measures", size(small)) ///
subtitle("Probability of Unemployment Spell", size(vsmall)) ///
note("Data Source: BHPS. Adjusted for Complex Sample. N=6,369", size(vsmall)) ///
caption("Produced to avert the rescaling issues of comparing non-linear models main effects", size(vsmall))
graph save unempmargins.gph, replace
graph export unempmargins.png, replace		
	
	

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
		note("Data Source: BHPS. Adjusted for Complex Sample. N=6,369") ///
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

svy: ologit homo factor1_z ib3.nssec
margins, at(factor1_z=(-1.7(0.2)2.4))
marginsplot, ciopts(fcolor(blue%20)) ///
    title("") ///
    ytitle("Predicted Probabilities of Gay Relationships", size(vsmall)) ///
    xtitle("Stände Scale", size(vsmall)) ///
    plotopts(lwidth(medium)) ///
    recast(line) ///
    xscale(range(-1.7 2.4)) ///
    xlabel(-1.7(0.2)2.4, labsize(tiny)) ///	
    ylabel(0(0.05)0.5, labsize(tiny)) ///	
    legend(off) ///
    name(plot1, replace) ///
    saving(plot1, replace)

svy: ologit homo chanstat_z ib3.nssec
etable, append 

svy: ologit homo chanstat_z ib3.nssec
margins, at(chanstat_z=(-1.7(0.2)1.6))
marginsplot, ciopts(fcolor(blue%20)) ///
	title("") ///
    ytitle("Predicted Probabilities of Gay Relationships", size(vsmall)) ///
    xtitle("Chan-Goldthorpe Scale", size(vsmall)) ///
    plotopts(lwidth(medium)) ///
    recast(line) ///
    xscale(range(-1.7 1.6)) ///
    xlabel(-1.7(0.2)1.6, labsize(tiny)) ///	
    ylabel(0(0.05)0.5, labsize(tiny)) ///	
    legend(off) ///
    name(plot2, replace) ///
    saving(plot2, replace)

svy: ologit homo cambridge_z ib3.nssec
etable, append 

svy: ologit homo cambridge_z ib3.nssec
margins, at(cambridge_z=(-2.0(0.2)3.2))
marginsplot, ciopts(fcolor(blue%20)) ///
	title("") ///
    ytitle("Predicted Probabilities of Gay Relationships", size(vsmall)) ///
    xtitle("Cambridge Scale", size(vsmall)) ///
    plotopts(lwidth(medium)) ///
    recast(line) ///
    xscale(range(-2 3.2)) ///
    xlabel(-2(0.2)3.2, labsize(tiny)) ///
    ylabel(0(0.05)0.5, labsize(tiny)) ///	
    legend(off) ///
    name(plot3, replace) ///
    saving(plot3, replace)

	
graph combine plot1 plot2 plot3, ycommon ///
title("Comparison of Predicted Probabilities of Social Status Measures", size(small)) ///
subtitle("Probability of 'Views that Homosexual Relationships are Wrong'", size(vsmall)) ///
note("Data Source: BHPS. Adjusted for Complex Sample. N=6,362", size(vsmall)) ///
caption("Produced to avert the rescaling issues of comparing non-linear models main effects", size(vsmall))
graph save homomargins.gph, replace
graph export homomargins.png, replace		

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
		note("Data Source: BHPS. Adjusted for Complex Sample. N=6,352") ///
		notestyles(font(Book Antiqua, size(8) italic)) ///
		export("homoreg.docx", replace)


***
*Attitudes Survey


tabstat factor1_z, by(jobfinal) statistics(mean) format(%9.4f)
tabstat chanstat_z, by(jobfinal) statistics(mean) format(%9.4f)
tabstat cambridge_z, by(jobfinal) statistics(mean) format(%9.4f)

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
replace mog=99 if rnsoc90==990 


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

gen status = .
replace status = 0.7129   if jobfinal == 1
replace status = 0.1848   if jobfinal == 2
replace status = 0.6918   if jobfinal == 3
replace status = -0.1263  if jobfinal == 4
replace status = 0.5423   if jobfinal == 5
replace status = 0.6442   if jobfinal == 6
replace status = 1.2772   if jobfinal == 7
replace status = 2.0767   if jobfinal == 8
replace status = 0.5531   if jobfinal == 9
replace status = 1.0405   if jobfinal == 10
replace status = 0.9251   if jobfinal == 11
replace status = 0.2129   if jobfinal == 12
replace status = 0.2224   if jobfinal == 13
replace status = 0.1948   if jobfinal == 14
replace status = 0.0803   if jobfinal == 15
replace status = -0.4652  if jobfinal == 16
replace status = 0.2161   if jobfinal == 17
replace status = -0.8858  if jobfinal == 18
replace status = -1.1361  if jobfinal == 19
replace status = -0.8134  if jobfinal == 20
replace status = 0.2041   if jobfinal == 21
replace status = -0.7235  if jobfinal == 22
replace status = -0.4342  if jobfinal == 23
replace status = -0.373   if jobfinal == 24
replace status = 0.1927   if jobfinal == 25
replace status = 0.1227   if jobfinal == 26
replace status = -0.8153  if jobfinal == 27
replace status = -1.4892  if jobfinal == 28
replace status = -0.7292  if jobfinal == 29
replace status = -0.7844  if jobfinal == 30
replace status = -1.1125  if jobfinal == 31


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
replace trad=1 if tradvals==5
replace trad=2 if tradvals==4
replace trad=3 if tradvals==3
replace trad=4 if tradvals==2
replace trad=5 if tradvals==1

gen stiff=.
replace stiff=1 if stifsent==5
replace stiff=2 if stifsent==4
replace stiff=3 if stifsent==3
replace stiff=4 if stifsent==2
replace stiff=5 if stifsent==1

gen death=.
replace death=1 if deathapp==5
replace death=2 if deathapp==4
replace death=3 if deathapp==3
replace death=4 if deathapp==2
replace death=5 if deathapp==1

gen school=.
replace school=1 if obey==5
replace school=2 if obey==4
replace school=3 if obey==3
replace school=4 if obey==2
replace school=5 if obey==1

gen wrong=.
replace wrong=1 if wronglaw==5
replace wrong=2 if wronglaw==4
replace wrong=3 if wronglaw==3
replace wrong=4 if wronglaw==2
replace wrong=5 if wronglaw==1

gen film=.
replace film=1 if censor==5
replace film=2 if censor==4
replace film=3 if censor==3
replace film=4 if censor==2
replace film=5 if censor==1

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


keep if !missing(leftright, age, rsex, income, qual, nssec, status, chanstat, authlib)

egen mean_status= mean(status)
egen sd_status = sd(status)
gen status_z = (status - mean_status) / sd_status


egen mean_chanstat= mean(chanstat)
egen sd_chanstat = sd(chanstat)
gen chanstat_z = (chanstat - mean_chanstat) / sd_chanstat 

summarize status_z chanstat_z

collect clear
regress leftright age rsex ib1.income ib1.qual ib3.nssec status_z [pweight=wtfactor]
etable
	
regress leftright age rsex ib1.income ib1.qual ib3.nssec chanstat_z [pweight=wtfactor]
etable, append
	
	
regress authlib age rsex ib1.income ib1.qual ib1.nssec c.status_z [pweight=wtfactor]
etable, append

margins, at(status_z=(-1.60(0.2)2.4)) atmeans saving(plot1, replace)
marginsplot, ///
    recast(line) ///
    recastci(rarea) ///
    ciopts(fcolor(blue%20)) ///
    title("") ///
    ytitle("Predicted Libertarian-Authoritarian Score") ///
    xtitle("Stände Scale") ///
    xlabel( , labsize(tiny)) ///
    ylabel( , labsize(tiny)) ///
    plotopts(lwidth(medium)) ///
    xscale(range(-1.6 2.5)) ///
    name(plot1, replace) ///
    saving(plot1, replace)


regress authlib age rsex ib1.income ib1.qual ib1.nssec c.chanstat_z [pweight=wtfactor]

etable, append

margins, at(chanstat_z=(-1.8(0.2)1.6)) atmeans saving(plot2, replace)
marginsplot, ///
    recast(line) ///
    recastci(rarea) ///
    ciopts(fcolor(blue%20)) ///
    title("") ///
    ytitle("Predicted Libertarian-Authoritarian Score") ///
    xtitle("Chan-Goldthorpe Scale") ///
    xlabel( , labsize(tiny)) ///
    ylabel( , labsize(tiny)) ///
    plotopts(lwidth(medium)) ///
    xscale(range(-1.6 1.6)) ///
    name(plot2, replace) ///
    saving(plot2, replace)


graph combine plot1 plot2, ycommon ///
title("Comparison of Social Status Measures on Libertarian-Authoritarian Axis", size(small)) ///
note("Data Source: BSA 2001. N=2,538", size(vsmall)) ///
caption("Social Status Measures Standardised. Appropriately weighted.", size(vsmall))


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
		note("Data Source: BHPS. Adjusted for Complex Sample. N=2,538") ///
		notestyles(font(Book Antiqua, size(8) italic)) ///
		export("polticalaxis2001.docx", replace)



* Nearly double the substantive effect, my measure appears to be slightly more sensitive. 



*** use 2002 survey now... 

use "G:\Stata data and do\British Social Attitudes 2002\stata\stata6\bsa02", clear


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
replace mog=99 if rnsoc90==990 


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

gen status = .
replace status = 0.7129   if jobfinal == 1
replace status = 0.1848   if jobfinal == 2
replace status = 0.6918   if jobfinal == 3
replace status = -0.1263  if jobfinal == 4
replace status = 0.5423   if jobfinal == 5
replace status = 0.6442   if jobfinal == 6
replace status = 1.2772   if jobfinal == 7
replace status = 2.0767   if jobfinal == 8
replace status = 0.5531   if jobfinal == 9
replace status = 1.0405   if jobfinal == 10
replace status = 0.9251   if jobfinal == 11
replace status = 0.2129   if jobfinal == 12
replace status = 0.2224   if jobfinal == 13
replace status = 0.1948   if jobfinal == 14
replace status = 0.0803   if jobfinal == 15
replace status = -0.4652  if jobfinal == 16
replace status = 0.2161   if jobfinal == 17
replace status = -0.8858  if jobfinal == 18
replace status = -1.1361  if jobfinal == 19
replace status = -0.8134  if jobfinal == 20
replace status = 0.2041   if jobfinal == 21
replace status = -0.7235  if jobfinal == 22
replace status = -0.4342  if jobfinal == 23
replace status = -0.373   if jobfinal == 24
replace status = 0.1927   if jobfinal == 25
replace status = 0.1227   if jobfinal == 26
replace status = -0.8153  if jobfinal == 27
replace status = -1.4892  if jobfinal == 28
replace status = -0.7292  if jobfinal == 29
replace status = -0.7844  if jobfinal == 30
replace status = -1.1125  if jobfinal == 31

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
replace trad=1 if tradvals==5
replace trad=2 if tradvals==4
replace trad=3 if tradvals==3
replace trad=4 if tradvals==2
replace trad=5 if tradvals==1

gen stiff=.
replace stiff=1 if stifsent==5
replace stiff=2 if stifsent==4
replace stiff=3 if stifsent==3
replace stiff=4 if stifsent==2
replace stiff=5 if stifsent==1

gen death=.
replace death=1 if deathapp==5
replace death=2 if deathapp==4
replace death=3 if deathapp==3
replace death=4 if deathapp==2
replace death=5 if deathapp==1

gen school=.
replace school=1 if obey==5
replace school=2 if obey==4
replace school=3 if obey==3
replace school=4 if obey==2
replace school=5 if obey==1

gen wrong=.
replace wrong=1 if wronglaw==5
replace wrong=2 if wronglaw==4
replace wrong=3 if wronglaw==3
replace wrong=4 if wronglaw==2
replace wrong=5 if wronglaw==1

gen film=.
replace film=1 if censor==5
replace film=2 if censor==4
replace film=3 if censor==3
replace film=4 if censor==2
replace film=5 if censor==1

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


keep if !missing(leftright, age, rsex, income, qual, nssec, status, chanstat, authlib)

egen mean_status= mean(status)
egen sd_status = sd(status)
gen status_z = (status - mean_status) / sd_status


egen mean_chanstat= mean(chanstat)
egen sd_chanstat = sd(chanstat)
gen chanstat_z = (chanstat - mean_chanstat) / sd_chanstat 

summarize status_z chanstat_z


collect clear
regress leftright age rsex ib1.income ib1.qual ib3.nssec status_z [pweight=wtfactor]
etable
	
regress leftright age rsex ib1.income ib1.qual ib3.nssec chanstat_z [pweight=wtfactor]
etable, append
	
	
regress authlib age rsex ib1.income ib1.qual ib1.nssec c.status_z [pweight=wtfactor]
etable, append

margins, at(status_z=(-1.6(0.2)2.4)) atmeans saving(plot1, replace)
marginsplot, ///
    recast(line) ///
    recastci(rarea) ///
    ciopts(fcolor(blue%20)) ///
    title("") ///
    ytitle("Predicted Libertarian-Authoritarian Score") ///
    xtitle("Stände Scale") ///
    xlabel( , labsize(tiny)) ///
    ylabel( , labsize(tiny)) ///
    plotopts(lwidth(medium)) ///
    xscale(range(-1.6 2.5)) ///
    name(plot1, replace) ///
    saving(plot1, replace)


regress authlib age rsex ib1.income ib1.qual ib1.nssec c.chanstat_z [pweight=wtfactor]

etable, append

margins, at(chanstat_z=(-1.8(0.2)1.6)) atmeans saving(plot2, replace)
marginsplot, ///
    recast(line) ///
    recastci(rarea) ///
    ciopts(fcolor(blue%20)) ///
    title("") ///
    ytitle("Predicted Libertarian-Authoritarian Score") ///
    xtitle("Chan-Goldthorpe Scale") ///
    xlabel( , labsize(tiny)) ///
    ylabel( , labsize(tiny)) ///
    plotopts(lwidth(medium)) ///
    xscale(range(-1.6 1.6)) ///
    name(plot2, replace) ///
    saving(plot2, replace)


graph combine plot1 plot2, ycommon ///
title("Comparison of Social Status Measures on Libertarian-Authoritarian Axis", size(small)) ///
note("Data Source: BSA 2002. N=2,466", size(vsmall)) ///
caption("Social Status Measures Standardised. Appropriately weighted.", size(vsmall))


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
		note("Data Source: BSA 2002. Appropriately weighted. N=2,466") ///
		notestyles(font(Book Antiqua, size(8) italic)) ///
		export("polticalaxis2002.docx", replace)



		
		
*** 2003 
		
use "G:\Stata data and do\British Social Attitudes 2003\stata\stata6\bsa03", clear


gen mog=. 
replace mog=10 if rsoc90>=100 & rsoc90<=109
replace mog=11 if rsoc90>=110 & rsoc90<=119
replace mog=12 if rsoc90>=120 & rsoc90<=129
replace mog=13 if rsoc90>=130 & rsoc90<=139
replace mog=14 if rsoc90>=140 & rsoc90<=149
replace mog=15 if rsoc90>=150 & rsoc90<=159
replace mog=16 if rsoc90>=160 & rsoc90<=169
replace mog=17 if rsoc90>=170 & rsoc90<=179
replace mog=18 if rsoc90>=180 & rsoc90<=189
replace mog=19 if rsoc90>=190 & rsoc90<=199

replace mog=20 if rsoc90>=200 & rsoc90<=209
replace mog=21 if rsoc90>=210 & rsoc90<=219
replace mog=22 if rsoc90>=220 & rsoc90<=229
replace mog=23 if rsoc90>=230 & rsoc90<=239
replace mog=24 if rsoc90>=240 & rsoc90<=249
replace mog=25 if rsoc90>=250 & rsoc90<=259
replace mog=26 if rsoc90>=260 & rsoc90<=269
replace mog=27 if rsoc90>=270 & rsoc90<=279
replace mog=28 if rsoc90>=280 & rsoc90<=289
replace mog=29 if rsoc90>=290 & rsoc90<=299

replace mog=30 if rsoc90>=300 & rsoc90<=309
replace mog=31 if rsoc90>=310 & rsoc90<=319
replace mog=32 if rsoc90>=320 & rsoc90<=329
replace mog=33 if rsoc90>=330 & rsoc90<=339
replace mog=34 if rsoc90>=340 & rsoc90<=349
replace mog=35 if rsoc90>=350 & rsoc90<=359
replace mog=36 if rsoc90>=360 & rsoc90<=369
replace mog=37 if rsoc90>=370 & rsoc90<=379
replace mog=38 if rsoc90>=380 & rsoc90<=389
replace mog=39 if rsoc90>=390 & rsoc90<=399

replace mog=40 if rsoc90>=400 & rsoc90<=409
replace mog=41 if rsoc90>=410 & rsoc90<=419
replace mog=42 if rsoc90>=420 & rsoc90<=429
replace mog=43 if rsoc90>=430 & rsoc90<=439
replace mog=44 if rsoc90>=440 & rsoc90<=449
replace mog=45 if rsoc90>=450 & rsoc90<=459
replace mog=46 if rsoc90>=460 & rsoc90<=469
replace mog=47 if rsoc90>=470 & rsoc90<=479
replace mog=48 if rsoc90>=480 & rsoc90<=489
replace mog=49 if rsoc90>=490 & rsoc90<=499

replace mog=50 if rsoc90>=500 & rsoc90<=509
replace mog=51 if rsoc90>=510 & rsoc90<=519
replace mog=52 if rsoc90>=520 & rsoc90<=529
replace mog=53 if rsoc90>=530 & rsoc90<=539
replace mog=54 if rsoc90>=540 & rsoc90<=549
replace mog=55 if rsoc90>=550 & rsoc90<=559
replace mog=56 if rsoc90>=560 & rsoc90<=569
replace mog=57 if rsoc90>=570 & rsoc90<=579
replace mog=58 if rsoc90>=580 & rsoc90<=589
replace mog=59 if rsoc90>=590 & rsoc90<=599

replace mog=60 if rsoc90>=600 & rsoc90<=609
replace mog=61 if rsoc90>=610 & rsoc90<=619
replace mog=62 if rsoc90>=620 & rsoc90<=629
replace mog=63 if rsoc90>=630 & rsoc90<=639
replace mog=64 if rsoc90>=640 & rsoc90<=649
replace mog=65 if rsoc90>=650 & rsoc90<=659
replace mog=66 if rsoc90>=660 & rsoc90<=669
replace mog=67 if rsoc90>=670 & rsoc90<=679
replace mog=68 if rsoc90>=680 & rsoc90<=689
replace mog=69 if rsoc90>=690 & rsoc90<=699

replace mog=70 if rsoc90>=700 & rsoc90<=709
replace mog=71 if rsoc90>=710 & rsoc90<=719
replace mog=72 if rsoc90>=720 & rsoc90<=729
replace mog=73 if rsoc90>=730 & rsoc90<=739
replace mog=74 if rsoc90>=740 & rsoc90<=749
replace mog=75 if rsoc90>=750 & rsoc90<=759
replace mog=76 if rsoc90>=760 & rsoc90<=769
replace mog=77 if rsoc90>=770 & rsoc90<=779
replace mog=78 if rsoc90>=780 & rsoc90<=789
replace mog=79 if rsoc90>=790 & rsoc90<=799

replace mog=80 if rsoc90>=800 & rsoc90<=809
replace mog=81 if rsoc90>=810 & rsoc90<=819
replace mog=82 if rsoc90>=820 & rsoc90<=829
replace mog=83 if rsoc90>=830 & rsoc90<=839
replace mog=84 if rsoc90>=840 & rsoc90<=849
replace mog=85 if rsoc90>=850 & rsoc90<=859
replace mog=86 if rsoc90>=860 & rsoc90<=869
replace mog=87 if rsoc90>=870 & rsoc90<=879
replace mog=88 if rsoc90>=880 & rsoc90<=889
replace mog=89 if rsoc90>=890 & rsoc90<=899

replace mog=90 if rsoc90>=900 & rsoc90<=909
replace mog=91 if rsoc90>=910 & rsoc90<=919
replace mog=92 if rsoc90>=920 & rsoc90<=929
replace mog=93 if rsoc90>=930 & rsoc90<=939
replace mog=94 if rsoc90>=940 & rsoc90<=949
replace mog=95 if rsoc90>=950 & rsoc90<=959
replace mog=96 if rsoc90>=960 & rsoc90<=969
replace mog=97 if rsoc90>=970 & rsoc90<=979
replace mog=98 if rsoc90>=980 & rsoc90<=989
replace mog=99 if rsoc90==990 


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

gen status = .
replace status = 0.7129   if jobfinal == 1
replace status = 0.1848   if jobfinal == 2
replace status = 0.6918   if jobfinal == 3
replace status = -0.1263  if jobfinal == 4
replace status = 0.5423   if jobfinal == 5
replace status = 0.6442   if jobfinal == 6
replace status = 1.2772   if jobfinal == 7
replace status = 2.0767   if jobfinal == 8
replace status = 0.5531   if jobfinal == 9
replace status = 1.0405   if jobfinal == 10
replace status = 0.9251   if jobfinal == 11
replace status = 0.2129   if jobfinal == 12
replace status = 0.2224   if jobfinal == 13
replace status = 0.1948   if jobfinal == 14
replace status = 0.0803   if jobfinal == 15
replace status = -0.4652  if jobfinal == 16
replace status = 0.2161   if jobfinal == 17
replace status = -0.8858  if jobfinal == 18
replace status = -1.1361  if jobfinal == 19
replace status = -0.8134  if jobfinal == 20
replace status = 0.2041   if jobfinal == 21
replace status = -0.7235  if jobfinal == 22
replace status = -0.4342  if jobfinal == 23
replace status = -0.373   if jobfinal == 24
replace status = 0.1927   if jobfinal == 25
replace status = 0.1227   if jobfinal == 26
replace status = -0.8153  if jobfinal == 27
replace status = -1.4892  if jobfinal == 28
replace status = -0.7292  if jobfinal == 29
replace status = -0.7844  if jobfinal == 30
replace status = -1.1125  if jobfinal == 31

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
replace trad=1 if tradvals==5
replace trad=2 if tradvals==4
replace trad=3 if tradvals==3
replace trad=4 if tradvals==2
replace trad=5 if tradvals==1

gen stiff=.
replace stiff=1 if stifsent==5
replace stiff=2 if stifsent==4
replace stiff=3 if stifsent==3
replace stiff=4 if stifsent==2
replace stiff=5 if stifsent==1

gen death=.
replace death=1 if deathapp==5
replace death=2 if deathapp==4
replace death=3 if deathapp==3
replace death=4 if deathapp==2
replace death=5 if deathapp==1

gen school=.
replace school=1 if obey==5
replace school=2 if obey==4
replace school=3 if obey==3
replace school=4 if obey==2
replace school=5 if obey==1

gen wrong=.
replace wrong=1 if wronglaw==5
replace wrong=2 if wronglaw==4
replace wrong=3 if wronglaw==3
replace wrong=4 if wronglaw==2
replace wrong=5 if wronglaw==1

gen film=.
replace film=1 if censor==5
replace film=2 if censor==4
replace film=3 if censor==3
replace film=4 if censor==2
replace film=5 if censor==1

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


keep if !missing(leftright, age, rsex, income, qual, nssec, status, chanstat, authlib)

egen mean_status= mean(status)
egen sd_status = sd(status)
gen status_z = (status - mean_status) / sd_status


egen mean_chanstat= mean(chanstat)
egen sd_chanstat = sd(chanstat)
gen chanstat_z = (chanstat - mean_chanstat) / sd_chanstat 

summarize status_z chanstat_z


collect clear
regress leftright age rsex ib1.income ib1.qual ib3.nssec status_z [pweight=wtfactor]
etable
	
regress leftright age rsex ib1.income ib1.qual ib3.nssec chanstat_z [pweight=wtfactor]
etable, append
	
	
regress authlib age rsex ib1.income ib1.qual ib1.nssec c.status_z [pweight=wtfactor]
etable, append

margins, at(status_z=(-1.6(0.2)2.4)) atmeans saving(plot1, replace)
marginsplot, ///
    recast(line) ///
    recastci(rarea) ///
    ciopts(fcolor(blue%20)) ///
    title("") ///
    ytitle("Predicted Libertarian-Authoritarian Score") ///
    xtitle("Stände Scale") ///
    xlabel( , labsize(tiny)) ///
    ylabel( , labsize(tiny)) ///
    plotopts(lwidth(medium)) ///
    xscale(range(-1.6 2.5)) ///
    name(plot1, replace) ///
    saving(plot1, replace)


regress authlib age rsex ib1.income ib1.qual ib1.nssec c.chanstat_z [pweight=wtfactor]

etable, append

margins, at(chanstat_z=(-1.8(0.2)1.6)) atmeans saving(plot2, replace)
marginsplot, ///
    recast(line) ///
    recastci(rarea) ///
    ciopts(fcolor(blue%20)) ///
    title("") ///
    ytitle("Predicted Libertarian-Authoritarian Score") ///
    xtitle("Chan-Goldthorpe Scale") ///
    xlabel( , labsize(tiny)) ///
    ylabel( , labsize(tiny)) ///
    plotopts(lwidth(medium)) ///
    xscale(range(-1.6 1.6)) ///
    name(plot2, replace) ///
    saving(plot2, replace)


graph combine plot1 plot2, ycommon ///
title("Comparison of Social Status Measures on Libertarian-Authoritarian Axis", size(small)) ///
note("Data Source: BSA 2003. N=3,211", size(vsmall)) ///
caption("Social Status Measures Standardised. Appropriately weighted.", size(vsmall))


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
		note("Data Source: BSA 2002. Appropriately weighted. N=3,211") ///
		notestyles(font(Book Antiqua, size(8) italic)) ///
		export("polticalaxis2003.docx", replace)
		
		
		
		
* generate coefplot of all 12 models 


clear
input str10 variable coeff se
"lastatus2001" -0.38 0.13
"lachan2001" -0.21 0.13
"blank1" . .
"lastatus2002" -0.41 0.15
"lachan2002" -0.29 0.14
"blank2" . .
"lastatus2003" -0.43 0.12
"lachan2003" -0.36 0.12
"blank3" . .
end


* Calculate confidence intervals
gen lower = coeff - 1.96 * se
gen upper = coeff + 1.96 * se

* Convert variable names to numeric IDs for plotting
encode variable, gen(varnum)


* Group var 
gen group=1 if _n==1
replace group= 1.1 if _n==2

replace group= 1.2 if _n==3

replace group= 1.3 if _n==4
replace group= 1.4 if _n==5

replace group= 1.5 if _n==6

replace group= 1.6 if _n==7
replace group= 1.7 if _n==8


gen cohort = 1 if _n==1 | _n==4 | _n==7
replace cohort = 2 if _n==2 | _n==5 | _n==8

graph twoway ///
    (rspike upper lower group if cohort == 1, lcolor(black)) ///
    (rspike upper lower group if cohort == 2, lcolor(black)) ///
    (scatter coeff group if cohort == 1, msymbol(O) mcolor(black) ///
        legend(label(3 "Stände"))) ///
    (scatter coeff group if cohort == 2, msymbol(D) mcolor(black) ///
        legend(label(4 "Chan-Goldthorpe"))) ///
		, ///
	ylabel( , labsize(vsmall)) ///
	ytitle("Coefficients", size(vsmall)) ///
    xlab(1.1 "BSA 2001" 1.3 "BSA 2002" 1.6 "BSA 2003" , labsize(vsmall)) ///
	xtitle("Datasets", size(vsmall)) ///
	subtitle("Comparison of Status Impacts on Libertarian-Authoritarian Axis Across Different Survey Years", size(vsmall)) ///
	note("Data Source: BSA 2001, 2002, 2003. Appropriate weights applied.", size(vsmall)) ///
	caption("All other covariates controlled for. Status measures standardised for comparison.", size(vsmall)) ///
    legend(order(3 4) row(1) pos(6) size(vsmall)) ///
	yline(0, lpattern(dash) lcolor(black)) ///
	xline(1.2, lpattern(dot) lcolor(black)) ///	
	xline(1.5, lpattern(dot) lcolor(black)) ///
	name(LAplot1, replace) ///
    saving(LAplot1, replace)

	
	
* left/right
	
clear
input str10 variable coeff se
"lrstatus2001" -0.11 0.13
"lrchan2001" -0.01 0.12
"blank1" . .
"lrstatus2002" 0.11 0.14
"lrchan2002" 0.31 0.13
"blank2" . .
"lrstatus2003" 0.21 0.12 
"lrchan2003" 0.45 0.12
"blank3" . .
end


* Calculate confidence intervals
gen lower = coeff - 1.96 * se
gen upper = coeff + 1.96 * se

* Convert variable names to numeric IDs for plotting
encode variable, gen(varnum)


* Group var 
gen group=1 if _n==1
replace group= 1.1 if _n==2

replace group= 1.2 if _n==3

replace group= 1.3 if _n==4
replace group= 1.4 if _n==5

replace group= 1.5 if _n==6

replace group= 1.6 if _n==7
replace group= 1.7 if _n==8


gen cohort = 1 if _n==1 | _n==4 | _n==7
replace cohort = 2 if _n==2 | _n==5 | _n==8

graph twoway ///
    (rspike upper lower group if cohort == 1, lcolor(black)) ///
    (rspike upper lower group if cohort == 2, lcolor(black)) ///
    (scatter coeff group if cohort == 1, msymbol(O) mcolor(black) ///
        legend(label(3 "Stände"))) ///
    (scatter coeff group if cohort == 2, msymbol(D) mcolor(black) ///
        legend(label(4 "Chan-Goldthorpe"))) ///
		, ///
	ylabel( , labsize(vsmall)) ///
	ytitle("Coefficients", size(vsmall)) ///
    xlab(1.1 "BSA 2001" 1.3 "BSA 2002" 1.6 "BSA 2003" , labsize(vsmall)) ///
	xtitle("Datasets", size(vsmall)) ///
	subtitle("Comparison of Status Impacts on Left-Right Axis Across Different Survey Years", size(vsmall)) ///
	note("Data Source: BSA 2001, 2002, 2003. Appropriate weights applied.", size(vsmall)) ///
	caption("All other covariates controlled for. Status measures standardised for comparison.", size(vsmall)) ///
    legend(order(3 4) row(1) pos(6) size(vsmall)) ///
	yline(0, lpattern(dash) lcolor(black)) ///
	xline(1.2, lpattern(dot) lcolor(black)) ///	
	xline(1.5, lpattern(dot) lcolor(black)) ///
	name(LRplot1, replace) ///
    saving(LRplot1, replace)	
	
	*** MEM 
clear
input str10 variable coeff
"2001LR1" 22.71298
"2001LR2" 22.63751
"2001LR3" 22.56205
"2001LR4" 22.48658
"2001LR5" 22.41111
"2001LR6" 22.33564
"2001LR7" 22.26018
"2001LR8" 22.18471
"2001LR9" 22.10924
"2001LR10" 22.03378
"2001LR11" 21.95831
"2001LR12" 21.88284
"2001LR13" 21.80737
"2001LR14" 21.73191
"2001LR15" 21.65644
"2001LR16" 21.58097
"2001LR17" 21.5055
"2001LR18" 21.43004
"2001LR19" 21.35457
"2001LR20" 21.2791
"2001LR21" 21.20364
"2002LR1" 22.70603
"2002LR2" 22.62448
"2002LR3" 22.54292
"2002LR4" 22.46137
"2002LR5" 22.37982
"2002LR6" 22.29827
"2002LR7" 22.21671
"2002LR8" 22.13516
"2002LR9" 22.05361
"2002LR10" 21.97206
"2002LR11" 21.89051
"2002LR12" 21.80895
"2002LR13" 21.7274
"2002LR14" 21.64585
"2002LR15" 21.5643
"2002LR16" 21.48274
"2002LR17" 21.40119
"2002LR18" 21.31964
"2002LR19" 21.23809
"2002LR20" 21.15654
"2002LR21" 21.07498
"2003LR1" 22.94117
"2003LR2" 22.85587
"2003LR3" 22.77058
"2003LR4" 22.68528
"2003LR5" 22.59999
"2003LR6" 22.51469
"2003LR7" 22.4294
"2003LR8" 22.3441
"2003LR9" 22.25881
"2003LR10" 22.17351
"2003LR11" 22.08822
"2003LR12" 22.00292
"2003LR13" 21.91763
"2003LR14" 21.83233
"2003LR15" 21.74704
"2003LR16" 21.66174
"2003LR17" 21.57645
"2003LR18" 21.49115
"2003LR19" 21.40586
"2003LR20" 21.32057
"2003LR21" 21.23527
end

* Extract year
gen year = real(substr(variable,1,4))

* Extract numeric position
gen x = real(substr(variable,7,.))

* Create equally spaced x-axis positions between -1.6 and 2.4
gen x_axis = -1.6 + (x-1)*((2.4+1.6)/20)  // 21 points evenly spaced

* Now plot using x_axis and attach labels a–u
local labels "a b c d e f g h i j k l m n o p q r s t u"

twoway ///
    (line coeff x_axis if year==2001, lwidth(thick) lpattern(solid) lcolor(black)) ///
    (line coeff x_axis if year==2002, lwidth(thick) lpattern(dash) lcolor(black)) ///
    (line coeff x_axis if year==2003, lwidth(thick) lpattern(dot) lcolor(black)), ///
    legend(order(1 "2001" 2 "2002" 3 "2003")) ///
    xtitle("Stände") ///
    xlabel(-1.6(0.2)2.4, valuelabel labsize(vsmall)) ///
    ylabel( , valuelabel labsize(vsmall)) ///	
    ytitle("Predicted Libertarian-Authoritarian Score") ///
	name(standemem1, replace) ///
    saving(standemem1, replace)	

* chan-g scale 
clear
input str10 variable coeff
"2001LR1" 22.48182
"2001LR2" 22.44031
"2001LR3" 22.39879
"2001LR4" 22.35728
"2001LR5" 22.31576
"2001LR6" 22.27425
"2001LR7" 22.23273
"2001LR8" 22.19122
"2001LR9" 22.1497
"2001LR10" 22.10819
"2001LR11" 22.06667
"2001LR12" 22.02516
"2001LR13" 21.98364
"2001LR14" 21.94213
"2001LR15" 21.90061
"2001LR16" 21.8591
"2001LR17" 21.81758
"2001LR18" 21.77607
"2002LR1" 22.58116
"2002LR2" 22.52252
"2002LR3" 22.46387
"2002LR4" 22.40523
"2002LR5" 22.34659
"2002LR6" 22.28794
"2002LR7" 22.2293
"2002LR8" 22.17065
"2002LR9" 22.11201
"2002LR10" 22.05336
"2002LR11" 21.99472
"2002LR12" 21.93607
"2002LR13" 21.87743
"2002LR14" 21.81878
"2002LR15" 21.76014
"2002LR16" 21.70149
"2002LR17" 21.64285
"2002LR18" 21.58421
"2003LR1" 22.89752
"2003LR2" 22.82641
"2003LR3" 22.75531
"2003LR4" 22.68421
"2003LR5" 22.61311
"2003LR6" 22.54201
"2003LR7" 22.47091
"2003LR8" 22.3998
"2003LR9" 22.3287
"2003LR10" 22.2576
"2003LR11" 22.1865
"2003LR12" 22.1154
"2003LR13" 22.0443
"2003LR14" 21.9732
"2003LR15" 21.90209
"2003LR16" 21.83099
"2003LR17" 21.75989
"2003LR18" 21.68879
end

* Extract year
gen year = real(substr(variable,1,4))

* Extract numeric position
gen x = real(substr(variable,7,.))

* For plotting across -1.6 to 1.6 with 18 evenly spaced points
gen x_axis = -1.6 + (x-1)*(3.2/17)  // 18 points evenly spaced from -1.6 to 1.6

* Optional: letters a–r for x-axis
local labels "a b c d e f g h i j k l m n o p q r"

twoway ///
    (line coeff x_axis if year==2001, lwidth(thick) lpattern(solid) lcolor(black)) ///
    (line coeff x_axis if year==2002, lwidth(thick) lpattern(dash) lcolor(black)) ///
    (line coeff x_axis if year==2003, lwidth(thick) lpattern(dot) lcolor(black)), ///
    legend(order(1 "2001" 2 "2002" 3 "2003")) ///
    xtitle("Chan-Goldthorpe") ///
    xlabel(-1.6(0.2)1.6, valuelabel labsize(vsmall)) ///
    ylabel( , valuelabel labsize(vsmall)) ///	
    ytitle("Predicted Libertarian-Authoritarian Score") ///
	name(cgmem1, replace) ///
    saving(cgmem1, replace)	
	
	
	
graph combine standemem1 cgmem1, ycommon ///
title("Comparison of Social Status Measures on Libertarian-Authoritarian Axis", size(small)) ///
subtitle("Marginal Effects at Means", size(vsmall)) ///
note("Data Source: BSA 2001, 2002, 2003. Appropriate weights applied.", size(vsmall)) ///
caption("All other covariates controlled for. Status measures standardised for comparison.", size(vsmall)) 
