require(ElemStatLearn)
data(zip.train)

class(zip.train)

dim(zip.train)

# e.g. let’s have a look at the 18th case
zip.train[18, 1:15]

image(zip2image(zip = zip.train, line = 18), col = gray((256:0)/256),
      xlab = "", ylab = "", xaxt = "n", yaxt = "n", bty = "n")


# package for Random Forest model
require(ranger)

# correct naming of predictors and response
colnames(zip.train) <- c("y", paste("x_", 1:256, sep = ""))
zip.train <- as.data.frame(zip.train)
zip.train[, "y"] <- as.factor(zip.train[, "y"])

# random forest classification model
# y ~ . -> y vorhersagen mit allen anderen Daten im zip.train (. ist alles)
rf_model <- ranger(y ~ ., data = zip.train, seed = 55, num.trees = 1000)

# make predictions with the random forest model
preds_training <- predict(rf_model, data = zip.train)

# compare predictions with the truth
head(cbind(observed = zip.train[, "y"],
           predicted = preds_training$predictions), n = 10)

# confusion matrix
table(true_class = zip.train[, "y"],
      predicted_class = preds_training$predictions)

data(zip.test)

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



