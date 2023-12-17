#   Exercise 3      #
#   29.11.2023      #
#   Huba Csicsics   #

###############################################################################
## Task 1
###############################################################################

### Task 1.1

getwd()
setwd("C:\\FH\\Semester5\\MVS")

red_wines <- read.table("Exercise_3\\red_wines.csv", header = TRUE, sep = ";", dec = ".")
white_wines <- read.table("Exercise_3\\white_wines.csv", header = TRUE, sep = ";", dec = ".")

dim(red_wines)
dim(white_wines)

### Task 1.2 & 1.3
# combine the two data frames into one data frame
wines <- rbind(red_wines, white_wines)
wines$type <- c(rep("red", nrow(red_wines)), rep("white", nrow(white_wines)))
wines$type <- as.factor(wines$type)

dim(wines)

# wine amount by type
table(wines$type)

### Task 1.4
# spliting into training and test data with approximately same ratio of red and white wines
set.seed(55)
train <- wines[sample(nrow(wines), 0.75 * nrow(wines)), ]
test <- wines[!(rownames(wines) %in% rownames(train)), ]

table(train$type)
table(test$type)

### Task 1.5
# classification tree with all variables except quality
# install.packages("rpart")
library(rpart)

set.seed(55)
wines_tree <- rpart(type ~ . - quality, data = train, method = "class", control = rpart.control(minsplit = 2, cp = 0.0001, minbucket = 1))
# cp = complexity parameter, the smaller the more complex the tree,
# that's why I set it to 0.0001, because else I would get the same model
# in the next task

# cptable of the model
wines_tree$cptable

(opt_cp <- wines_tree$cptable[which.min(wines_tree$cptable[, "xerror"]), "CP"])

### Task 1.6
# prediction on test data
set.seed(55)
wines_tree_pred <- predict(wines_tree, test, type = "class")

# confusion matrix
table(wines_tree_pred, test$type)

# accuracy and missclassification of the model
wines_tree_accuracy <- sum(diag(table(wines_tree_pred, test$type))) / nrow(test)
cat("Accuracy of the model: ", round(wines_tree_accuracy*100, 4), "%\n")
wines_tree_mclsfcn <- 1 - sum(diag(table(wines_tree_pred, test$type))) / nrow(test)
cat("Missclassification of the model: ", round(wines_tree_mclsfcn*100, 4), "%\n")

# accuracy of white wines
wines_white_accuracy <- sum(diag(table(wines_tree_pred, test$type))[1]) / sum(table(wines_tree_pred, test$type)[1, ])
cat("Accuracy of white wines predictions: ", round(wines_white_accuracy*100, 4), "%\n")

# accuracy of red wines
wines_red_accuracy <- sum(diag(table(wines_tree_pred, test$type))[2]) / sum(table(wines_tree_pred, test$type)[2, ])
cat("Accuracy of red wines predictions: ", round(wines_red_accuracy*100, 4), "%\n")

# Q: Which type of wine is better classified?
# A: Red wines are better classified, because the accuracy of red wines is higher than the accuracy of white wines.

### Task 1.7
set.seed(55)
wines_tree_all <- rpart(type ~ . - quality, data = rbind(train, test),method = "class",
                        control = rpart.control(minsplit = 2, cp = opt_cp, minbucket = 1))

# plot the tree
# install.packages("rattle")
library(rattle)

fancyRpartPlot(wines_tree_all, sub = "")

attr(wines_tree_all$terms, "term.labels")

# which predictor variables are actually used in the classification tree
wines_tree_all$variable.importance

# plot the variable importance in a barplot
barplot(wines_tree_all$variable.importance, main = "Variable Importance",
        xlab = "Importance", ylab = "Variable", horiz = FALSE,
        names.arg = c("TSO2", "Cl", "FSO2", "V.acid",
                      "F.acid", "C.acid", "Dens.", "Sulph.",
                      "Sugar", "pH", "Alc."))

# Short names of the variables, because the names are too long
# TSO2 = Total sulfur dioxide;  Cl = Chlorides; FSO2 = Free sulfur dioxide
# V.acid = Volatile acidity; F.acid = Fixed acidity; C.acid = Citric acid
# Dens. = Density; Sulph. = Sulphates; Sugar = Residual sugar; Alc = Alcohol

# Q: Are all 11 variables needed for the classification?
# A: No, only 9 variables are actually used in the model, but all variables
#    have an importance. (some very high and some barely any)
#    These variables are: TSO2, Cl, Sulph., V.acid, F.acid, Dens., Alc., Sugar, Ph

###############################################################################
## Task 2
###############################################################################

### Task 2.1

# xstd from the lowest xerror
(std <- wines_tree$cptable[which.min(wines_tree$cptable[, "xerror"]), "xstd"])

### Task 2.2
# get the cps which are within the std of the lowest xerror
(opt_cp_1se <- wines_tree$cptable[which(wines_tree$cptable[, "xerror"] <= min(wines_tree$cptable[, "xerror"]) + std), "CP"])

# if there are more then one cp, then take the highest cp (more simple tree)
if (length(opt_cp_1se) > 1) {
  opt_cp_1se <- max(opt_cp_1se)
}

(opt_cp_1se)
# create the tree with the opt_cp_1se
set.seed(55)
wines_tree_1se <- rpart(type ~ . - quality, data = rbind(train, test), method = "class",
                        control = rpart.control(minsplit = 2, cp = opt_cp_1se, minbucket = 1))

# plot the tree
fancyRpartPlot(wines_tree_1se, sub = "")

# accuracy of the model
wines_tree_1se_accuracy <- sum(diag(table(predict(wines_tree_1se, test, type = "class"), test$type))) / nrow(test)
cat("Accuracy of the se_model: ", round(wines_tree_1se_accuracy*100, 4), "%\n")
cat("Accuracy of the model with all data: ", round(wines_tree_accuracy*100, 4), "%\n")

# Q: Did you obtain a (much) simpler model?
# A: Yes, the model got much simpler, because the cp is much higher
#    than the cp of the model with all data.

###############################################################################
## Task 3
###############################################################################

### Task 3.1

# check if type is a factor
is.factor(wines$type)

# random forest with all variables except quality
# install.packages("randomForest")
library(randomForest)

set.seed(55)
wines_forest <- randomForest(type ~ . - quality, data = train, ntree = 555, importance = TRUE)

# plot the error rate versus the number of trees and save the plot
plot(wines_forest, main = "Error rate vs. number of trees")

# looking at the plot we can say, that around 200 trees would be enough

### Task 3.2
# out-of-bag error rate and the confusion matrix
wines_forest

# error rate would be around 0.0169 (1.69%)
# there are 22 missclassifications

### Task 3.3
# prediction on test data
set.seed(55)
wines_forest_pred <- predict(wines_forest, test, type = "class")

# confusion matrix
table(wines_forest_pred, test$type)

# accuracy and missclassification of the model
wines_forest_accuracy <- sum(diag(table(wines_forest_pred, test$type))) / nrow(test)
cat("Accuracy of the model: ", round(wines_forest_accuracy*100, 4), "%\n")
wines_forest_mclsfcn <- 1 - sum(diag(table(wines_forest_pred, test$type))) / nrow(test)
cat("Missclassification of the model: ", round(wines_forest_mclsfcn*100, 4), "%\n")

# Q: Did it perform better than the classification tree?
# A: Yes, the accuracy of the random forest is higher than
#    the accuracy of the classification tree.

# Q: How many missclassifications did you obtain?
# A: 13 missclassifications

### Task 3.4
# get the missclassified wines
misclass_wines <- test[which(wines_forest_pred != test$type), ]

# print the first 2
head(misclass_wines, 2)

set.seed(55)
misclass_wines_pred <- predict(wines_forest, misclass_wines, type = "prob")

misclass_wines_pred

# Q: Interpret the results.
# A: As the result we get a matrix with the probability
#    of the wine being red or white. At the first row
#    we can see that the wine is around 49% red and 51% white.

### Task 3.5
help(randomForest)

mtry_vec <- c(2, 5, 8)

nodesize_vec <- c(2, 4, 6)

# random forest for each combination of mtry and nodesize
for (mtry in mtry_vec) {
  for (nodesize in nodesize_vec) {
    set.seed(55)
    wines_forest <- randomForest(type ~ . - quality, data = train, ntree = 555, importance = TRUE, mtry = mtry, nodesize = nodesize)
    wines_forest_pred <- predict(wines_forest, test, type = "class")
    print(table(wines_forest_pred, test$type))
    cat("mtry: ", mtry, " nodesize: ", nodesize, "\n")
  }
}

# Q: Which combination of mtry and nodesize performs best?
# A: The combination of mtry = 5 and nodesize = 4 performs best

### Task 3.6

# print only the MeanDecreaseGini of the variable importance
(forest_importance <- wines_forest$importance[order(wines_forest$importance[, 4], decreasing = TRUE), 4])

# plot the variable importance in a barplot
barplot(forest_importance, main = "Variable Importance",
        xlab = "Importance", ylab = "Variable", horiz = FALSE,
        names.arg = c("TSO2", "Cl", "V.acid", "Dens.",
                      "Sulph.", "F.acid", "Sugar",
                      "pH", "Alc.", "C.acid", "FSO2"))

# Q: Which variables are most important?
# A: The most important variables are: TSO2, Cl

# Q: Are these variables also important in the classification tree?
# A: Yes and No, some of them are important in the classification tree

###############################################################################
## Task 4
###############################################################################

### Task 4.1
# split the white wines into training and test data with approximately same ratio of qualities
set.seed(55)
train_white <- white_wines[sample(nrow(white_wines), 0.75 * nrow(white_wines)), ]
test_white <- white_wines[!(rownames(white_wines) %in% rownames(train_white)), ]

table(train_white$quality)
table(test_white$quality)

train_white$quality <- as.numeric(train_white$quality)

colnames(train_white)

### Task 4.2
# regression tree
# install.packages("caret")
require(caret)

set.seed(55)
tc <- trainControl(method = "repeatedcv", number = 10, repeats = 3)

# create a tuning grid
rt_tG <- expand.grid(.cp = seq(0.00001, 0.01, length = 15))

# train the model
set.seed(55)
(wines_tree_reg <- train(quality ~ ., data = train_white, method = "rpart", trControl = tc, tuneGrid = rt_tG))

# prediction on test data
set.seed(55)
wines_tree_reg_pred <- predict(wines_tree_reg, test_white)

# rmse of the model
rt_rmse_test <- sqrt(mean((wines_tree_reg_pred - test_white$quality)^2))
cat("RMSE of the model on test data: ", rt_rmse_test, "\n")

### Task 4.3
# random forest
set.seed(55)
forest_tG <- expand.grid(.mtry = sqrt(ncol(train_white)))
(wines_forest_reg <- train(quality ~ ., data = train_white, method = "rf", trControl = tc, tuneGrid = forest_tG))

set.seed(55)
wines_forest_reg_pred <- predict(wines_forest_reg, test_white)
rf_rmse_test <- sqrt(mean((wines_forest_reg_pred - test_white$quality)^2))
cat("RMSE of the model on test data: ", rf_rmse_test, "\n")

# linear regression lm
set.seed(55)
(wines_lm_reg <- train(quality ~ ., data = train_white, method = "lm", trControl = tc))

set.seed(55)
wines_lm_reg_pred <- predict(wines_lm_reg, test_white)
lm_rmse_test <- sqrt(mean((wines_lm_reg_pred - test_white$quality)^2))
cat("RMSE of the model on test data: ", lm_rmse_test, "\n")

# pcr
set.seed(55)
(wines_pcr_reg <- train(quality ~ ., data = train_white, method = "pcr", trControl = tc))

set.seed(55)
wines_pcr_reg_pred <- predict(wines_pcr_reg, test_white)
pcr_rmse_test <- sqrt(mean((wines_pcr_reg_pred - test_white$quality)^2))
cat("RMSE of the model on test data: ", pcr_rmse_test, "\n")

# pls
set.seed(55)
(wines_pls_reg <- train(quality ~ ., data = train_white, method = "pls", trControl = tc))

set.seed(55)
wines_pls_reg_pred <- predict(wines_pls_reg, test_white)
pls_rmse_test <- sqrt(mean((wines_pls_reg_pred - test_white$quality)^2))
cat("RMSE of the model on test data: ", pls_rmse_test, "\n")

# Lasso
set.seed(55)
(wines_lasso_reg <- train(quality ~ ., data = train_white, method = "glmnet", trControl = tc))

set.seed(55)
wines_lasso_reg_pred <- predict(wines_lasso_reg, test_white)
lasso_rmse_test <- sqrt(mean((wines_lasso_reg_pred - test_white$quality)^2))
cat("RMSE of the model on test data: ", lasso_rmse_test, "\n")

# Q: Which model performs best?
# A: The best mode is:
cat("The model that performed the best is the", switch(which.min(c(rt_rmse_test, rf_rmse_test, lm_rmse_test, pcr_rmse_test, pls_rmse_test, lasso_rmse_test)),
       "rt" = "Regression Tree",
       "rf" = "Random Forest",
       "lm" = "Linear Regression",
       "pcr" = "PCR",
       "pls" = "PLS",
       "lasso" = "Lasso")[1], "\n")

### Task 4.5
# Calculate a classification tree model

# set the quality to a factor
train_white$quality <- as.factor(train_white$quality)

set.seed(55)
(wines_tree_class <- train(quality ~ ., data = train_white, method = "rpart", trControl = tc, tuneGrid = rt_tG))

set.seed(55)
wines_tree_class_pred <- predict(wines_tree_class, test_white)

# classification random forest
set.seed(55)
(wines_forest_class <- train(quality ~ ., data = train_white, method = "rf", trControl = tc, tuneGrid = forest_tG))

set.seed(55)
wines_forest_class_pred <- predict(wines_forest_class, test_white)

#  transform both the predictions and the true values of the testset to numeric values and calculate the rmse
wines_tree_class_pred <- as.numeric(wines_tree_class_pred)
wines_forest_class_pred <- as.numeric(wines_forest_class_pred)

test_white$quality <- as.numeric(test_white$quality)

# rmse of the model
class_tree_rmse_test <- sqrt(mean((wines_tree_class_pred - test_white$quality)^2))
cat("RMSE of the classification tree: ", class_tree_rmse_test, "\n")

class_forest_rmse_test <- sqrt(mean((wines_forest_class_pred - test_white$quality)^2))
cat("RMSE of the classification forest: ", class_forest_rmse_test, "\n")

# wines_tree_reg and wines_forest_reg
# wines_tree_reg_pred and wines_forest_reg_pred

# round the predictions of the regression models to the nearest integer and calculate the rmse
wines_tree_reg_pred <- round(wines_tree_reg_pred)
wines_forest_reg_pred <- round(wines_forest_reg_pred)

# rmse of the model
reg_tree_rmse_test <- sqrt(mean((wines_tree_reg_pred - test_white$quality)^2))
cat("RMSE of the regression tree: ", reg_tree_rmse_test, "\n")

reg_forest_rmse_test <- sqrt(mean((wines_forest_reg_pred - test_white$quality)^2))
cat("RMSE of the regression forest: ", reg_forest_rmse_test, "\n")
