## ---- working directory ------------------------------------------------------

# must be changed
setwd(dir = "C:\FH\Semester5\DAT")


## ---- load body fat data -----------------------------------------------------
# load package and data
require(UsingR)
data(fat)

# variable names
names(fat)


## ---- data cleaning ----------------------------------------------------------
# zero body fat observation
sum(fat$body.fat == 0)

# set to NA
fat$body.fat[fat$body.fat == 0] <- NA

# remove some columns
fat <- fat[, !(names(fat) %in% c("case", "body.fat.siri", "density",
                                 "ffweight"))]
dim(fat)

# remove some cases
fat <- fat[-c(31, 39, 42, 86, 182), ]

# transform height to cm
fat$height <- fat$height * 2.54



## ---- model and summary ------------------------------------------------------
lin_mod_fat <- lm(body.fat ~ ., data = fat)
summary(lin_mod_fat)

# coefficient estimates
coef(lin_mod_fat)


## ---- series of linear models ------------------------------------------------
# remove the knee predictor
lin_mod_fat1 <- update(lin_mod_fat, . ~ . - knee)
summary(lin_mod_fat1)

# remove the ankle predictor
lin_mod_fat2 <- update(lin_mod_fat1, . ~ . - ankle)
summary(lin_mod_fat2)

# remove the height predictor
lin_mod_fat3 <- update(lin_mod_fat2, . ~ . - height)
summary(lin_mod_fat3)

# remove the bicep predictor
lin_mod_fat4 <- update(lin_mod_fat3, . ~ . - bicep)
summary(lin_mod_fat4)

# remove the weight predictor
lin_mod_fat5 <- update(lin_mod_fat4, . ~ . - weight)
summary(lin_mod_fat5)

# remove the thigh predictor
lin_mod_fat6 <- update(lin_mod_fat5, . ~ . - thigh)
summary(lin_mod_fat6)

# remove the forearm predictor
lin_mod_fat7 <- update(lin_mod_fat6, . ~ . - forearm)
summary(lin_mod_fat7)

# remove the neck predictor
lin_mod_fat8 <- update(lin_mod_fat7, . ~ . - neck)
summary(lin_mod_fat8)

# remove the hip predictor
lin_mod_fat9 <- update(lin_mod_fat8, . ~ . - hip)
summary(lin_mod_fat9)


## ---- plot observed versus predicted -----------------------------------------

par(cex.main = 1.5, cex.lab = 1.3, cex.axis = 1.3)
# get observed and predicted values
obs  <- fat$body.fat
pred <- predict(lin_mod_fat9)   # predict the training sample

# plot
plot(x = obs, y = pred, col = rgb(0,0,1,0.5), pch = 19, xlim = c(0, 50), ylim = c(0, 50),
     xlab = "observed", ylab = "predicted", main = "Body Fat - Observed vs. Predicted")
abline(a = 0, b = 1, lwd = 2)
par(cex.main = 1.2, cex.lab = 1.0, cex.axis = 1.0)


## ---- model quality ----------------------------------------------------------
# e.g. package Metrics
require(Metrics)

# RMSE and MSE
mse(actual = obs, predicted = pred)
rmse(actual = obs, predicted = pred)


## ---- all possible subsets ---------------------------------------------------
# load package
require(leaps)

# keep best model of each size up to p = 14
regss <- regsubsets(body.fat ~ ., data = fat, nbest = 1, nvmax = 14,
                    intercept = TRUE, method = "exhaustive")

# results
sum_regss <- summary(regss)
sum_regss$which


# plot quality measures 
par(cex.main = 1.6, cex.lab = 1.4, cex.axis = 1.4)
plot(x = apply(sum_regss$which, 1, sum) - 1,
     y = sum_regss$bic, pch = 19, type = "o", main = "BIC versus Model Size",
     xlab = "No. of Predictors", ylab = "Bayes Information Criterion BIC")
par(cex.main = 1.2, cex.lab = 1.0, cex.axis = 1.0)


## ----plot_reg_all, echo = FALSE, fig.height = 13, fig.width = 13, out.width = ".44\\linewidth", fig.align = "center", fig.show = "hold"--------------------------------------------
par(cex.main = 1.7, cex.lab = 1.5, cex.axis = 1.5)
par(mfrow = c(2, 2))
nv <- apply(sum_regss$which, 1, sum) - 1
plot(x = nv,
     y = sum_regss$rsq, pch = 19, type = "o", main = "R^2 versus Model Size",
     xlab = "No. of Predictors", ylab = "R^2")
abline(v = which.max(sum_regss$rsq), lwd = 2, col = "red")
plot(x = nv,
     y = sum_regss$adjr2, pch = 19, type = "o", main = "Adjusted R^2 versus Model Size",
     xlab = "No. of Predictors", ylab = "Adjusted R^2")
abline(v = which.max(sum_regss$adjr2), lwd = 2, col = "red")
plot(x = nv,
     y = sum_regss$cp, pch = 19, type = "o", main = "Cp versus Model Size",
     xlab = "No. of Predictors", ylab = "Mallows Cp")
abline(v = 7, lwd = 2, col = "red")
plot(x = nv,
     y = sum_regss$bic, pch = 19, type = "o", main = "BIC versus Model Size",
     xlab = "No. of Predictors", ylab = "BIC")
abline(v = which.min(sum_regss$bic), lwd = 2, col = "red")
par(cex.main = 1.2, cex.lab = 1.0, cex.axis = 1.0)


## ---- forward and backward selection -----------------------------------------

# keep best model of each size up to p = 14
regss_forward <- regsubsets(body.fat ~ ., data = fat, nbest = 1, nvmax = 14,
                            intercept = TRUE, method = "forward")

# results
sum_regss_forward <- summary(regss_forward)
sum_regss_forward$which


# keep best model of each size up to p = 14
regss_backward <- regsubsets(body.fat ~ ., data = fat, nbest = 1, nvmax = 14,
                             intercept = TRUE, method = "backward")

# results
sum_regss_backward <- summary(regss_backward)
sum_regss_backward$which


# plot
par(cex.main = 2.5, cex.lab = 2, cex.axis = 2, mar = c(5,5,4,2))
par(mfrow = c(1, 3))
nv_all <- apply(sum_regss$which, 1, sum) - 1
nv_forward <- apply(sum_regss_forward$which, 1, sum) - 1
nv_backward <- apply(sum_regss_backward$which, 1, sum) - 1

plot(x = nv_all,
     y = sum_regss$adjr2, pch = 19, type = "o", main = "Adjusted R^2 versus Model Size",
     xlab = "No. of Predictors", ylab = "Adjusted R^2")
lines(x = nv_forward, y = sum_regss_forward$adjr2, type = "o", col = "red")
lines(x = nv_backward, y = sum_regss_backward$adjr2, type = "o", col = "blue")
abline(v = which.max(sum_regss$adjr2), col = "black")
abline(v = which.max(sum_regss_forward$adjr2), col = "red")
abline(v = which.max(sum_regss_backward$adjr2), col = "blue")

plot(x = nv_all,
     y = sum_regss$cp, pch = 19, type = "o", main = "Mallows Cp versus Model Size",
     xlab = "No. of Predictors", ylab = "Mallows Cp")
lines(x = nv_forward, y = sum_regss_forward$cp, type = "o", col = "red")
lines(x = nv_backward, y = sum_regss_backward$cp, type = "o", col = "blue")

# durch nachsehen cp = approx p bestimmt
abline(v = 7, col = "black")
abline(v = 7, col = "red")
abline(v = 7, col = "blue")


plot(x = nv_all,
     y = sum_regss$bic, pch = 19, type = "o", main = "BIC versus Model Size",
     xlab = "No. of Predictors", ylab = "BIC")
lines(x = nv_forward, y = sum_regss_forward$bic, type = "o", col = "red")
lines(x = nv_backward, y = sum_regss_backward$bic, type = "o", col = "blue")

abline(v = which.min(sum_regss$bic), col = "black")
abline(v = which.min(sum_regss_forward$bic), col = "red")
abline(v = which.min(sum_regss_backward$bic), col = "blue")

par(cex.main = 1.2, cex.lab = 1.0, cex.axis = 1.0, mar = c(5,4,4,2) + 0.1)



## ---- plot the residuals -----------------------------------------------------
# the model with p = 2 predictors
lmod <- lm(body.fat ~ weight + height, data = fat)

# plots
par(mfrow = c(1, 2), cex.main = 1.4, cex.axis = 1.2, cex.lab = 1.2)
plot(body.fat ~ weight, data = fat, pch = 19, main = "Body Fat versus Weight",
     xlab = "Weight [lbs]", ylab = "Body Fat [%]")
plot(body.fat ~ height, data = fat, pch = 19, main = "Body Fat versus Height",
     xlab = "Height [cm]", ylab = "Body Fat [%]")
par(mfrow = c(1, 1), cex.main = 1.2, cex.axis = 1.0, cex.lab = 1.0)



## ---- plot residuals versus fitted values ------------------------------------
par(mfrow = c(1, 2), cex.main = 1.4, cex.lab = 1.2, cex.axis = 1.2)
# residuals versus fitted
plot(lmod, which = 1:2)
par(mfrow = c(1, 1), cex.main = 1.2, cex.lab = 1.0, cex.axis = 1.0)



## ---- plot negative examples -------------------------------------------------
par(mfrow = c(2, 2), mar = c(4,4,3,1))
# first plot - non linear influence
set.seed(123)
x <- runif(100, min = 0, max = 3)
y_temp <- x^2
y <- y_temp + rnorm(100, mean = 0, sd = 0.7)

lin_mod_A <- lm(y ~ x)
plot(lin_mod_A, which = 1, pch = 19, lwd = 2, sub.caption = "No linear relation x/y", cex = 0.7)

# second plot - heteroscedastic values
set.seed(123)
x <- sort(x, decreasing = FALSE)
y_temp_2 <- 2 * x
y_2 <- y_temp_2 + rnorm(100, mean = 0, sd = 0.7) * seq(from = 0, to = 1, length.out = 100)
lin_mod_B <- lm(y_2 ~ x)
plot(lin_mod_B, which = 1, pch = 19, lwd = 2, sub.caption = "No constant variance", cex = 0.7)

# third plot - no normal residuals 1
set.seed(123)
x <- sort(x, decreasing = FALSE)
y_temp_3 <- 2 * x
y_3 <- y_temp_3 + runif(100, min = 0, max = 2)
lin_mod_C <- lm(y_3 ~ x)
plot(lin_mod_C, which = 2, pch = 19, lwd = 2, sub.caption = "No normal residuals (uniform)", cex = 0.7)

# fourth plot - no normal residuals 2
set.seed(123)
x <- sort(x, decreasing = FALSE)
y_temp_4 <- 2 * x
y_4 <- y_temp_4 + rlnorm(100, meanlog = 0, sdlog = 1)
lin_mod_D <- lm(y_4 ~ x)
plot(lin_mod_D, which = 2, pch = 19, lwd = 2, sub.caption = "No normal residuals (lognormal)", cex = 0.7)
par(mfrow = c(1, 1))



## ---- homo and heteroscedastic data ------------------------------------------
par(mfrow = c(1, 2))
plot(lmod, which = 3)

# second plot - heteroscedasticity
plot(lin_mod_B, which = 3, pch = 19, lwd = 2, sub.caption = "No constant variance", cex = 0.7)

par(mfrow = c(1, 1))



## ---- outliers ---------------------------------------------------------------
par(cex.main = 1.5, cex.axis = 1.3, cex.lab = 1.3)
set.seed(123)
x <- 1:6
y <- x + rnorm(6, mean = 0, sd = 0.4)
plot(x, y, pch = 19, xlab = "x", ylab = "y", main = "Regression Outlier with low Leverage", cex = 1.4, xlim = c(0, 10), ylim = c(0, 10))
lmm <- lm(y ~ x)
abline(lmm, lty = "solid", lwd = 2)
x2 <- c(x, 3)
y2 <- c(y, 1)
lmm2 <- lm(y2 ~ x2)
points(x = 3, y = 1, col = "red", cex = 2, pch = 19)
abline(lmm2, lty = "dashed", lwd = 2)
par(cex.main = 1.2, cex.axis = 1.0, cex.lab = 1.0)



## ---- further outliers -------------------------------------------------------
par(mfrow = c(1,2), cex.main = 1.5, cex.axis = 1.3, cex.lab = 1.3)
set.seed(123)
x <- 1:6
y <- x + rnorm(6, mean = 0, sd = 0.4)
plot(x, y, pch = 19, xlab = "x", ylab = "y", main = "Regression Outlier with high Leverage", cex = 1.4, xlim = c(0, 10), ylim = c(0, 10))
lmm <- lm(y ~ x)
abline(lmm, lty = "solid", lwd = 2)
x2 <- c(x, 9)
y2 <- c(y, 4)
lmm2 <- lm(y2 ~ x2)
points(x = 9, y = 4, col = "blue", cex = 2, pch = 19)
abline(lmm2, lty = "dashed", lwd = 2)

plot(x, y, pch = 19, xlab = "x", ylab = "y", main = "High Leverage Point", cex = 1.4, xlim = c(0, 10), ylim = c(0, 10))
lmm <- lm(y ~ x)
abline(lmm, lty = "solid", lwd = 2)
x3 <- c(x, 9)
y3 <- c(y, 9 + rnorm(1))
lmm3 <- lm(y3 ~ x3)
points(x = x3[length(x3)], y = y3[length(y3)], col = "green", cex = 2, pch = 19)
abline(lmm3, lty = "dashed", lwd = 2)

par(mfrow = c(1,1), cex.main = 1.2, cex.axis = 1.0, cex.lab = 1.0)



## ---- plot_hatvalues ---------------------------------------------------------
# hat values for our fat data regression
plot(hatvalues(lmod), pch = 19,
     main = "Hat Values versus Case Index",
     xlab = "Observation i",
     ylab = "Hat Value hii")



# which hat problematic?
# determine eventually problematic cases
mean_hat <- mean(hatvalues(lmod))
hatvalues(lmod)[hatvalues(lmod) > 3 * mean_hat]



## ---- studentized residuals --------------------------------------------------
# critical value; p = 2 predictors
crit_val <- qt(p = 0.975, df = nrow(fat) - 2 - 2)
e_ist <- rstudent(lmod)
e_ist[e_ist < -crit_val | e_ist > crit_val]



## ---- plot studentized residuals ---------------------------------------------
par(mfrow = c(1, 2), cex.main = 1.6, cex.axis = 1.3, cex.lab = 1.3)
# plot studentized versus hatvalues
plot(x = hatvalues(lmod), y = rstudent(lmod), pch = 19, cex = 0.7,
     main = "Studentized Residuals versus Leverage", xlab = "Hatvalues",
     ylab = "Studentized Residuals")

# plot.lm
plot(lmod, which = 5)
par(mfrow = c(1, 1), cex.main = 1.2, cex.axis = 1.0, cex.lab = 1.0)


## ---- cooks distance plot ----------------------------------------------------
# cooks distance plot; values over 1 critical
plot(lmod, which = 4, cex.caption = 1.4, pch = 19, cex.id = 1.5)
