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
wines_tree <- rpart(type ~ . - quality, data = train, method = "class", control = rpart.control(minsplit = 2, cp = 0.005, minbucket = 1))
# cp = complexity parameter, the smaller the more complex the tree,
# that's why I set it to 0.01, because 0.001 would be too complex
# and we would have a tree with a lot of nodes

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
cat("Accuracy of the model: ", wines_tree_accuracy, "\n")
wines_tree_mclsfcn <- 1 - sum(diag(table(wines_tree_pred, test$type))) / nrow(test)
cat("Missclassification of the model: ", wines_tree_mclsfcn, "\n")

# accuracy of white wines
wines_white_accuracy <- sum(diag(table(wines_tree_pred, test$type))[1]) / sum(table(wines_tree_pred, test$type)[1, ])
cat("Accuracy of white wines predictions: ", wines_white_accuracy, "\n")

# accuracy of red wines
wines_red_accuracy <- sum(diag(table(wines_tree_pred, test$type))[2]) / sum(table(wines_tree_pred, test$type)[2, ])
cat("Accuracy of red wines predictions: ", wines_red_accuracy, "\n")

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
# A: No, only 4 variables are actually used in the model, but all variables
#    have an importance. (some very high and some barely any)

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

# create the tree with the opt_cp_1se
set.seed(55)
wines_tree_1se <- rpart(type ~ . - quality, data = rbind(train, test), method = "class",
                        control = rpart.control(minsplit = 2, cp = opt_cp_1se, minbucket = 1))

# plot the tree
fancyRpartPlot(wines_tree_1se, sub = "")

# accuracy of the model
wines_tree_1se_accuracy <- sum(diag(table(predict(wines_tree_1se, test, type = "class"), test$type))) / nrow(test)
cat("Accuracy of the se_model: ", wines_tree_1se_accuracy, "\n")
cat("Accuracy of the model with all data: ", wines_tree_accuracy, "\n")

# Q: Did you obtain a (much) simpler model?
# A: No, only 1 node less (Density)

###############################################################################
## Task 3
###############################################################################

### Task 3.1