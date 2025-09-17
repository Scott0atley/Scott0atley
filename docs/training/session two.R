# Session Two

#Load packages
library(stargazer)
library(lavaan)

# Single Mean Imputation Example Comparison
# Set seed for reproducibility
set.seed(12345)

# Set number of observations
n <- 1000

# Generate metric independent variable #1
x1 <- rnorm(n, mean = 40, sd = 12)

# Generate "binary" independent variable #2 (technically normal in original code)
x2 <- rnorm(n, mean = 200, sd = 50)

# Generate metric independent variable #3
x3 <- rnorm(n, mean = 150, sd = 5)

# Generate dependent variable
y <- 30 * x1 + 40 * x2 + 50 * x3 + rnorm(n, mean = 5000, sd = 1500)

# Run regression
model <- lm(y ~ x1 + x2 + x3)

# MAR Model
set.seed(12345)
n <- 1000

# Generate variables
x1 <- rnorm(n, mean = 40, sd = 12)
x2 <- rnorm(n, mean = 200, sd = 50)
x3 <- rnorm(n, mean = 150, sd = 5)
y <- 30 * x1 + 40 * x2 + 50 * x3 + rnorm(n, mean = 5000, sd = 1500)

# Create MAR pattern
logistic <- function(z) { 1 / (1 + exp(-z)) }
prob_mar <- logistic(y - 21791)
rmar <- runif(n) < prob_mar
x2[rmar] <- NA  # Introduce missingness in x2

# Regression with missing data
model_mar <- lm(y ~ x1 + x2 + x3, na.action = na.omit)

# Single Mean Imputation

set.seed(12345)

# Generate variables again
x1 <- rnorm(n, mean = 40, sd = 12)
x2 <- rnorm(n, mean = 200, sd = 50)
x3 <- rnorm(n, mean = 150, sd = 5)
y <- 30 * x1 + 40 * x2 + 50 * x3 + rnorm(n, mean = 5000, sd = 1500)

# Create MAR pattern
prob_mar_imp <- logistic(y - 21791)
rmar_imp <- runif(n) < prob_mar_imp
x2[rmar_imp] <- NA  # Missing values

# Single Mean Imputation
x2[is.na(x2)] <- mean(x2, na.rm = TRUE)

# Regression after mean imputation
model_imp <- lm(y ~ x1 + x2 + x3)


# Display regression results using stargazer
stargazer(model, model_mar, model_imp,
          type = "text",
          title = "Table 1: Regression Models",
          column.labels = c("God Model", "MAR Model", "Single Mode Imputation"),
          covariate.labels = c("x1", "x2 = 1", "x3"),
          dep.var.labels = "y",
          model.names = FALSE,
          star.cutoffs = c(0.05, 0.01, 0.001),
          notes = "Data Source: Simulated",
          digits = 2)




# Single Mode Imputation Example Comparison
# God Model

set.seed(12345)
n <- 1000

# Variables
x1 <- rnorm(n, mean = 40, sd = 12)
x2 <- as.numeric(runif(n) < 0.55)  # Binary
x3 <- rnorm(n, mean = 150, sd = 5)
y <- 30 * x1 + 400 * x2 + 50 * x3 + rnorm(n, mean = 5000, sd = 1500)

# Regression with factor x2
model <- lm(y ~ x1 + factor(x2) + x3)

# MAR model
set.seed(12345)

# Recreate variables
x1 <- rnorm(n, mean = 40, sd = 12)
x2 <- as.numeric(runif(n) < 0.55)
x3 <- rnorm(n, mean = 150, sd = 5)
y <- 30 * x1 + 400 * x2 + 50 * x3 + rnorm(n, mean = 5000, sd = 1500)

# Apply MAR
logistic <- function(z) { 1 / (1 + exp(-z)) }
prob_mar <- logistic(y - 13500)
rmar <- runif(n) < prob_mar
x2[rmar] <- NA  # introduce MAR

# Regression with missing binary x2 (listwise deletion)
model_mar <- lm(y ~ x1 + factor(x2) + x3, na.action = na.omit)

# Single Mode Imputation
set.seed(12345)

# Recreate variables
x1 <- rnorm(n, mean = 40, sd = 12)
x2 <- as.numeric(runif(n) < 0.55)
x3 <- rnorm(n, mean = 150, sd = 5)
y <- 30 * x1 + 400 * x2 + 50 * x3 + rnorm(n, mean = 5000, sd = 1500)

# Apply MAR
prob_mar_imp <- logistic(y - 13500)
rmar_imp <- runif(n) < prob_mar_imp
x2[rmar_imp] <- NA

# Mode imputation for binary variable
mode_x2 <- as.numeric(sum(x2 == 1, na.rm = TRUE) >= sum(x2 == 0, na.rm = TRUE))
x2[is.na(x2)] <- mode_x2

# Regression after mode imputation
model_mode_imp <- lm(y ~ x1 + factor(x2) + x3)

# Output 
stargazer(model, model_mar, model_mode_imp,
          type = "text",
          title = "Table 1: Regression Models",
          column.labels = c("God Model", "MAR Model", "Single Mode Imputation"),
          covariate.labels = c("x1", "x2 = 1", "x3"),
          dep.var.labels = "y",
          model.names = FALSE,
          star.cutoffs = c(0.05, 0.01, 0.001),
          notes = "Data Source: Simulated",
          digits = 2)


# Single Median Imputation
# God Model
set.seed(12345)
n <- 1000

# Generate variables
x1 <- rnorm(n, mean = 40, sd = 12)
x2 <- sample(1:5, n, replace = TRUE)  # Equivalent to ceil(runiform() * 5)
x3 <- rnorm(n, mean = 150, sd = 5)
y <- 30 * x1 + 400 * x2 + 50 * x3 + rnorm(n, mean = 5000, sd = 1500)

# Run regression with factor x2
model <- lm(y ~ x1 + factor(x2) + x3)

# MAR Model
set.seed(12345)

# Recreate variables
x1 <- rnorm(n, mean = 40, sd = 12)
x2 <- sample(1:5, n, replace = TRUE)
x3 <- rnorm(n, mean = 150, sd = 5)
y <- 30 * x1 + 400 * x2 + 50 * x3 + rnorm(n, mean = 5000, sd = 1500)

# Apply MAR mechanism
logistic <- function(z) { 1 / (1 + exp(-z)) }
prob_mar <- logistic(y - 13500)
rmar <- runif(n) < prob_mar
x2[rmar] <- NA  # introduce missingness in x2

# Regression with missing binary x2 (listwise deletion)
model_mar <- lm(y ~ x1 + factor(x2) + x3, na.action = na.omit)

# Single Median Imputation
set.seed(12345)

# Recreate variables
x1 <- rnorm(n, mean = 40, sd = 12)
x2 <- sample(1:5, n, replace = TRUE)  # Ordinal variable
x3 <- rnorm(n, mean = 150, sd = 5)
y <- 30 * x1 + 400 * x2 + 50 * x3 + rnorm(n, mean = 5000, sd = 1500)

# Apply MAR mechanism
prob_mar_imp <- logistic(y - 13500)
rmar_imp <- runif(n) < prob_mar_imp
x2[rmar_imp] <- NA

# Step 1: Get the median of non-missing x2
med_x2 <- median(x2, na.rm = TRUE)

# Step 2: Replace missing values with the median
x2[is.na(x2)] <- med_x2

# Regression after median imputation
model_median_imp <- lm(y ~ x1 + factor(x2) + x3)

# Output
stargazer(model, model_mar, model_median_imp,
          type = "text",
          title = "Table 1: Regression Models",
          column.labels = c("God Model", "MAR Model", "Single Median Imputation"),
          covariate.labels = c("x1", "x2", "x3"),
          dep.var.labels = "y",
          model.names = FALSE,
          star.cutoffs = c(0.05, 0.01, 0.001),
          notes = "Data Source: Simulated",
          digits = 2)


# Dummy Varaible Adjustment
# God Model
set.seed(12345)
n <- 1000

# Generate variables
x1 <- rnorm(n, mean = 40, sd = 12)
x2 <- runif(n) < 0.55  # Equivalent to runiform() < 0.55 in Stata
x3 <- rnorm(n, mean = 150, sd = 5)
y <- 30 * x1 + 400 * x2 + 50 * x3 + rnorm(n, mean = 5000, sd = 1500)

# Run regression with factor x2 (binary variable)
model <- lm(y ~ x1 + factor(x2) + x3)

# MAR Model
set.seed(12345)

# Recreate variables
x1 <- rnorm(n, mean = 40, sd = 12)
x2 <- runif(n) < 0.55  # Binary variable
x3 <- rnorm(n, mean = 150, sd = 5)
y <- 30 * x1 + 400 * x2 + 50 * x3 + rnorm(n, mean = 5000, sd = 1500)

# Apply MAR mechanism
logistic <- function(z) { 1 / (1 + exp(-z)) }
prob_mar <- logistic(y - 13500)
rmar <- runif(n) < prob_mar
x2[rmar] <- NA  # Introduce missingness in x2

# Regression with missing binary x2 (listwise deletion)
model_mar <- lm(y ~ x1 + factor(x2) + x3, na.action = na.omit)

# Dummy Var = 0
set.seed(12345)

# Recreate variables
x1 <- rnorm(n, mean = 40, sd = 12)
x2 <- runif(n) < 0.55
x3 <- rnorm(n, mean = 150, sd = 5)
y <- 30 * x1 + 400 * x2 + 50 * x3 + rnorm(n, mean = 5000, sd = 1500)

# Apply MAR mechanism and introduce missing values
prob_mar_0 <- logistic(y - 13500)
rmar_0 <- runif(n) < prob_mar_0
x2[rmar_0] <- NA

# Replace missing values in x2 with 0
x2[is.na(x2)] <- 0

# Regression with adjusted x2
model_0 <- lm(y ~ x1 + factor(x2) + x3)

# Dummy Var = 1
set.seed(12345)

# Recreate variables
x1 <- rnorm(n, mean = 40, sd = 12)
x2 <- runif(n) < 0.55
x3 <- rnorm(n, mean = 150, sd = 5)
y <- 30 * x1 + 400 * x2 + 50 * x3 + rnorm(n, mean = 5000, sd = 1500)

# Apply MAR mechanism and introduce missing values
prob_mar_1 <- logistic(y - 13500)
rmar_1 <- runif(n) < prob_mar_1
x2[rmar_1] <- NA

# Replace missing values in x2 with 1
x2[is.na(x2)] <- 1

# Regression with adjusted x2
model_1 <- lm(y ~ x1 + factor(x2) + x3)

stargazer(model, model_mar, model_0, model_1,
          type = "text",
          title = "Table 1: Regression Models",
          column.labels = c("God Model", "MAR Model", "Dummy = 0", "Dummy = 1"),
          covariate.labels = c("x1", "x2", "x2", "x3"),
          dep.var.labels = "y",
          model.names = FALSE,
          star.cutoffs = c(0.05, 0.01, 0.001),
          notes = "Data Source: Simulated",
          digits = 2)


# Full Information Maximum Likelihood 
# God Model
set.seed(12345)
n <- 1000

# Generate variables
x1 <- rnorm(n, mean = 40, sd = 12)
x2 <- rnorm(n, mean = 200, sd = 50)
x3 <- rnorm(n, mean = 150, sd = 5)
y <- 30 * x1 + 40 * x2 + 50 * x3 + rnorm(n, mean = 5000, sd = 1500)

# Run regression for the God Model
model <- lm(y ~ x1 + x2 + x3)

# MAR Model
set.seed(12345)

# Recreate variables for MAR
x1 <- rnorm(n, mean = 40, sd = 12)
x2 <- rnorm(n, mean = 200, sd = 50)
x3 <- rnorm(n, mean = 150, sd = 5)
y <- 30 * x1 + 40 * x2 + 50 * x3 + rnorm(n, mean = 5000, sd = 1500)

# Apply MAR mechanism
logistic <- function(z) { 1 / (1 + exp(-z)) }
prob_mar_fiml <- logistic((y - mean(y)) / 1000)  # Scale to create non-trivial probs
rmar <- runif(n) < prob_mar
x2[rmar] <- NA  # Introduce missingness in x2

# Run regression with missing data for MAR model (listwise deletion)
model_mar <- lm(y ~ x1 + x2 + x3, na.action = na.omit)

# FIML
set.seed(12345)

# Recreate variables for FIML
x1 <- rnorm(n, mean = 40, sd = 12)
x2 <- rnorm(n, mean = 200, sd = 50)
x3 <- rnorm(n, mean = 150, sd = 5)
y <- 30 * x1 + 40 * x2 + 50 * x3 + rnorm(n, mean = 5000, sd = 1500)

# Apply MAR mechanism for FIML
# Define logistic function
logistic <- function(z) { 1 / (1 + exp(-z)) }

# Generate missingness based on y (MAR if x2 is missing depending on y)
prob_mar_fiml <- logistic((y - mean(y)) / 1000)  # Scale to create non-trivial probs
rmar_fiml <- runif(n) < prob_mar_fiml
x2[rmar_fiml] <- NA

# Run FIML using SEM model
fiml_model <- '
  y ~ x1 + x2 + x3 # y as a function of x1, x2, and x3
'
# Fit FIML with lavaan
fit_fiml <- sem(fiml_model, data = data.frame(y, x1, x2, x3), missing = "fiml", fixed.x = FALSE)

# Output using stargazer for linear models (God and MAR models)
stargazer(model, model_mar,
          type = "text",
          title = "Table 1: Regression Models",
          column.labels = c("God Model", "MAR Model"),
          covariate.labels = c("x1", "x2", "x3"),
          dep.var.labels = "y",
          model.names = FALSE,
          star.cutoffs = c(0.05, 0.01, 0.001),
          notes = "Data Source: Simulated",
          digits = 2)

# Output for FIML model using summary from lavaan
summary(fit_fiml, fit.measures = TRUE, standardized = TRUE)


# Load required libraries
library(mice)
library(stargazer)

# Simulate data for God Model
set.seed(12345)
n <- 1000
x1 <- rnorm(n, 40, 12)
x2 <- rnorm(n, 200, 50)
x3 <- rnorm(n, 150, 5)
y  <- 30 * x1 + 40 * x2 + 50 * x3 + rnorm(n, 5000, 1500)
god_model <- lm(y ~ x1 + x2 + x3)

# Simulate data for MAR Model (with missingness)
set.seed(12345)
x1 <- rnorm(n, 40, 12)
x2 <- rnorm(n, 200, 50)
x3 <- rnorm(n, 150, 5)
y  <- 30 * x1 + 40 * x2 + 50 * x3 + rnorm(n, 5000, 1500)
logistic <- function(z) { 1 / (1 + exp(-z)) }
prob_mar <- logistic(y - 21791)
rmar <- runif(n) < prob_mar
x2[rmar] <- NA
mar_model <- lm(y ~ x1 + x2 + x3, na.action = na.omit)

# Display God and MAR models side by side
stargazer(god_model, mar_model,
          type = "text",  # use "html" or "latex" if needed
          column.labels = c("God Model", "MAR Model"),
          dep.var.caption = "Dependent variable: y",
          title = "Table 1: Regression Models",
          digits = 2)

# ---- MI Model Setup and Summary ----
# Generate the data for primary and auxiliary variables
set.seed(12345)
x1 <- rnorm(n, 40, 12)
x2 <- rnorm(n, 200, 50)
x3 <- rnorm(n, 150, 5)
y  <- 30 * x1 + 40 * x2 + 50 * x3 + rnorm(n, 5000, 1500)
logistic <- function(z) { 1 / (1 + exp(-z)) }
prob_mar <- logistic(y - 21791)
rmar <- runif(n) < prob_mar
x2[rmar] <- NA

# Auxiliary variable generation (same as before)
aux1 <- 0.7*x2 + 0.3*y + rnorm(n, 0, 10)
aux2 <- 0.5*x2 + 0.5*y + rnorm(n, 0, 15)
aux3 <- 0.6*x2 + 0.2*x1 + 0.2*y + rnorm(n, 0, 12)
aux4 <- 0.4*x2 + 0.6*y + rnorm(n, 0, 20)
aux5 <- 0.3*x2 + 0.3*y + 0.4*x3 + rnorm(n, 0, 18)
aux6 <- 0.9*x2 + rnorm(n, 0, 10)
aux7 <- 0.8*x2 + 0.2*x3 + rnorm(n, 0, 12)
aux8 <- 0.85*x2 + 0.1*x1 + rnorm(n, 0, 15)
aux9 <- 0.4*x3 + rnorm(n, 0, 4)

# Combine into data frame
mi_data <- data.frame(y, x1, x2, x3, aux1, aux2, aux3, aux4, aux5, aux6, aux7, aux8, aux9)

# Specify the imputation method for continuous variables (PMM for primary variables)
meth <- make.method(mi_data)
meth[c("x1", "x2", "x3", "y")] <- "pmm"

# Do not impute auxiliary variables, but use them as predictors for imputing others
meth[c("aux1", "aux2", "aux3", "aux4", "aux5", "aux6", "aux7", "aux8", "aux9")] <- ""

# Create a predictor matrix
pred <- quickpred(mi_data, minpuc = 0.2)

# Run multiple imputation
imp <- mice(mi_data, m = 100, method = meth, predictorMatrix = pred, maxit = 10, seed = 12345)

# Check convergence
plot(imp)

# Fit model on imputed datasets
model <- with(imp, lm(y ~ x1 + x2 + x3))

# Pool results
pooled <- pool(model)

# Summarize pooled results
summary(pooled)
