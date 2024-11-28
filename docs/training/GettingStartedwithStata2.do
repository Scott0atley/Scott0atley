

*** Basic Introduction -- Basic Statistical Concepts in Stata***

*** Data Preperation ***

use https://www.stata.com/users/youtube/rawdata.dta, clear

*** Sampling ***

* To find out the total sample population of a given dataset, we use the "count" command in Stata *

count

*** Sampling Error ***

* To find out the potential sampling error we can estimate the standard error of the mean for the variables within our dataset. The standard error gives us an idea of how much the sample mean is expected to vary due to sampling variability. For a metric variable like height, we can first "summarize" the variable in detail to gain some general statistical measures, then we can use the "mean" command to gather the standard error statistic. The same can be done for categorical variables using the "proportion" command *

summarize height, detail

mean height

proportion sex


* A standard error of 0.27 (rounded to two decimal places) suggests that given our population sample, the mean height is a relatively precise estimate of population height. If the standard error was closer to 27, then the amount of variation in the sample compared to the true population would be large. But how confident are we on the mean value? *

ci mean height

* The "ci mean" command provides the mean of the variable height but also gives us things called confidence intervals. The mean in this respect is what we call a point estimate, it is a single value that is the best guess of the true value. The Confidence Intervals are a set of numbers around the point estimate that we beleive contains the parameter value. In this instance the point estimate is 167.17 and the Lowerbound confidence interval is 166.64 and the Upperbound confidence interval is 167.70. A 95% confidence interval provides a range of values that we can be 95% confident that the true population paramter lies, based on the given sample population. 

* We can also calculate the confidence intervals ourselves using the mean (point estimate) and the standard error. For 95% Confidence we need to multiply the standard error by 2 and subtract that from the mean to get the lowerbound or add it to get the upperbound confidence interval. 

display "Lowerbound CI:"167.17-(0.27*2)
display "Lowerbound CI:"167.17+(0.27*2)



*** Data and Distributions ***

* The centre of the data is typically understood as a typical observation. The mean describes the center and the standard deviation describes the variability of the observations within a variable. We return to our height vairable to assess the mean and standard deviation and assess. *

summarize height

* From the summarize command we get both the mean and standard deviation. A standard deviation of 9.60 means that on average, the height of idnivuduals differs from the mean heaight of 167.17 by 9.60 units. If height is normally distributed (think bell curves) about 68% of the observations in our data fall within one standard deviation of the mean of height. We can calculate what that 68% looks like in stata using the "display" command. *

display "Lowerbound s.t.d:"167.17-9.60
display "Upperbound s.t.d:"167.17+9.60


* This shows us that 68% of all observations will fall between 157.57 and 176.77 cm. To get two or three standard deviations you simply multiply the standard deviation. Using three standard deviations, 99.7% of the sample observations fall in between 138.37 and 195.97cm *

display "Lowerbound s.t.d:"167.17-(9.60*3)
display "Upperbound s.t.d:"167.17+(9.60*3)

* All of this us under the assumption of a normal distribution. To test this we can use a couple of functions. The first is a histogram of the observations using the "hist" command followed by the ",normal" subcommand. *

hist height, normal

* Visually, this looks like a fairly normal distirbution. We can also use a quantile-quantile plot, if the observations follow the line, then we can claim a normal distribution. *

qnorm height

* We can also look at two other statistics in the "summarize" command: Skewness and Kurtosis. Skewness measures the asymmetry of the distirbution, for a perfectly normal distirbution skewness should be 0. Kurtosis measures the tails of the distribution, for a normal distriubtion, this should be 3. *

summarize height, detail

* All three commands show strong support for the idea that height is normally distributed *

*It isn't all about the mean! We can also check the median to check a variables distirbution. If the mean is larger than the median that means the data is skewed to the right, if it is smaller then it is skwed to the left. *



*** Probability ***

* Some probability disucssion has already been had with standard deviation. An alternative is using percentiles and the Interquartile range: the difference ebtween the upper and lower quaritle ranges. These ranges can again be found within the "summarize" command. 

* Another way to meausre the position of an indiviudal is by the number of standard deviations that a value falls from the mean. This is called the z-score. The z-score = observation value-mean/standard deviation. We can generate this for all observations of height by: *

generate z_height = (height - r(mean)) / r(sd)

tab z_height

* It is very unlikely that an observation falls beyond more than 3 standard deviations from the mean. Using the "tab" command, we can see that the z-score across the height variable is consistent with a normal distribution. *

* We can now use the z-score from height to calculate the cumulative probability. using the display and normal commands, with z_height provides a value of 0.91. This means that approximately 91% of the data lies below a z-score of 1.5 in a standard normal distribution. This allows us to understand how unusual or typical a certain value is within within a distribution. *

display normal(z_height)


*** Bivariate Analysis ***
*** Correlation ***

* Bivarite analysis involves a statistical test with two variables. Each vairable in a bivaraite analysis has a distribution mean and a standard deviation. The way that variable x and variable y vary together is described by their covaraince. We can get this covaraince by using: 

corr height sbp, covariance

* From this 4.16 some interpretation can be had. First off, the covaraince is positive, meaning that as height increases, so does sbp -- and vice versa. We cannot make any assessment as to the strength of this association, for that we need to run a correlation test. A correlation test can only be conducted using two metric variables. *

corr height sbp


* From this we can say there is a correlation of 0.01 between height and sdp. This is positive, as confirmed through the covaraince test, however this is a very small positive correlation and thus we would say this is a very weak (if non-existent) psoitive correlation. *


*** T-test ***
* A t-test is a formal statistical test. It compares the means of two populations to see if there are statistically significant. This test will use a null hypothesis that height is not different between men and women. Our alternative hypothesis is that height is different between men and women.

ttest height, by(sex)

* The t-test displays the results of both women and men. It also provides their seperate means, standard errors, stadnard deviations, and 95% confidence intervals. It also provides the difference in height between the two groups which is -13.79. Right at the bottom of the t-test is the formal hypothesis test. With a p-value of <0.05 we can formally reject the null hypothesis and confirm that the average height of women compared to men is statistically different. *


*** Chi-2 test ***
* A Chi-2 test compares categorical vairables and assesses the association between two variables. 

recode racen (1/2 = 0 "non-white") ///
             (3 = 1 "White") ///
             , gen(racebin)

tabulate racebin agecat, chi2

* The chi-2 test gives us a contingency table breaking down the values of each cell between two categorical variables. It also gives us the Chi-2 statistic -- in this case 7.83 -- this measures the discrepancy between the observed and expected frequencies. It also gives us a p-value -- in this case 0.005 -- which is less than 0.05 and indicates that there is a signifianct association between someones age and someones race. *

*** ANOVA ***
* Anova is a method we use to assess the statistical different between a metric vairbale and a categorical variable with more than two categories. The one-way Anova compares the means of two or more independnt groups in order to determine whether there is statistical evidence that the associated population emans are signifiantly different. 

anova height agecat3

* The Anova demonstrates that there is a p<0.05 demonstrating a associated different in population means between caregories of age in relation to height. *


*** Linear Regression ***

* Linear regression is a statistical technique used to model and analyze the relationship between a dependent variable and one or more independent variables. *

regress height weight

* From this regression a number of statistics are interesting. Firstly we look at the R-squared. This measures the total amount of variance explained within a given regression model. In other words, how much of the vairance in height is explained by weight. For this model the r-squared is 0.21, or 21% of the varaince is explained. Secondly, we look at the coefficient or point estimate for our indpendent variable weight. We can see that it is statistically signifiant as p<0.05, thus we can move to substnatively interpret. The coefficient for weight is 0.27. This means that for each kg of weight, height increased by 0.27cm. *

*** Multivariate Linear Regression ***
* Most of the time linear regression with one independent variable makes little sense in the real world. We inuitively know that multiple factors have an impact on a dependent variable. In this instance we call it a multivariate linear regression. This regression uses the same command "regress" but four independent variables. Three of these variables are metric, one is categorical. Stata treats all variables in a regression as metric unless it is told otherwise. For this we use subnotation using "i.". This tells Stata that the variable is categorical. We can do this for metric vairbales as well using "c." *

regress choln height weight age i.racebin 

* We interpret this regression model the same as before. One key difference is that when we interpret the coefficients of variables we need to make sure we are saying 'holding constant for all other variables in our model'. *

* What if we want a different category of racebin? At the moment we interpret race in reference to another category. Non-white is the reference category (often coded as =0) and White produces the coefficients compared to non-white. This variable isn't statistically significant, but if it were we would interpret the variable as such: For White people compared to non-white people their choln increases by 3.52. We can change the reference category by using some more notation. *

regress choln height weight age ib(1).racebin 

* With a binary categorical reversing the reference category will just reverse the coefficient. With a variable with multiple categories this can be useful - a general rule of thumb is that we make the reference category either the category with the single largest n, or we have a sociolologically compelling reason to make it some other category*


*** Model Fit ***
* We want our model to satisfy two conditions: 1) It is the most sociologically compelling mode we can find, and 2) It is the best model fit. Sometimes these two conditions conflict with one another. For the purposes here, we will stick to 2). Assessing model fit requires us to look at a couple of statistics. First is R2 and Adjusted R2. Whilst R2 calculautes the amount of variance explained in a model, adjusted R2 does the same but penalises additional variables added to the model to avoid what is called 'overfit'. This is where some reserachers will put in lots of irrelevant variables into their model to boost the R2 as high as it can go. To assess the R2 of our model we need to check both the R2 and adjusted R2. *

regress choln height weight age ib(1).racebin 

* The R2 here is 19%, the adjusted R2 is 19%. From this we can see that the variables added to this model are not being overly penalised by the adjusted R2. *

* A second statistic to refer to with model fit is the AIC and BIC statistics. They both do very similar things - assess model goodness-of-fit. The BIC penalises additional variables whereas the AIC doesn't. Both the AIC and BIC cannot be understood on their own, they are comparative statistics. This means we need to compare each level of our regression model to see if it is the best overall model fit. We do this by running each stage of a regression, running the "estat ic" command, and then adding a new variable to the model until we reach our final model. *

regress choln 

estat ic

regress choln height 

estat ic

regress choln height weight 

estat ic

regress choln height weight age 

estat ic

regress choln height weight age ib(1).racebin 

estat ic


* From this we can see that the AIC and BIC are going down from the 'null' model until we reach the fourth model, whereby it goes up slightly. Now if we have a good sociollogical reason to include age and race then we should keep these two variables, if we don't then the statistics are telling us that the best model fit is found within model three. Let us continue with model three from now on. *


*** Regression Diagnostics ***
* There are some important assumptions that follow linear regression. We use Stata to check these assumptions. The first is the normality assumption -- the residuals of our regression should follow a normal distribution or bell curve. To check this we run the regression, then use the "predict" command to generate the residuals using the subcommand ",residuals". Finally we plot these on a histogram or q-q plot*

regress choln height weight 

predict residuals, residuals

histogram residuals, normal
qnorm residuals

* These seem approximately normal. *

* To check for linearity and homoscadiscity we can plot the residuals against the fitted values from our regression. *

predict fitted_values, xb

scatter residuals fitted_values

* Finally we need to check for multicollinearity, we do this by using the "vif" command. A vif value of above 5 is cause to investigate further, a vif of 10 indicates high collinarity. *

vif

* Both our independent variables have a vif of around 1, which indicates a generally acceptable range. *


*** END ***







