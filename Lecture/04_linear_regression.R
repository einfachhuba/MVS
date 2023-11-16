## ---- working directory ------------------------------------------------------
# must be changed
setwd(dir = "C:\FH\Semester5\DAT")


## ---- install alr3 package ---------------------------------------------------
install.packages("alr3_2.0.8.tar.gz", repos = NULL)


## ---- heights data -----------------------------------------------------------
# load the package and show first 6 observations
require(alr3)

# values in inches; Mheight = mother height, Dheight = daughter height
head(heights)

# plot
par(cex.main = 1.5, cex.axis = 1.2, cex.lab = 1.2)
heightsm <- heights * 2.54 / 100
plot(heightsm, col = rgb(0,0,1,0.2), pch = 19, xlim = c(1.4, 1.9),
     ylim = c(1.4, 1.9), main = "Inheritance of Heights",
     xlab = "Mothers' Heights [m]", ylab = "Daughters' Heights [m]")
abline(a = 0, b = 1, lty = "dashed")
par(cex.main = 1.2, cex.axis = 1.0, cex.lab = 1.0)



## ---- linear model -----------------------------------------------------------
# linear model
lin_mod <- lm(Dheight ~ Mheight, data = heightsm)

# class of this object
class(lin_mod)

# print the object
lin_mod


## ---- calculate coefficients manually ----------------------------------------
# covariance matrix
(cov_mat <- cov(heightsm))

# mean vector
(mean_vec <- apply(heightsm, 2, mean))

# slope b1
(b1 <- cov_mat[1, 2] / cov_mat[1, 1])

# intercept b0
(b0 <- mean_vec[2] - b1 * mean_vec[1])


## ---- extract coefficients ---------------------------------------------------
# coef() or coefficients()
coef(lin_mod)



## ---- plot dara and line -----------------------------------------------------
par(cex.main = 1.6, cex.axis = 1.3, cex.lab = 1.3)
plot(heightsm, col = rgb(0, 0, 1, 0.2), pch = 19, main = "Inheritance of Heights",
     xlab = "Mothers' Heights [m]", ylab = "Daughters' Heights [m]")
par(cex.main = 1.2, cex.axis = 1.0, cex.lab = 1.0)
abline(lin_mod, lwd = 2, col = "red")



## ---- residuals --------------------------------------------------------------
# extract residuals (a length n vector)
RSS <- sum(residuals(lin_mod)^2)

# denominator, degrees of freedom df
df <- df.residual(lin_mod)

# estimate for sigma^2
RSS / df

require(car)
sigmaHat(lin_mod)

# check
sigmaHat(lin_mod)^2


## ---- summary of linear model ------------------------------------------------
# summary method
summary(lin_mod)


## ---- heights example revisited ----------------------------------------------
lm_heights <- lm(Dheight ~ Mheight, data = heightsm)
lm_heights


## ---- confidence intervals ---------------------------------------------------
# default level = 0.95
confint(lm_heights, parm = "(Intercept)", level = 0.95)
confint(lm_heights, parm = "Mheight", level = 0.95)


## ---- standard error intercept -----------------------------------------------
# number of obs. and extract sigma_hat from summary output
n <- nobs(lm_heights); sigma_hat <- summary(lm_heights)$sigma
sigma_hat / sqrt((n - 1) * var(heightsm$Mheight))


## ---- ci for sigma2 function -------------------------------------------------
conf_sigma2 <- function(model, level = 0.95) {
  
  # residual sum of squares with deviance()
  rss <- deviance(model)
  
  # alpha
  alpha <- 1 - level
  
  # chi^2 quantiles
  lower_chi <- qchisq(p = 1 - alpha/2, df = model$df.residual)
  upper_chi <- qchisq(p = alpha/2, df = model$df.residual)
  
  # confidence interval + names
  ci <- rss / c(lower_chi, upper_chi)
  names(ci) <- c(paste(round(100 * alpha/2, 1), "%"),
                 paste(round(100 * (1 - alpha/2), 1), "%"))
  
  # return result = vector of length 2
  return(ci)
}


## ---- apply the function -----------------------------------------------------
conf_sigma2(model = lm_heights, level = 0.95)
sqrt(conf_sigma2(model = lm_heights, level = 0.95))



## ---- predict daughter height ------------------------------------------------
# newdata mut be a data.frame
predict(lin_mod, newdata = data.frame(Mheight = 1.68))


## ---- ci for prediction ------------------------------------------------------
predict(object = lin_mod, newdata = data.frame(Mheight = 1.68),
        interval = "confidence", level = 0.95)


## ---- plot CI ----------------------------------------------------------------
require(car)
par(cex.lab = 1.3, cex.axis = 1.3, cex.main = 1.5)

# scatter plot
plot(heightsm, pch = 19, xlab = "Mheight [m]", ylab = "Dheight [m]",
     main = "Confidence Bands", col = rgb(0, 0, 1, 0.2))

# regression line with regLine (car)
regLine(lin_mod, col = "red", lwd = 2)

# confidence interval for expectation
raster_h <- seq(from = min(heightsm[, "Mheight"]), to = max(heightsm[, "Mheight"]), by = 0.01)
df_new <- data.frame(Mheight = raster_h)
ci <- predict(object = lin_mod, newdata = df_new, interval = "confidence")

# lower and upper bound for CI
lines(x = raster_h, y = ci[, "lwr"], col = "red", lty = "dashed", lwd = 2)
lines(x = raster_h, y = ci[, "upr"], col = "red", lty = "dashed", lwd = 2)

par(cex.lab = 1.0, cex.axis = 1.0, cex.main = 1.2)



## ---- plot ci large ----------------------------------------------------------
require(car)
par(cex.lab = 1.3, cex.axis = 1.3, cex.main = 1.5)

# scatter plot
plot(heightsm, pch = 19, xlab = "Mheight [m]", ylab = "Dheight [m]",
     main = "Confidence Bands", col = rgb(0, 0, 1, 0.2), xlim = c(1.65, 1.70), ylim = c(1.65, 1.69))

# regression line with regLine (car)
regLine(lin_mod, col = "red", lwd = 2)

# confidence interval for expectation
raster_h <- seq(from = min(heightsm[, "Mheight"]), to = max(heightsm[, "Mheight"]), by = 0.01)
df_new <- data.frame(Mheight = raster_h)
ci <- predict(object = lin_mod, newdata = df_new, interval = "confidence")

# lower and upper bound for CI
lines(x = raster_h, y = ci[, "lwr"], col = "red", lty = "dashed", lwd = 2)
lines(x = raster_h, y = ci[, "upr"], col = "red", lty = "dashed", lwd = 2)

ci_single <- predict(lin_mod, data.frame(Mheight = 1.68), interval = "confidence")

Arrows(x0 = 1.68, x1 = 1.68, y0 = -5,
       y1 = ci_single[1, "lwr"],
       col = "grey40", lwd = 2, code = 2, arr.adj = 1)
Arrows(x0 = 1.68, x1 = 1.648, y0 = ci_single[1, "lwr"],
       y1 = ci_single[1, "lwr"], col = "grey40", lwd = 2, code = 2, arr.adj = 1)

Arrows(x0 = 1.68, x1 = 1.68, y0 = ci_single[1, "lwr"],
       y1 = ci_single[1, "upr"],
       col = "grey40", lwd = 2, code = 2, arr.adj = 1)
Arrows(x0 = 1.68, x1 = 1.648, y0 = ci_single[1, "upr"],
       y1 = ci_single[1, "upr"], col = "grey40", lwd = 2, code = 2, arr.adj = 1)

par(cex.lab = 1.0, cex.axis = 1.0, cex.main = 1.2)



## ---- prediction interval ----------------------------------------------------
# new observation x0, prediction interval
predict(object = lin_mod, newdata = data.frame(Mheight = 1.68),
        interval = "prediction", level = 0.95)


## ----pi_plotA, fig.height = 6.5, fig.width = 6.5, out.width = ".70\\linewidth", fig.align = "center", echo = FALSE, fig.show = "hold", message = FALSE, warning = FALSE------------
require(car)
par(cex.lab = 1.3, cex.axis = 1.3, cex.main = 1.5)

# scatter plot
plot(heightsm, pch = 19, xlab = "Mheight [m]", ylab = "Dheight [m]",
     main = "Prediction Bands", col = rgb(0, 0, 1, 0.2))

# regression line with regLine (car)
regLine(lin_mod, col = "red", lwd = 2)

# confidence interval for expectation
raster_h <- seq(from = min(heightsm[, "Mheight"]), to = max(heightsm[, "Mheight"]), by = 0.01)
df_new <- data.frame(Mheight = raster_h)
ci <- predict(object = lin_mod, newdata = df_new, interval = "confidence")
pi <- predict(object = lin_mod, newdata = df_new, interval = "prediction")

# lower and upper bound for CI
lines(x = raster_h, y = ci[, "lwr"], col = "red", lty = "dashed", lwd = 2)
lines(x = raster_h, y = ci[, "upr"], col = "red", lty = "dashed", lwd = 2)
lines(x = raster_h, y = pi[, "lwr"], col = "red", lty = "dotdash", lwd = 2)
lines(x = raster_h, y = pi[, "upr"], col = "red", lty = "dotdash", lwd = 2)

par(cex.lab = 1.0, cex.axis = 1.0, cex.main = 1.2)



## ---- PI large ---------------------------------------------------------------
require(car)
par(cex.lab = 1.3, cex.axis = 1.3, cex.main = 1.5)

# scatter plot
plot(heightsm, pch = 19, xlab = "Mheight [m]", ylab = "Dheight [m]",
     main = "Prediction Bands", col = rgb(0, 0, 1, 0.2), xlim = c(1.50, 1.80), ylim = c(1.50, 1.83))

# regression line with regLine (car)
regLine(lin_mod, col = "red", lwd = 2)

# confidence interval for expectation
raster_h <- seq(from = min(heightsm[, "Mheight"]), to = max(heightsm[, "Mheight"]), by = 0.01)
df_new <- data.frame(Mheight = raster_h)
ci <- predict(object = lin_mod, newdata = df_new, interval = "confidence")
pr <- predict(object = lin_mod, newdata = df_new, interval = "prediction")

# lower and upper bound for CI
lines(x = raster_h, y = ci[, "lwr"], col = "red", lty = "dashed", lwd = 2)
lines(x = raster_h, y = ci[, "upr"], col = "red", lty = "dashed", lwd = 2)
lines(x = raster_h, y = pi[, "lwr"], col = "red", lty = "dotdash", lwd = 2)
lines(x = raster_h, y = pi[, "upr"], col = "red", lty = "dotdash", lwd = 2)

ci_single <- predict(lin_mod, data.frame(Mheight = 1.68), interval = "confidence")
pi_single <- predict(lin_mod, data.frame(Mheight = 1.68), interval = "prediction")

Arrows(x0 = 1.68, x1 = 1.68, y0 = -5,
       y1 = pi_single[1, "lwr"],
       col = "grey40", lwd = 2, code = 2, arr.adj = 1)
Arrows(x0 = 1.68, x1 = 1.49, y0 = pi_single[1, "lwr"],
       y1 = pi_single[1, "lwr"], col = "grey40", lwd = 2, code = 2, arr.adj = 1)

Arrows(x0 = 1.68, x1 = 1.68, y0 = pi_single[1, "lwr"],
       y1 = pi_single[1, "upr"],
       col = "grey40", lwd = 2, code = 2, arr.adj = 1)
Arrows(x0 = 1.68, x1 = 1.49, y0 = pi_single[1, "upr"],
       y1 = pi_single[1, "upr"], col = "grey40", lwd = 2, code = 2, arr.adj = 1)

par(cex.lab = 1.0, cex.axis = 1.0, cex.main = 1.2)



## ---- extract_R2 and R2 adjusted ---------------------------------------------
summary(lm_heights)$r.squared
summary(lm_heights)$adj.r.squared
