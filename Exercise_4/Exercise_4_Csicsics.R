#   Exercise 4      #
#   14.01.2024      #
#   Huba Csicsics   #

###############################################################################
## Ames Housing Data
###############################################################################

# install.packages("modeldata")
require(modeldata)
help(ames)

# load the data
data(ames)

#print colnames
str(ames)
dim(ames)

#check for missing values
sum(is.na(ames))

# looking at the DataDocumentation http://jse.amstat.org/v19n3/decock/DataDocumentation.txt
# string: Factor; is correct
# int: Integer; is correct
# num: Numeric; missused

ames[, sapply(ames, is.numeric) & !names(ames) %in% c("Longitude", "Latitude")] <- lapply(ames[, sapply(ames, is.numeric) & !names(ames) %in% c("Longitude", "Latitude")], as.integer)

###############################################################################
## MODELS
###############################################################################

# install.packages("caret")
require(caret)

# cleansing the dataset
# drop any rows that gr liv area is greater than 4000 (outlier and recommended by the author)
ames_cleaned <- ames[ames$Gr_Liv_Area < 4000, ]

# drop columns Latitude and Longitude
ames_cleaned <- ames_cleaned[, !names(ames_cleaned) %in% c("Longitude", "Latitude")]

# Centering and Scaling
transformation <- preProcess(ames_cleaned, method = c("center", "scale"))
preprocessed_ames <- predict(transformation, ames_cleaned)
# Check for conclusion at the End

# split the data into training and test set
set.seed(55)
train_index <- sample(x=1:nrow(ames_cleaned), size = floor(0.75*nrow(ames_cleaned)))
train_data <- ames_cleaned[train_index, ]
test_data <- ames_cleaned[-train_index, ]

# calcualte the mean of the Sale_Price
mean_sp <- mean(test_data$Sale_Price)

#calculate rmse with the mean_sp (RMSE to beat by model)
(rmse_mean <- sqrt(mean((test_data$Sale_Price - mean_sp)^2)))

###############################################################################
## 1. Model: Linear Regression
###############################################################################

ctrl <- trainControl(method = "repeatedcv", number = 10, repeats = 3)
lm_grid <- expand.grid(intercept = c(TRUE, FALSE))

# using all predictors to predict the Sale_Price
set.seed(55)
lm_ap_sp <- train(Sale_Price ~ ., data = train_data, method = "lm", trControl = ctrl, tuneGrid = lm_grid)
lm_ap_sp

# predict the Sale_Price
lm_ap_sp_pred <- predict(lm_ap_sp, test_data)

print(paste("RMSE Linear Regression: ", round(RMSE(lm_ap_sp_pred, test_data$Sale_Price), 2)))
print(paste("R2 Linear Regression: ", round(R2(lm_ap_sp_pred, test_data$Sale_Price), 4)))


###############################################################################
## 2. Model: Random Forest
###############################################################################

# the calculated mtry is around 8 that's why the rf_grid is set to 7:9
mytry <- floor(sqrt(ncol(train_data)))
rf_grid <- expand.grid(mtry = c(7:9))
rf_ctrl <- trainControl(method = "cv", number = 10)

set.seed(55)
rf_ap_sp <- train(Sale_Price ~ ., data = train_data, method = "rf", trControl = rf_ctrl, tuneGrid = rf_grid)
rf_ap_sp

# predict the Sale_Price
rf_ap_sp_pred <- predict(rf_ap_sp, test_data)

print(paste("RMSE Random Forest: ", round(RMSE(rf_ap_sp_pred, test_data$Sale_Price), 2)))
print(paste("R2 Random Forest: ", round(R2(rf_ap_sp_pred, test_data$Sale_Price), 4)))

###############################################################################
## 3. Model: PCR Regression
###############################################################################

pcr_grid <- expand.grid(ncomp = seq(210, 230, 5))

set.seed(55)
pcr_ap_sp <- train(Sale_Price ~ ., data = train_data, method = "pcr", trControl = ctrl, tuneGrid = pcr_grid)
pcr_ap_sp

# predict the Sale_Price
pcr_ap_sp_pred <- predict(pcr_ap_sp, test_data)

print(paste("RMSE PCR Regression: ", round(RMSE(pcr_ap_sp_pred, test_data$Sale_Price), 2)))
print(paste("R2 PCR Regression: ", round(R2(pcr_ap_sp_pred, test_data$Sale_Price), 4)))

###############################################################################
## 4. Model: Cubist Regression
###############################################################################

cubist_grid <- expand.grid(committees = seq(3, 5, 1), neighbors = seq(5, 7, 1))
cubist_ctrl <- trainControl(method = "cv", number = 10)

set.seed(55)
cubist_ap_sp <- train(Sale_Price ~ ., data = train_data, method = "cubist", trControl = cubist_ctrl, tuneGrid = cubist_grid)
cubist_ap_sp

# predict the Sale_Price
cubist_ap_sp_pred <- predict(cubist_ap_sp, test_data)

print(paste("RMSE Cubist Regression: ", round(RMSE(cubist_ap_sp_pred, test_data$Sale_Price), 2)))
print(paste("R2 Cubist Regression: ", round(R2(cubist_ap_sp_pred, test_data$Sale_Price), 4)))

###############################################################################
## 5. Model: Least Angle Regression
###############################################################################

set.seed(55)
lars_grid <- expand.grid(fraction = seq(0.1, 1, 0.1))

lars_model <- train(Sale_Price ~ ., data = train_data, method = "lars", trControl = ctrl, tuneGrid = lars_grid)
lars_model

# predict the Sale_Price
lars_model_pred <- predict(lars_model, test_data)

print(paste("RMSE Least Angle Regression: ", round(RMSE(lars_model_pred, test_data$Sale_Price), 2)))
print(paste("R2 Least Angle Regression: ", round(R2(lars_model_pred, test_data$Sale_Price), 4)))

###############################################################################
## 6. Model: Non-Negative Least Squares Regression
###############################################################################

set.seed(55)
nnls_ap_sp <- train(Sale_Price ~ ., data = train_data, method = "nnls", trControl = ctrl)  
nnls_ap_sp

# predict the Sale_Price
nnls_ap_sp_pred <- predict(nnls_ap_sp, test_data)

print(paste("RMSE Non-Negative Least Squares Regression: ", round(RMSE(nnls_ap_sp_pred, test_data$Sale_Price), 2)))
print(paste("R2 Non-Negative Least Squares Regression: ", round(R2(nnls_ap_sp_pred, test_data$Sale_Price), 4)))

###############################################################################
## 7. Model: k-Nearest Neighbors Regression
###############################################################################

knn_grid <- expand.grid(k = seq(5, 15, 1))

set.seed(55)
knn_ap_sp <- train(Sale_Price ~ ., data = train_data, method = "knn", trControl = ctrl, tuneGrid = knn_grid)
knn_ap_sp

# predict the Sale_Price
knn_ap_sp_pred <- predict(knn_ap_sp, test_data)

print(paste("RMSE k-Nearest Neighbors Regression: ", round(RMSE(knn_ap_sp_pred, test_data$Sale_Price), 2)))
print(paste("R2 k-Nearest Neighbors Regression: ", round(R2(knn_ap_sp_pred, test_data$Sale_Price), 4)))


###############################################################################
## Conclusion
###############################################################################

# Meaning of the variables
# https://ww2.amstat.org/publications/jse/v19n3/decock/DataDocumentation.txt, documentation of the variables.
# It would take too long to copy paste everything.

# Excluding variables
# The variables Longitude and Latitude were excluded because they are not relevant for the price of the house.
# Furthermore, values above 4000 Gr_Liv_Area were excluded because they are outliers and it is also recommended to exclude by the author.
# (https://ww2.amstat.org/publications/jse/v19n3/decock/DataDocumentation.txt)

# Validation
# I choose the repeated cross validation method because it is a good method to validate the model.
# If the repeated cross validation took too long, then i choose the cross validation method.

# Centering and Scaling
# Centering and Scaling is a good method to improve the performance of the model, but not beneficial in our case.

# Models - Ranking (based on R2)

# 1. Cubist Regression
# Is it suitable for the data? Yes, because it is a regression model and the data is numerical.
# Is it working well? Yes, it working well.
print(paste("RMSE Cubist Regression: ", round(RMSE(cubist_ap_sp_pred, test_data$Sale_Price), 2)))
print(paste("R2 Cubist Regression: ", round(R2(cubist_ap_sp_pred, test_data$Sale_Price), 4)))

plot(cubist_ap_sp_pred, test_data$Sale_Price, main = "Cubist Regression", xlab = "Predicted", ylab = "Actual", col = "blue")
abline(0, 1, col = "red")

# 2. Least Angle Regression
# Is it suitable for the data? Yes, because it is a regression model and the data is numerical.
# Is it working well? Yes, it preforms well, but the Cubist Regression is better.
print(paste("RMSE Least Angle Regression: ", round(RMSE(lars_model_pred, test_data$Sale_Price), 2)))
print(paste("R2 Least Angle Regression: ", round(R2(lars_model_pred, test_data$Sale_Price), 4)))

plot(lars_model_pred, test_data$Sale_Price, main = "Least Angle Regression", xlab = "Predicted", ylab = "Actual", col = "blue")
abline(0, 1, col = "red")

# 3. PCR Regression
# Is it suitable for the data? Yes, because it is a regression model and the data is numerical.
# Is it working well? Yes, it preforms well, but it's only the third best choice.
print(paste("RMSE PCR Regression: ", round(RMSE(pcr_ap_sp_pred, test_data$Sale_Price), 2)))
print(paste("R2 PCR Regression: ", round(R2(pcr_ap_sp_pred, test_data$Sale_Price), 4)))

plot(pcr_ap_sp_pred, test_data$Sale_Price, main = "PCR Regression", xlab = "Predicted", ylab = "Actual", col = "blue")
abline(0, 1, col = "red")

# 4. Linear Regression
# Is it suitable for the data? Yes, because it is a regression model and the data is numerical.
# Is it working well? Yes, it preforms well, but it's only the fourth best choice.
print(paste("RMSE Linear Regression: ", round(RMSE(lm_ap_sp_pred, test_data$Sale_Price), 2)))
print(paste("R2 Linear Regression: ", round(R2(lm_ap_sp_pred, test_data$Sale_Price), 4)))

plot(lm_ap_sp_pred, test_data$Sale_Price, main = "Linear Regression", xlab = "Predicted", ylab = "Actual", col = "blue")
abline(0, 1, col = "red")

# 5. Random Forest
# Is it suitable for the data? Yes, because it is a regression model and the data is numerical.
# Is it working well? Yes, it preforms well, but it's only the fifth best choice.
print(paste("RMSE Random Forest: ", round(RMSE(rf_ap_sp_pred, test_data$Sale_Price), 2)))
print(paste("R2 Random Forest: ", round(R2(rf_ap_sp_pred, test_data$Sale_Price), 4)))

plot(rf_ap_sp_pred, test_data$Sale_Price, main = "Random Forest", xlab = "Predicted", ylab = "Actual", col = "blue")
abline(0, 1, col = "red")

# 6. Non-Negative Least Squares Regression
# Is it suitable for the data? Yes, because it is a regression model and the data is numerical.
# Is it working well? Yes, it preforms well, but it's only the sixth best choice.
print(paste("RMSE Non-Negative Least Squares Regression: ", round(RMSE(nnls_ap_sp_pred, test_data$Sale_Price), 2)))
print(paste("R2 Non-Negative Least Squares Regression: ", round(R2(nnls_ap_sp_pred, test_data$Sale_Price), 4)))

plot(nnls_ap_sp_pred, test_data$Sale_Price, main = "Non-Negative Least Squares Regression", xlab = "Predicted", ylab = "Actual", col = "blue")
abline(0, 1, col = "red")

# 7. k-Nearest Neighbors Regression
# Is it suitable for the data? Yes, because it is a regression model and the data is numerical.
# Is it working well? Yes, it preforms well, but it's only the seventh best choice.
print(paste("RMSE k-Nearest Neighbors Regression: ", round(RMSE(knn_ap_sp_pred, test_data$Sale_Price), 2)))
print(paste("R2 k-Nearest Neighbors Regression: ", round(R2(knn_ap_sp_pred, test_data$Sale_Price), 4)))

plot(knn_ap_sp_pred, test_data$Sale_Price, main = "k-Nearest Neighbors Regression", xlab = "Predicted", ylab = "Actual", col = "blue")
abline(0, 1, col = "red")


