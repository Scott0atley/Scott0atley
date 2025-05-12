# Session Three

library(lavaan)
library(dplyr)

set.seed(12345)
n <- 1000
logistic <- function(z) 1 / (1 + exp(-z))

# Continuous Predictor
# God Model
x1 <- rnorm(n, mean = 40, sd = 12)
x2 <- rnorm(n, mean = 200, sd = 50)
x3 <- rnorm(n, mean = 150, sd = 5)
y <- 30 * x1 + 40 * x2 + 50 * x3 + rnorm(n, mean = 5000, sd = 1500)

dat1 <- data.frame(x1, x2, x3, y)

fit_god <- sem('y ~ x1 + x2 + x3', data = dat1, missing = "fiml")

# MAR version: missingness in x2 based on y
x1 <- rnorm(n, mean = 40, sd = 12)
x2 <- rnorm(n, mean = 200, sd = 50)
x3 <- rnorm(n, mean = 150, sd = 5)
y <- 30 * x1 + 40 * x2 + 50 * x3 + rnorm(n, mean = 5000, sd = 1500)
prob_mar <- logistic(y - 21791)
x2[runif(n) < prob_mar] <- NA

dat2 <- data.frame(x1, x2, x3, y)

fit_fiml <- sem('y ~ x1 + x2 + x3', data = dat2, missing = "fiml", fixed.x = FALSE)


# Binary Predictor

# God Model
x1 <- rnorm(n, 40, 12)
x2 <- as.numeric(runif(n) < 0.55)
x3 <- rnorm(n, 150, 5)
y <- 30 * x1 + 400 * x2 + 50 * x3 + rnorm(n, 5000, 1500)

dat_bin1 <- data.frame(x1, x2, x3, y)
fit_bin_god <- sem('y ~ x1 + x2 + x3', data = dat_bin1, missing = "fiml")

# MAR version
x1 <- rnorm(n, 40, 12)
x2 <- as.numeric(runif(n) < 0.55)
x3 <- rnorm(n, 150, 5)
y <- 30 * x1 + 400 * x2 + 50 * x3 + rnorm(n, 5000, 1500)
prob_mar <- logistic(y - 13500)
x2[runif(n) < prob_mar] <- NA

dat_bin2 <- data.frame(x1, x2, x3, y)
fit_bin_fiml <- sem('y ~ x1 + x2 + x3', data = dat_bin2, missing = "fiml", fixed.x = FALSE)

# Ordinal Predictor

# God Model
x1 <- rnorm(n, 40, 12)
x2 <- ceiling(runif(n) * 5)  # Ordinal: 1 to 5
x3 <- rnorm(n, 150, 5)
y <- 30 * x1 + 400 * x2 + 50 * x3 + rnorm(n, 5000, 1500)

# Dummy code x2
x2_dummies <- model.matrix(~ factor(x2))[ , -1]  # drop intercept
colnames(x2_dummies) <- paste0("x2_", 2:5)
dat_ord1 <- cbind(data.frame(x1, x3, y), x2_dummies)

fit_ord_god <- sem('y ~ x1 + x2_2 + x2_3 + x2_4 + x2_5 + x3', data = dat_ord1, missing = "fiml")

# MAR version
x1 <- rnorm(n, 40, 12)
x2 <- ceiling(runif(n) * 5)
x3 <- rnorm(n, 150, 5)
y <- 30 * x1 + 400 * x2 + 50 * x3 + rnorm(n, 5000, 1500)
# Apply MAR mechanism
prob_mar <- logistic(y - 21791)         # same length as y
rmar <- runif(n) < prob_mar             # same length
x2[rmar] <- NA                          # now x2 still has length n

# Handle missing ordinal
x2_dummies <- model.matrix(~ factor(x2))[ , -1]
colnames(x2_dummies) <- paste0("x2_", 2:5)
dat_ord2 <- cbind(data.frame(x1, x3, y), x2_dummies)

fit_ord_fiml <- sem('y ~ x1 + x2_2 + x2_3 + x2_4 + x2_5 + x3', data = dat_ord2, missing = "fiml", fixed.x = FALSE)

# Summarise Models
summary(fit_god, standardized = TRUE, fit.measures = TRUE)
summary(fit_fiml, standardized = TRUE, fit.measures = TRUE)

summary(fit_bin_god)
summary(fit_bin_fiml)

summary(fit_ord_god)
summary(fit_ord_fiml)

