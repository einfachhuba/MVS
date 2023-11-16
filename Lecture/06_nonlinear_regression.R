## ---- working directory ------------------------------------------------------

# must be changed
setwd(dir = "C:\FH\Semester5\DAT")


## ---- load the fish data and plot --------------------------------------------

# load the rda file
load("M.merluccius.rda")

# plot
par(cex.main = 1.5, cex.lab = 1.3, cex.axis = 1.3)
plot(y = M.merluccius$num.fish, x = M.merluccius$spawn.biomass, pch = 19,
     xlab = "Spawning Biomass (1000 tonnes)", ylab = "Recruitment (million fish)", main = "Fish Biomass")
par(cex.main = 1.2, cex.lab = 1.0, cex.axis = 1.0)


## ---- nls1 -------------------------------------------------------------------

# define the function
f <- function(x, alpha, k) {
  result <- (alpha * x) / (1 + x / k)
  return(result)
}

# nonlinear model fit by least squares
(nls_result <- nls(num.fish ~ f(spawn.biomass, alpha, k), data = M.merluccius,
                   start = list(alpha = 6, k = 20),
                   control = nls.control(minFactor = 10^(-4), maxiter = 500, warnOnly = TRUE)))



## ---- plot the fish data with estimate ---------------------------------------

# plot the estimated function
par(cex.main = 1.5, cex.lab = 1.3, cex.axis = 1.3)
plot(y = M.merluccius$num.fish, x = M.merluccius$spawn.biomass, pch = 19,
     xlab = "Spawning Biomass (1000 tonnes)", ylab = "Recruitment (million fish)", main = "Fish Biomass")
curve(f(x, alpha = 5.751, k = 33.157), add = TRUE, from = 0, to = 70, col = "red", lwd = 2)
par(cex.main = 1.2, cex.lab = 1.0, cex.axis = 1.0)



## ---- summary nls ------------------------------------------------------------
summary(nls_result)

# prediction for e.g. biomass value of 30
predict(nls_result, newdata = data.frame(spawn.biomass = 30))

# confidence interval for parameters
confint(nls_result)
