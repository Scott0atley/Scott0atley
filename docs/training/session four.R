# Load packages
library(mice)
library(dplyr)

# Set seed for reproducibility
set.seed(42)

# ----- STEP 1: SIMULATE DATA -----

n <- 200

# Simulate variables
income     <- round(rnorm(n, mean = 50000, sd = 10000), 0)       # Continuous outcome
age        <- rnorm(n, 40, 10)                                   # Continuous predictor
gender     <- rbinom(n, 1, 0.5)                                  # Binary predictor
education  <- factor(sample(c("low", "med", "high"), n, replace = TRUE, prob = c(0.3, 0.5, 0.2)),
                     ordered = TRUE, levels = c("low", "med", "high"))  # Ordinal predictor

# Auxiliary variables (fully observed)
aux1 <- rnorm(n, mean = age + 5, sd = 5)     # Related to age
aux2 <- rnorm(n, mean = income/10000, sd = 2)  # Related to income

# Data frame
df <- data.frame(income, age, gender, education, aux1, aux2)

# ----- STEP 2: INDUCE MISSINGNESS -----

# Introduce missingness in age, gender, and education
df$age[sample(1:n, 30)] <- NA
df$gender[sample(1:n, 20)] <- NA
df$education[sample(1:n, 25)] <- NA
df$income[sample(1:n, 20)] <- NA

md.pattern(df)

# ----- STEP 3: SETUP TYPES -----

df$gender <- factor(df$gender, levels = c(0, 1))
df$education <- ordered(df$education, levels = c("low", "med", "high"))

# ----- STEP 4: USE QUICKPRED -----

# Automatically include auxiliaries as predictors (not imputed)
pred <- quickpred(df, minpuc = 0.2, exclude = "income")

# Optional: verify which variables are used to impute others
print(pred)

# ----- STEP 5: DEFINE IMPUTATION METHODS -----

meth <- make.method(df)
meth["age"]       <- "pmm"     # Continuous
meth["gender"]    <- "logreg"  # Binary
meth["education"] <- "polr"    # Ordinal
meth["income"]    <- "pmm"     # Outcome (if also has missingness)

# Don't impute auxiliaries
meth["aux1"] <- ""
meth["aux2"] <- ""

# ----- STEP 6: RUN MICE -----

imp <- mice(df, m = 5, method = meth, predictorMatrix = pred, maxit = 10, seed = 123)

# Check convergence
plot(imp)

# ----- STEP 7: ANALYZE IMPUTED DATA -----

# Fit linear regression model on imputed datasets
model <- with(imp, lm(income ~ age + gender + education))

# Pool results
pooled <- pool(model)

# Summary of pooled model
summary(pooled)

# Variance table
pool.r.squared(pooled)

