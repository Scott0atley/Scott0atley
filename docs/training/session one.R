# Session One


# Load required packages
library(tidyverse)
library(mice)
library(naniar)
library(haven)

# Set Directory
setwd("G:/Stata data and do/do files/missing data training/data")

# Load the Stata dataset
df <- read_dta("datasetone.dta")

# View the first few rows
head(df)

# Check the structure of the dataset
str(df)

# Identify missingness summary
summary(df)                     # General summary, including NA counts
miss_var_summary(df)            # naniar: summary of missingness per variable
vis_miss(df)                    # Visualization of missingness (optional)

# Pattern of missing data
md.pattern(df[, c("x1", "x2", "x3")])   # mice: shows missing data pattern

# Regression model (complete cases by default)
model <- lm(y ~ x1 + x2 + x3, data = df)
summary(model)

# MCAR test 
mcar_test(df[, c("y", "x1", "x2", "x3")])  # From naniar package

# T-test on y by missingness in x2
df <- df %>% mutate(miss = is.na(x2))
t.test(y ~ miss, data = df)

# Logistic regression on missingness in x2
df <- df %>% mutate(missing = if_else(is.na(x2), 1, 0))
table(df$missing)

logit_model <- glm(missing ~ y + x1 + x3, data = df, family = binomial)
summary(logit_model)

# Replicate this structure for Datasets two and three. Once done, attempt to make a matchup of which dataset reflects which missingness mechanism.

