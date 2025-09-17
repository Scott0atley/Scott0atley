/*
           __...--~~~~~-._   _.-~~~~~--...__
         //               `V'               \\
        //                 |                 \\
       //__...--~~~~~~-._  |  _.-~~~~~~--...__\\
      //__.....----~~~~._\ | /_.~~~~----.....__\\
     ====================\\|//====================
                         `---`
Basic Introduction -- Data Management and Getting to know Stata

*/


* This introduction seeks to serve as a basic guide to newcomers to Stata as a software application. There is no data analysis in this file. This section covers the really important commands that you will use every single time you open up Stata. Each command is directly explained and an example is provided. Many of these examples are re-purposed from the stata website: https://www.stata.com/links/stata-basics/. If you want to search for more information on the basics of Stata, that is a good link to follow. What you have in this .do file is the exactly what you need to know. There is not any statistics or analysis here. *






* Before we begin, it is always good practice to use the "clear" command. This wipes Statas memory of a dataset so we can start from scratch. Most of the time this won't actually do anything, but when you get into Stata you will often find you will switch between multiple datasets within the same instance of Stata, thus the "clear" command becomes rather important. *

clear

*** Path Location ***

* Stata like all software (think word or powerpoint) is open on your computer and saves files to a working directory -- this means a place on your hard drive -- to find out where Stata has selected to save our files we can use the "pwd" command to display the path of the current working directory *

pwd

* we can change our working directory at any time. We should. Having a competent working directory set up allows for a proper workflow -- it also just makes life a lot easier to have a specific folder setup for data, .do files, outputs etc. For the sake of this demonstration a simple folder setup can be: *

cd "/Users/scottoatley/Documents/"

* Remember I am using my hard drive location, you should change this your own. Also remember, I am using a macbook which means I use "/", if you are using a windows OS machine then you instead use "\".

* If the folder is already occupied, instead of going back and forth between stata and your file explorer, we can use the command "ls" to list all documents within the cd location *

ls 


*** Example Datasets ***

* there are some built in datasets used within Stata. These will be used for teaching the ways of Stata in this course. To access these datasets we use the sysuse command followed by the specific dataset. If you have a saved file within your set directory you would instead use the use command *

sysuse auto.dta

* if you want to find a full list of example datasets, use the help command followed by dta_examples *

help dta_examples



*** Basic Dataset Descriptive Commands ***

* with a small dataset like this, with few variables it is a good idea to get a general description of the sample. There are two useful commands that help us in this task. The first is the describe command. This details each variable name, the storage type, display format, and the variable label. The second is the codebook command. On its own it produces detailed descriptive material on each variable in your dataset. It provides detail on the range, unique values, number of missing values etc of each variable. Using the subcommand ,compact allows a much more streamlined version.

describe 

codebook, compact




*** Labelling Variables ***

* Another way we can use data that isn't stored within Stata itself is to pull it from an online source. Certain places online will have datasets you can download direct to Stata using an appropraite url. *

use https://www.stata.com/users/youtube/rawdata.dta, clear

describe 

codebook, compact

* Sometimes we get a dataset that is a little incomplete, the variable names make it easy to know what each variable actually is, for example, with this dataset we know that the variable age is going to have values associated with the age of a respondent, to add that as a descriptor, we need to add a label. This label will allow both you and new users of the data to instantly know what each variable is. *

label var age "Age (years)"

label var dob "Date of Birth"

describe



*** Saving a Dataset to our computers ***

* Now that we have altered this dataset, we need to save it, otherwise all our changes will be lost. We use the save command followed by the name of what we want to name our dataset, we also want to use the subcommand ,replace so that each time we run this code the dataset is re-saved *

save teachingset.dta, replace 



*** Labelling Categories within Variables ***

* Perhaps more importantly, a label for the value of categories is even more important than a general overall label for the variable itself. In this instance sex has two categoires that are not labelled. In this example we know that men are coded as 0 and women as 1, but we won't always be in a position to know this. It is good practice to always label variables. To do this we first define a label using the label define command, it is good practice to use the same name as the vairable followed by _lbl*

tab sex

label define sex_lbl 0"Male" 1"Female"

* To attach the label to the variable of choice, we use the label values command *

label values sex sex_lbl

tab sex



*** Basic Formatting ***

* Sometimes the variables within our dataset have multiple decimal places that are not needed. When this is the case, we can alter the formatting to show however many decimal places you would like, or in the case of this example, only whole numbers *

list weight in 1/10

format %6.0f weight

list weight in 1/10

* If we want to change this back, we simply reiterate the same format command. When changing the format of a variable, none of the data is lost, it is all stored within Stata. *

format %6.2f weight

list weight in 1/10



*** Generating Variables -- Rounding ***

* In a similar fashion, sometimes we want to actually change the data to round up or down. To do this, we always want to generate a new variable -- in this instance we actually are changing the data -- so we have the original raw variable and the newly generated variable. 

generate weight1 = round(weight, 0.1)

list weight weight1 in 1/10

generate weight0 = round(weight, 1.0)

list weight weight1 weight0 in 1/10


*** Generating Variables -- Floor and Ceiling ***

* Instead of rounding, we can also ask stata to use a floor or a ceiling function. If an observation is 64.95 and we floor it then it becomes 64, if we using a ceiling function it becomes 65 instead *

generate weightf = floor(weight)

generate weightc = ceil(weight)

list weight weight1 weight0 weightf weightc in 1/10





*** Dataset Management -- Destringing Metric Variable ***

* A common problem when dealing with converted datasets, or datasets used from primary survey collection strategies (college projects being a good example) some variables that should be numeric are actually encoded as a string. This limits the analysis we can do -- like summarize --, so we need to convert string data to numeric data. We can figure out what data type variables are by the describe function *

describe

list chol in 1/10

summarize chol

* We convert string variables by using the destring command, again we generate a new variable. *

destring chol, gen(choln)

list chol choln in 1/10

summarize choln



*** Dataset Management -- Destringing Categorical Variable ***


* Sometimes the type of string variable is categorical. This becomes slightly harder to convert than a simple numerical variable. To do this, we need the encode command *

tab race

encode race, gen(racen)

list race racen in 1/10

tab race racen

describe race racen

label list racen


*** Handling Missing Data in our Dataset ***

* Missing data is a very common problem. Often times surveys will code missing data as extremely unlikely values like -99 etc. This becomes an issue if we want to run statistical tests because our variable will have x amount of observations coded to an extreme value. * 

summarize

* Using the summarize command we can identify these extreme examples. The variable dbp has a min value of -99. The command mvdecode followed by each variable in the dataset treats these values as missing *

mvdecode dbp, mv(-99)

summarize dbp

* the list command followed by the missing() subcommand will list all observations that are missing for that variable. Alternatively, the !missing() subcommand lists all observations that are not missing. *

list dbp if missing(dbp)

list dbp in 1/10 if !missing(dbp)

* When generating new vairables, or running simple tests with the greater than symbol, it is important to know that missing data is considered to be near infinity. Due to this, we need to either remove missing data from our dataset completely (sometimes impractical) or we account for it in our commands. *

count if dbp > 100

count if dbp > 100 & !missing(dbp)




*** Generating Variables -- New Variables *** 

* Sometimes we want to generate new information from our existing dataset. BMI is constructed from data on weight and height for example. We need to make sure the data is in the right form prior to generating bmi however. *

describe

* Height is in cm and weight is in kg. we need to convert height into meters, then we can generate the bmi variable. *

generate heightm = height/100

generate bmi = weight / heightm^2

list weight height heightm bmi in 1/10

* This works but is not efficient. We can accomplish this with one command. *

generate bmi2 = weight / (height/100)^2

summarize bmi bmi2


*** Generating Variables -- Categorical Varibles from Metric Variables *** 

* Sometimes we want to generate a new categorical variable from a metric variable. For example, we may want to use age groupings, rather than age as a metric measure. Say we want to focus on retirement age people versus not. We can dichotomise age and generate a new categorical age variable. * 

recode age (min/66 = 0) (67/max = 1), gen(agecat)

bysort agecat: summarize age

* Instead of generating a new variable, then adding labels to the variable, we can do this in one command. *

recode age (min/66 = 0 "Working Age") (67/max = 1 "Retirement Age"), gen(agecat2)

tab agecat agecat2

* Sometimes we want to create more than two categoires, this can make the code look slightly large, so we employ /// to break the code up into readable chunks. *

recode age (min/30 = 1 "Early Career")   ///
             (31/66 = 2 "Working Adult") ///
             (67/max = 3 "Retirement")    ///
             , gen(agecat3)

tab agecat3


*** Generating Variables -- Dates from String Variables *** 

* Sometimes we work with data were the date is essential to our analysis. Often times dates in Stata are strings and are not very useful in analysis. 

list dob in 1/10

* We can convert strings into a numerical format using the date command *

generate daten = date(dob, "MDY")

list dob daten in 1/10

* These look odd. This is because Stata represents dates either before or after Jan 1 1960. We need to reformat to get the appropriate date format that we want. *

format %tdMonth_DD,_CCYY daten

list dob daten in 1/10

* Whilst it now looks the same as our string data, we can not run some analysis with this variable. This example code calculates indiviudals age as of January 1 2000 *

generate age2000 = age(daten, date("1/1/2000", "MDY"))

list dob daten age2000 in 1/10

*** END ***
