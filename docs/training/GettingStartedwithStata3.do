*** Introduction -- Advanced Statistical Concepts in Stata***

*** Interaction Terms ***
* Sometimes we need to use what are called interaction terms in our regression models. Interaction terms are the interaction between two different vairables. It is the combined effect of two or more indpeendent variables. It is used to investigate if the effect of one independent vairbale on the dependent vairbale depends on another individenapt variable. We can either generate an interaction effect using the generate command, or we can use notation within the regress command using "#". Note that when using "#" we also have to note if our variables are metric or categorical using the i. or c. from earlier.*

regress choln c.height##c.weight 

* for each one-unit increase in height, the effect of weight on cholesterol increases by 0.02 units (mg/dL) *


*** Logistic Regresion ***

recode bmi2 (min/29.99 = 0 "non-obese") ///
             (30/max = 1 "obese") ///
             , gen(obese)
			 
tab obese

* Sometimes the dependent vairable of interest within our model is non-linear, or non-metric. This violates assumptions for linear regression. Alternative regression methods need to be used. If we have a binary dependent variable, we can use logistic regression which is a non-parametric non-linear model. *

logit obese i.sex i.racen age


* We interpret a logistic regression the same as we would a linear regression. One differnece relates to the R2. With non-linear models the R2 is no longer a simple explaination of variance explained because of the non-linear log shaped distribution. It is still a general measure of goodness-of-fit but there are multiple different pseudo R2 measures as seen by using "fitstat" -- this command is a user made command as such we first need to install it using "ssc install fitstat". *

ssc install fitstat

fitstat

* The logit command defaults to using log odds as the coefficients. Log odds are bound between 0-infinite. At the extreme ranges the changes in log odds produce very little change in the probabilities reported, changes in the middle produce large changes in the log odds. An alternative measure would be to use odds ratios, a common thing in health sciences. *

logit obese i.sex i.racen age, or

* We interpret the odds ratio as the change in the odds. Between 0-1 of the association with X is negative, 1 if there is no association, and larger than 1 if the association with X is positive. *

* Another possibility is to use something called marginal effects. An average marginal effect is the effect of foing from one value of Xi to another value of Xi acorss all observations. For example is the marginal effect of women on smoking is -0.20, then women have a 20% point lower probability of smoing than men on average. We can get the marginal effects after a logistic regression using the margins command. *

margins, dydx(*)

*** Ordinal Regression Models ***
* Orginal regression models are used when the dependent variable has 3 or more categories that can be considered ordered (Think a Likert scale). Theoeretically we could treat a dependent variable such as this as a linear predictor and run regress on it. However we do have dedicated commands for this type of variable. The first is an extension of the logit command, called "ologit" and works the same with log odds, odds ratios, and average marginal effects. *

recode bmi2 (min/18.49 = 0 "underweight") ///
             (18.50/24.999 = 1 "healthy") ///
             (25/29.99 = 2 "overweight") ///
             (30/max = 3 "obese") ///
             , gen(bmicat)
			 
tab bmicat

ologit bmicat i.sex i.racen age

* There are two major types of ordinal regression models. The one we have seen here is a proportional odds model. This assumes that categories have a natural order, but the distances between categories are not assumed to be equal. There is another type of model called the continuation ratio model. This model requires that passing through each category is sequential. You must past through category 1 to get to category 2 etc. A common use case is a dependent variable where educational attainment has multiple categories - to get to the best category you first have to attain all the others. The continuation ratio model is not currently built in within stata and you will need a custom built command to use it. *

*** Multinominal Logistic Regression ***
* In cases where we have a dependent variable with no ordered structure (we will use bmicat for this even though we know it is ordered for example sake) we use a multinominal logistic regression. This is a simple extension of logistic regression where instead of one reference category and one non-reference, we have multiple non-reference. *

mlogit bmicat i.sex i.racen age

* We can plot the margins of each category using margins and marginsplot command. *

margins

marginsplot


*** Count Models ***

