* socstrat: examples from the Stata Journal article
* Scott Oatley
*
* Source: examples.do in "socstrat program 19122025", 20 February 2026 (the version accepted by the Stata Journal).
* Website copy: the two folder paths are placeholders. Set them to your own folders before running.
*
* Data: NCDS occupation coding file, ncds5_occupation_coding_cm.dta,
* UK Data Service SN 7023 (End User Licence). It is not supplied here.
* https://datacatalogue.ukdataservice.ac.uk/studies/study/7023
*
* Install the command once with:  ssc install socstrat

* SET YOUR FOLDERS *
* Folder for the log file.
local mylogpath "C:\path\to\your\log\folder"
* Folder holding the SN 7023 Stata files.
local datadir "C:\path\to\UKDA-7023-stata9\stata9"

* OPEN THE LOG AND THE DATA *
capture log close
log using "`mylogpath'\examples.log", text replace
cd "`datadir'"
use ncds5_occupation_coding_cm.dta, clear

* EXAMPLE ONE - CONSTRUCT NS-SEC SOC 90 VERSION *
* IDENTIFY VARIABLES *
describe N5EMPSTA N5SSOC90
* EMPLOYMENT STATUS VARIABLE IS STRING, THIS WILL THROW UP ERROR IF SOCSTRAT IS ATTEMPTED *
* DESTRING EMPLOYMENT STATUS AND RE-RUN SOCSTRAT *
destring N5EMPSTA, gen(status)
socstrat, socstatus(N5SSOC90 status) generate(nssec90) version(90) strat(nssec)
* SUCCESS - CHECK NEW VARIABLE *
tab nssec90
* NEW VARIABLE CONSTRUCTED PROPERLY. OBSERVATION COUNT IS THE COMPLETE RECORDS OF SOC CODE AND EMPLOYMENT STATUS *

* EXAMPLE TWO - CREATE NS-SEC SOC 2000 AND COMPARE WITH NS-SEC 1990 *
describe status N5SSOCC
* SOC 2000 IS STRING, NEED TO DESTRING *
destring N5SSOCC, gen(soc2000) force
socstrat, socstatus(soc2000 status) generate(nssec00) version(00) strat(nssec)
tab nssec00
* COMPARE SOC 90 AND 00 VERSIONS OF THE SAME SOCIAL CLASS MEASURE *
describe nssec90 nssec00
* THERE ARE MORE MISSING VALUES FOR SOC 2000 NS-SEC THAN SOC 90 NS-SEC, BECAUSE OF OCCUPATIONAL CHANGE ACROSS TIME *
tab nssec90 nssec00
* SOME VARIATION IN CLASS PLACEMENT ACROSS SOC VERSIONS *

* EXAMPLE THREE - CREATE RGSC SOC 1990 AND 2000 AND COMPARE WITH NS-SEC MEASURES *
socstrat, socstatus(N5SSOC90 status) generate(rgsc90) version(90) strat(rgsc)
tab rgsc90
socstrat, socstatus(soc2000 status) generate(rgsc00) version(00) strat(rgsc)
tab rgsc00
* COMPARE THE TWO RGSC VERSIONS *
tab rgsc90 rgsc00
* COMPARE SAME SOC VERSIONS ACROSS CLASS MEASURES *
tab nssec90 rgsc90
tab nssec00 rgsc00
* MUCH LARGER DISPERSION ACROSS CLASS MEASURES THAN BETWEEN SOC VERSIONS OF ONE MEASURE *
* RGSC AND NS-SEC FROM THE SAME SOC VERSION WILL NOT ALWAYS HAVE THE SAME NUMBER OF OBSERVATIONS, *
* BECAUSE THEIR DERIVATION MATRICES TREAT SOME SOC AND EMPLOYMENT STATUS COMBINATIONS DIFFERENTLY *

* CLOSE THE LOG *
log close
