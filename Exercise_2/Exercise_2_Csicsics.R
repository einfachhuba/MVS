## Exrecise 2 ##

## Task 1 ##
# Task 1.1 #
homeprices <- read.csv("Exercise_2\\homeprices.csv", header = TRUE, sep = ";", dec = ".")
head(homeprices)
dim(homeprices)
class(homeprices)
sum(is.na(homeprices))
lapply(homeprices, class)

# install libraries
install.packages("measurements")
install.packages("car")
library(measurements)
library(car)

# Task 1.2 #
# convert square feet to square meters
homeprices$Living_area <- conv_unit(homeprices$Living_area, "ft2", "m2")
homeprices$Lot_size <- conv_unit(homeprices$Lot_size, "ft2", "m2")

head(homeprices)

# Task 1.3 #
# create a simple linear regression model
house_price_model <- lm(Sale_price ~ Living_area, data = homeprices)

# plot the data
plot(homeprices$Living_area, homeprices$Sale_price,
    xlab = "Living area (m2)", ylab = "Sale price (USD)",
    main = "House prices in NY",
    xlim = c(75, 350),
    ylim = c(100000, 600000),
    pch = 19,
    col = "blue")

# add the regression line to the plot
abline(house_price_model, col = "red")

# print the summary for the following questions
summary(house_price_model)

# QUESTIONS:
## Do you consider the relationship as linear?
#### No it should be an exponential relationship.

## Do you consider the relationship as strong/medium/weak (is there a number which can tell you this)?
#### Very waek with this model. The R-Squared is below 0.3, which also indicates that there is no or low relation with this model.

## Is the living area a useful predictor in this model? Is there also a number in the summary() output which can help you here?
#### No, the living area is not a useful predictor in this model. The p-value is 0.99, which is way above 0.05.
#### This means that the null hypothesis is true, which means that the living area is not a useful predictor in this model.

# Task 1.4 #
# regression equation predicting the house prices with the living area
house_price_model$coefficients
cat("The estimated regression equation is: y = ", house_price_model$coefficients[1], " + ", house_price_model$coefficients[2], " * x\n")
cat("A house with 10 m2 more would cost around ", house_price_model$coefficients[2] * 10, " USD more.\n")

# Task 1.5 #
# copy the houseprices data frame and remove the two highest living area values
homeprices2 <- homeprices[homeprices$Living_area < 260, ]

# create a new model with the new data frame
house_price_model_filtered <- lm(Sale_price ~ Living_area, data = homeprices2)

# plot the data
plot(homeprices$Living_area, homeprices$Sale_price,
    xlab = "Living area (m2)", ylab = "Sale price (USD)",
    main = "House prices in NY",
    xlim = c(75, 300),
    ylim = c(100000, 600000),
    pch = 19,
    col = "black")

# add the regression line to the plot
abline(house_price_model_filtered, col = "red")
abline(house_price_model, col = "pink")

# print the summary for the following questions
summary(house_price_model_filtered)

# QUESTION:
## Is there much difference between the two models?
#### No, the R-Squared is still around 0.3, which means that there is still no or low relation with this model.

# Task 1.6 #
# Create a confidence band for the regression line
plot(homeprices2$Living_area, homeprices2$Sale_price,
    xlab = "Living area (m2)", ylab = "Sale price (USD)",
    main = "House prices in NY",
    xlim = c(75, 350),
    ylim = c(100000, 600000),
    pch = 19,
    col = "black")

regLine(house_price_model_filtered, col = "red", lwd = 2)

raster_h <- seq(from = round(min(homeprices2[, "Living_area"]), 0), to = round(max(homeprices2[, "Living_area"]),0), by = 1)
df_new <- data.frame(Living_area = raster_h)
ci <- predict(object = house_price_model_filtered, newdata = df_new, interval = "confidence", level = 0.95)

lines(x = raster_h, y = ci[, "lwr"], col = "red", lty = "dashed", lwd = 2)
lines(x = raster_h, y = ci[, "upr"], col = "red", lty = "dashed", lwd = 2)

# QUESTION:
## For a house with 175 m2, what is the estimated average price and the corresponding confidence interval?
cat("The estimated average price for a house with 175 m2 is ", ci[88], " USD.\n")
cat("The corresponding confidence interval is ", ci[88, "lwr"], " - ", ci[88, "upr"], " USD.\n")
## 88 because 175 is the 88th value in the raster_h vector

# Task 1.7 #
plot(homeprices2$Living_area, homeprices2$Sale_price,
    xlab = "Living area (m2)", ylab = "Sale price (USD)",
    main = "House prices in NY",
    xlim = c(75, 350),
    ylim = c(100000, 600000),
    pch = 19,
    col = "black")

regLine(house_price_model_filtered, col = "red", lwd = 2)

ci <- predict(object = house_price_model_filtered, newdata = data.frame(Living_area = 175), interval = "prediction", level = 0.90)

# QUESTION:
## In which interval would you estimate its price with a probability of 90 %?
cat("The estimated price for a house with 175 m2 is ", ci[1], " USD.\n")
cat("The corresponding confidence interval is ", ci[2], " - ", ci[3], " USD.\n")

# Task 1.8 #
# Calculate r_squared and rmse for the model
r_squared <- summary(house_price_model_filtered)$r.squared
cat("The R-Squared is ", r_squared, ".\n")

rmse <- sqrt(mean((homeprices2$Sale_price - predict(house_price_model_filtered))^2))
cat("The RMSE is ", rmse, ".\n")

# QUESTION:
## What is the interpretation of e.g. the RMSE value and what units does it have?
#### The RMSE is the standard deviation of the residuals. It is a measure of the average
#### distance between the observed values and the predicted values.

## Task 2 ##
# Task 2.1 #
# new lm model with all variables
house_price_model_all <- lm(Sale_price ~ ., data = homeprices)

# compare house_price_model_all with house_price_model
summary(house_price_model)

summary(house_price_model_all)

# QUESTION:
## Is there much improvement of this model?
#### Yes, the R-Squared is now around 0.5, which means that there is a relation with this model, but still not that strong.

# Task 2.2 #

# QUESTION:
## What is the interpretation of the estimated regression coefficient of the living area and the Bathrooms variable?
#### The estimated regression coefficient of the living area is 709. This means that the price of a house increases 
#### by 709 USD for every additional square meter of living area. The estimated regression coefficient of the bathrooms
#### is 51700. This means that the price of a house increases by 51700 USD for every additional bathroom.

## What about the estimated regression coefficient of the Bedrooms predictor and its sign?
#### The estimated regression coefficient of the bedrooms is - 12290. This means that the price of a house decreases
#### by 12290 USD for every additional bedroom, which is not logical.

## Does the estimated intercept have a meaning in this example?
#### No, because the intercept is very high and negative, which would mean a negative price for a house with 0 bedrooms,
#### 0 bathrooms, 0 living area, etc.

# Task 2.3 #
install.packages("leaps")
library(leaps)

# calculate all possible models
all_models <- regsubsets(Sale_price ~ ., data = homeprices, nvmax = 6)

# Summary of all possible models
summary(all_models)

testmodel <- lm(Sale_price ~ Living_area + Bathrooms, data = homeprices)
summary(testmodel)

# QUESTION:
## Which model would you choose and why?
#### I would choose the model with 2 variables (Living_area and Bathrooms), because the R-Squared isn't changing
#### much anymore and the p-values are all below 0.05.

# Task 2.4 #
# Instead of an exhaustive search among all possible models, we could also use a forward or backward variable selection
# by changing the method argument in the regsubsets() function.

new_models_fw <- regsubsets(Sale_price ~ ., data = homeprices, nvmax = 6, method = "forward")
summary(new_models_fw)

new_models_bw <- regsubsets(Sale_price ~ ., data = homeprices, nvmax = 6, method = "backward")
summary(new_models_bw)

# QUESTION:
## Do you get different optimal regression models for these search strategies?
#### No, the optimal regression model is still the one with 2 variables (Living_area and Bathrooms).


## Task 3 ##
# Task 3.1 #
diesel_prop <- read.table("Exercise_2\\diesel_prop.csv", header = TRUE, skip = 8, sep = ",", na.strings = "NaN")
diesel_spec <- read.table("Exercise_2\\diesel_spec.csv", header = TRUE, skip = 9, sep = ",", na.strings = "NaN")

head(diesel_prop)
head(diesel_spec)

# Task 3.2 #
# data cleaning
diesel_prop <- diesel_prop[,  -which(names(diesel_prop) %in% c("Label","X", "X.1"))]
dim(diesel_prop)
colnames(diesel_prop)

diesel_spec <- diesel_spec[,  -which(names(diesel_spec) %in% c("Axisscale","X", "X.1"))]
dim(diesel_spec)

# Task 3.3 #
diesel_pred <- data.frame(diesel_prop$FREEZE, diesel_spec)
diesel_pred <- na.omit(diesel_pred)
head(diesel_pred)
dim(diesel_pred)
colnames(diesel_pred)

# Task 3.4 #
# plot variables
plot(diesel_pred$X750, diesel_pred$diesel_prop.FREEZE,
    xlab = "X Numbers", ylab = "FREEZE",
    main = "FREEZE vs. X's",
    xlim = c(0, 1),
    pch = 19,
    col = "black")

points(diesel_pred$X814, diesel_pred$diesel_prop.FREEZE, col = "red")
points(diesel_pred$X916, diesel_pred$diesel_prop.FREEZE, col = "blue")
points(diesel_pred$X1038, diesel_pred$diesel_prop.FREEZE, col = "green")
points(diesel_pred$X1550, diesel_pred$diesel_prop.FREEZE, col = "purple")

# Task 3.5 #
# split the data into a training and test set
set.seed(555)
n <- nrow(diesel_pred)
training_rows <- sort(sample(x = 1:n, size = floor(0.75 * n)))
test_rows <- (1:n)[!((1:n) %in% training_rows)]

# training and test data
df_dieseltrain <- diesel_pred[training_rows, ]
df_dieseltest <- diesel_pred[test_rows, ]

# Task 3.6 #
# pcr model
library(pls)
pcr_model <- pcr(df_dieseltrain$diesel_prop.FREEZE ~ ., data = df_dieseltrain, ncomp = 25, validation = "CV")

summary(pcr_model)
# We choose the Model with 14 components

df_dieselpreds_test <- predict(pcr_model, newdata = df_dieseltest, ncomp = 14)
(rmse_pcr <- sqrt(mean((df_dieseltest$diesel_prop.FREEZE - df_dieselpreds_test)^2)))

# pls model
pls_model <- plsr(df_dieseltrain$diesel_prop.FREEZE ~ ., data = df_dieseltrain, ncomp = 25, validation = "CV")

summary(pls_model)
# We choose the Model with 10 components

df_dieselpreds_test <- predict(pls_model, newdata = df_dieseltest, ncomp = 10)
(rmse_pls <- sqrt(mean((df_dieseltest$diesel_prop.FREEZE - df_dieselpreds_test)^2)))

# QUESTION:
## Which model performs better?
cat("The RMSE of the PCR model is ", rmse_pcr, ".\n")
cat("The RMSE of the PLS model is ", rmse_pls, ".\n")
#### The PLS model performs better, because the RMSE is lower than the RMSE of the PCR model and it has lower amount of components.

plot(df_dieselpreds_test, df_dieseltest$diesel_prop.FREEZE,
    xlab = "Measured FREEZE", ylab = "Predicted FREEZE",
    main = "Measured vs. Predicted FREEZE",
    pch = 19,
    col = "black")

points(df_dieseltest$diesel_prop.FREEZE, df_dieseltest$diesel_prop.FREEZE, col = "red")

# predplot did not work:
# predplot(pls_model, ncomp = 10, which = "test", newdata = df_dieseltest, pch = 19)
# Error in model.frame.default(formula(object), data = newdata) : 
#   variable lengths differ (found for 'X750')