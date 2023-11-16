## ---- load the knitr package -------------------------------------------------
library(knitr)

# change to your needs
setwd(dir = "C:\FH\Semester5\DAT")



## ---- look at PISA data ------------------------------------------------------
# CHANGE: load the data set
load("../../Handl_Daten/PISA_Final.RData")

# look at some data
head(PISA)



## ---- Dimensions of PISA data set --------------------------------------------
# number of rows - number of columns
dim(PISA)

# alternative: 
nrow(PISA)
ncol(PISA)



## ---- Rows and Columns of PISA data set --------------------------------------
# Austria's data; alternative: PISA["A", ] 
PISA[14, ]

# get the rownames
rownames(PISA)
rownames(PISA)[14]

# mathematics data, alternative: PISA[, "Mathematik"]
PISA[, 1]

# get the column names
colnames(PISA)

# class of the object - it is a matrix
class(PISA)



## ---- Datensatz Koerpermasze -------------------------------------------------
# CHANGE: read data; n = 21 observations on p = 3 variables
koerpergroesze <- read.table("../../Handl_Daten/Koerpergroesze.csv", header = TRUE, sep = ";", stringsAsFactors = FALSE)

# Dimension and some data
dim(koerpergroesze)
head(koerpergroesze, n = 8)



## ---- mean_vector ------------------------------------------------------------
# mean vector for PISA data - apply() also possible
colMeans(PISA)


## ---- sd_vector --------------------------------------------------------------
# vector of standard deviations/variances for PISA data
apply(PISA, 2, var)


## ---- Covariance Matrix ------------------------------------------------------
# variance/covariance matrix for PISA data
cov(PISA)


## ---- Correlation Matrix -----------------------------------------------------
# correlation matrix (also Spearman or Kendall correlation)
cor(PISA)


## ---- Normal Distribution ----------------------------------------------------
par(mfrow = c(1, 1), cex.axis = 1.2, cex.lab = 1.2, cex.main = 1.4)
# data
x_plot <- seq(from = -5, to = +15, by = 0.01)
y_plot1 <- dnorm(x_plot, mean = 4, sd = 2)
# density
plot(x = x_plot, y = y_plot1, type = "l", xlab = "x", ylab = "Density f(x)",
     lwd = 2, main = "Standard Normal Density")
abline(v = 4, lty = "dashed", col = "red")
text(x = 5, y = 0.05, labels = expression(mu), col = "red", cex = 2)
par(mfrow = c(1, 1), cex.axis = 1.0, cex.lab = 1.0, cex.main = 1.2)



## ---- Multivariate Normal Distribution ---------------------------------------
# load packages (must be installed first)
require(mvtnorm)
require(plot3D)

# creat x1, x2, z data
x1 <- x2 <- seq(from = -3.0, to = +3.0, by = 0.1)
quants <- expand.grid(x1, x2)
dens <- matrix(dmvnorm(quants), nrow = length(x1))
rownames(dens) <- colnames(dens) <- x1

# 3D perspective plot 
par(mar = c(0,2,0,2))
persp3D(x = x1, y = x2, z = dens, phi = 30, theta = 30, border = NA, 
        xlab = "x1", ylab = "x2", cex.lab = 1.4, zlab = "Density f(x1,x2)", 
        resfac = 0.9, colkey = FALSE)
par(mar = c(5,4,4,2) + 0.1)


## ---- Bivariate Data - outlier ? ---------------------------------------------
par(cex.main = 1.5, cex.lab = 1.3, cex.axis = 1.3)
# load packages
require(mvtnorm)
require(Matrix)

# define bivariate mean and Cov Matrix
mu <- c(3, 4)
S <- as.matrix(nearPD(matrix(c(3, 2, 2, 3), nrow = 2))$mat)
set.seed(1234)
dat <- rmvnorm(n = 50, mean = mu, sigma = S)
plot(dat, xlim = c(-2, 8), ylim = c(-3, 10), xlab = expression(x[1]), 
     ylab = expression(x[2]), pch = 19)
abline(h = 0, col = "grey"); abline(v = 0, col = "grey")
out <- c(0.5, 6)
points(x = out[1], y = out[2], col = "red", pch = 19)
par(cex.main = 1.2, cex.lab = 1.0, cex.axis = 1.0)


## ---- outlier ----------------------------------------------------------------
# some of the data
head(dat)

# the red point
out


## ---- R_norm -----------------------------------------------------------------
pnorm(q = 0.5, mean = 3, sd = sqrt(3))
1 - pnorm(q = 6, mean = 4, sd = sqrt(3))


## ---- Confidence Ellipse -----------------------------------------------------
# load package
require(mixtools)
par(cex.main = 1.4, cex.lab = 1.2, cex.axis = 1.2)

# define bivariate mean and Cov Matrix
plot(dat, xlim = c(-2, 8), ylim = c(-3, 10), xlab = expression(x[1]), ylab = expression(x[2]), pch = 19)
abline(h = 0, col = "grey"); abline(v = 0, col = "grey")
out <- c(0.5, 6)
points(x = out[1], y = out[2], col = "red", pch = 19)

# add confidence ellipse
ellipse(mu = c(3, 4), sigma = S, alpha = 0.01, col = "blue", lwd = 2)
ellipse(mu = c(3, 4), sigma = S, alpha = 0.05, col = "darkgreen", lwd = 2)
ellipse(mu = c(3, 4), sigma = S, alpha = 0.1, col = "violet", lwd = 2)

text(x = -1.3, y = 9.5, labels = "90 %", col = "violet", cex = 1.2)
text(x = -1.3, y = 8.6, labels = "95 %", col = "darkgreen", cex = 1.2)
text(x = -1.3, y = 7.7, labels = "99 %", col = "blue", cex = 1.2)
text(x = 1.2, y = 8.6, labels = "confidence ellipse", cex = 1.2)

par(cex.main = 1.2, cex.lab = 1.0, cex.axis = 1.0)




## ---- install a local package ------------------------------------------------
# check if package is installed
dd <- library(package = "ElemStatLearn", logical.return = TRUE)
if (!dd) {
  install.packages("ElemStatLearn_2015.6.26.2.tar.gz", repos = NULL)
} else {
  library(ElemStatLearn)
}


## ---- Example digit recognition ----------------------------------------------
# first change ziptoimage function
zti <- function(zip, line) {
  im <- zip[line, ]
  im <- im[-1]
  im <- t(matrix(im, 16, 16, byrow = TRUE))
  im <- im[, 16:1]
  return(im)
}

# load package and data
require(ElemStatLearn)
data(zip.train)

par(mar = c(4,4,4,4))
im <- zti(zip = zip.train, line = 1)
image(x = 1:16, y = 1:16, z = im, col = gray(256:0 / 256), 
      xlab = "", ylab = "", xaxt = "n", yaxt = "n", bty = "n")
start_delta <- 0.5
delta <- 1
for (i in 0:16) {
  segments(x0 = start_delta + i * delta, x1 = start_delta + i * delta, y0 = 0, y1 = 16.5, col = "grey")
  segments(y0 = start_delta + i * delta, y1 = start_delta + i * delta, x0 = 0, x1 = 16.5, col = "grey")
}
mtext(side = 3, at = 1, line = 0, text = expression(x[1]), cex = 1.5)
mtext(side = 3, at = 2, line = 0, text = expression(x[2]), cex = 1.5)
mtext(side = 3, at = 16, line = 0, text = expression(x[16]), cex = 1.5)
mtext(side = 1, at = 15, line = 0.4, text = expression(x[255]), cex = 1.5)
mtext(side = 4, at = 1, line = 0.4, text = expression(x[256]), cex = 1.5, las = 1)
par(mar = c(5,4,4,2) + 0.1)



## ---- digit example2 ---------------------------------------------------------
# package must be installed first
require(ElemStatLearn)
data(zip.train)

# structure of data
class(zip.train)
dim(zip.train)


## ---- digit example 3---------------------------------------------------------
# e.g. let's have a look at the 18th case
zip.train[18, 1:15]


## ----example_digits4, echo = TRUE, warning = FALSE, fig.heigth = 6.5, fig.width = 6.5, out.width = ".330\\linewidth", fig.align = "center", fig.show = "hold", print = FALSE----
# plot the previous sign
image(zip2image(zip = zip.train, line = 18), col = gray((256:0)/256), 
      xlab = "", ylab = "", xaxt = "n", yaxt = "n", bty = "n")



## ---- digits - Random Forest -------------------------------------------------
# first we load the package(s) and data
require(ElemStatLearn)
data(zip.train)

# package for Random Forest model
require(ranger)


## ---- digits - Random Forest 2 -----------------------------------------------
# correct naming of predictors and response
colnames(zip.train) <- c("y", paste("x_", 1:256, sep = ""))
zip.train <- as.data.frame(zip.train)
zip.train[, "y"] <- as.factor(zip.train[, "y"])


## ---- digits - Random Forest 3 -----------------------------------------------
# random forest classification model
rf_model <- ranger(y ~ ., data = zip.train, seed = 123, num.trees = 1000)


# make predictions with the random forest model
preds_training <- predict(rf_model, data = zip.train)


# compare predictions with the truth
head(cbind(observed = zip.train[, "y"], 
           predicted = preds_training$predictions), n = 10)


# make a confusion matrix
table(true_class = zip.train[, "y"], 
      predicted_class = preds_training$predictions)



## ---- digits RF --------------------------------------------------------------
# load data; very large test set
data(zip.test)
dim(zip.test)
zip.test.orig <- zip.test


# prepare in the same way as training set
colnames(zip.test) <- c("y", paste("x_", 1:256, sep = ""))
zip.test <- as.data.frame(zip.test)
zip.test[, "y"] <- as.factor(zip.test[, "y"])

# apply model to test set
preds_test <- predict(rf_model, data = zip.test)


# confusion matrix for test set
(cm_test <- table(true_class = zip.test[, "y"], 
                  predicted_class = preds_test$predictions))


# misclassification rate in percent
100 * (1 - sum(diag(cm_test)) / sum(cm_test))


# for which cases prediction != real class?
ind <- which(preds_test$predictions != zip.test[, "y"])

zp_wrong <- zip.test.orig[ind, ]

par(mfrow = c(1, 3))
image(zip2image(zp_wrong, 5), col=gray(256:0/256), zlim = c(0, 1), xlab = "", ylab = "")
image(zip2image(zp_wrong, 15), col=gray(256:0/256), zlim = c(0, 1), xlab = "", ylab = "")
image(zip2image(zp_wrong, 25), col=gray(256:0/256), zlim = c(0, 1), xlab = "", ylab = "")
par(mfrow = c(1, 1))


# prediction of each tree
preds_all <- predict(rf_model, data = zip.test, predict.all = TRUE)

# wrong predictions
ind <- which(preds_test$predictions != zip.test[, "y"])
zp_wrong <- zip.test.orig[ind, ]

par(mfrow = c(2, 3), mar = c(5,4,2,1))
image(zti(zp_wrong, 5), col = gray(256:0/256), zlim = c(0, 1), xlab = "", ylab = "")
image(zti(zp_wrong, 15), col = gray(256:0/256), zlim = c(0, 1), xlab = "", ylab = "")
image(zti(zp_wrong, 25), col = gray(256:0/256), zlim = c(0, 1), xlab = "", ylab = "")
names_arg <- as.numeric(names(table(preds_all$predictions[ind[c(5)], ]))) - 1
barplot(table(preds_all$predictions[ind[c(5)], ]), names.arg = names_arg, cex.names = 1.7)
barplot(table(preds_all$predictions[ind[c(15)], ]), names.arg = names_arg, cex.names = 1.7)
barplot(table(preds_all$predictions[ind[c(25)], ]), names.arg = names_arg, cex.names = 1.7)
par(mfrow = c(1, 1), mar = c(5,4,4,2) + 0.1)


# correct predictions
ind_correct <- which(preds_test$predictions == zip.test[, "y"])
zp_correct <- zip.test.orig[ind_correct, ]

par(mfrow = c(2, 3), mar = c(5,4,2,1))
image(zti(zp_correct, 5), col = gray(256:0/256), zlim = c(0, 1), xlab = "", ylab = "")
image(zti(zp_correct, 15), col = gray(256:0/256), zlim = c(0, 1), xlab = "", ylab = "")
image(zti(zp_correct, 26), col = gray(256:0/256), zlim = c(0, 1), xlab = "", ylab = "")

names_arg <- as.numeric(names(table(preds_all$predictions[ind_correct[5], ]))) - 1
barplot(table(preds_all$predictions[ind_correct[5], ]), names.arg = names_arg, cex.names = 1.7)
barplot(table(preds_all$predictions[ind_correct[15], ]), names.arg = names_arg, cex.names = 1.7)
barplot(table(preds_all$predictions[ind_correct[26], ]), names.arg = names_arg, cex.names = 1.7)
par(mfrow = c(1, 1), mar = c(5,4,4,2) + 0.1)



## ---- Example FTIR Spectra ---------------------------------------------------
require(pls)
y_vec <- gasoline$NIR[1, ]
x_vec <- seq(from = 900, to = 1700, by = 2)
plot(x_vec, y_vec, type = "l", xlab = "Wavelength [nm]", ylab = "Intensity",
     cex.axis = 1.3, cex.lab = 1.3, cex.main = 1.5, main = "Infrared Spectrum", lwd = 2)


## ---- plot all spectra -------------------------------------------------------

# plot all the spectra

par(cex.main = 1.5, cex.axis = 1.3, cex.lab = 1.3)
matplot(x = seq(900, 1700, by = 2), y = t(gasoline$NIR), type = "l",
        xlab = "Wavelength [nm]", ylab = "Intensity 1/R",
        main = "Octane Number ~ IR Spectra")
par(cex.main = 1.2, cex.axis = 1.0, cex.lab = 1.0)



## ---- data_split into training and test data set -----------------------------
set.seed(123)

# rownumbers of cases to go into training set, remainder in test set
(rn_training <- sort(sample(x = 1:60, size = 45, replace = FALSE)))
(rn_test <- (1:60)[!(1:60 %in% rn_training)])


## ---- build a PLS model ------------------------------------------------------
# build model on the training set
pls_gasoline_model <- plsr(octane ~ ., data = gasoline[rn_training, ], 
                           scale = TRUE, validation = "LOO", ncomp = 8)


## ---- Vorhersage des Test Sets -----------------------------------------------
# get predictions for test set (which is of size 15)
preds_test <- predict(pls_gasoline_model, newdata = gasoline[rn_test, ], 
                      ncomp = 5)


# plot measured (x-axis) versus predicted (y-axis)
par(cex.main = 1.6, cex.lab = 1.3, cex.axis = 1.3)
plot(x = gasoline$octane[rn_test], y = preds_test,
     pch = 19, col = "blue", xlim = c(83, 90), ylim = c(83, 90),
     xlab = "Measured Octane", ylab = "Predicted Octane", 
     main = "Predicted versus Measured Octane")

# plot 45 degree line
abline(a = 0, b = 1, col = "red")
par(cex.main = 1.6, cex.lab = 1.3, cex.axis = 1.3)


## ---- RMSE of octane model ---------------------------------------------------
# MSE
(mse <- mean((gasoline$octane[rn_test] - preds_test)^2))

# RMSE
sqrt(mse)



## ---- unsupervised learning --------------------------------------------------
# load package (must be installed first)
require(HSAUR2)

# first rows
data(pottery, package = "HSAUR2")
head(pottery)


