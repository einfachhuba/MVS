# load package
require(pls)
# plot all the spectra
matplot(x = seq(900, 1700, by = 2), y = t(gasoline$NIR), type = "l",
        xlab = "Wavelength [nm]", ylab = "Intensity 1/R",
        main = "Octane Number ~ IR Spectra")

# split our data set in approx 75 % training and 25 % test set
set.seed(55)

# rownumbers of cases to go into training set, remainder in test set
(rn_training <- sort(sample(x = 1:60, size = 45, replace = FALSE)))

(rn_test <- (1:60)[!(1:60 %in% rn_training)])

# build model on the training set
pls_gasoline_model <- plsr(octane ~ ., data = gasoline[rn_training, ],
                           scale = TRUE, validation = "LOO", ncomp = 8)

# get predictions for test set (which is of size 15)
preds_test <- predict(pls_gasoline_model, newdata = gasoline[rn_test, ],
                      ncomp = 5)

# plot measured (x-axis) versus predicted (y-axis)
plot(x = gasoline$octane[rn_test], y = preds_test,
     pch = 19, col = "blue", xlim = c(83, 90), ylim = c(83, 90),
     xlab = "Measured Octane", ylab = "Predicted Octane",
     main = "Predicted versus Measured Octane")
# plot 45 degree line
abline(a = 0, b = 1, col = "red")

# MSE
(mse <- mean((gasoline$octane[rn_test] - preds_test)^2))

# RMSE
sqrt(mse)
