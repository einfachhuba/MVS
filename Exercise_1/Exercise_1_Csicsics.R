####  Exercise 1  ####

##  Task 1  ##

# Task 1.1  #
(a <- seq(from = 1, to = 99, by = 2))
(b <- seq(from = 2, to = 100, by = 2))

(c <- sort(c(a, b)))


# Task 1.2  #
(vec <- rep(1:100, times = 1:100))


# Task 1.3  #
n <- 10
result <- 1

for (i in 1:n) {
  term <- prod((seq(2, by = 2, length.out = i))) / prod((seq(3, by = 2, length.out = i)))
  result <- result + term
}

(result)

# Task 1.4  #
# 9 wegen Schüler
# 3 wegen gezogene Schüler
# P(k = 3) = (9 3) * p**3 * (1-p)**6
p <- (3/9)

(prob <- (factorial(9))/(factorial(3)*factorial((9-3))) * p**3 * (1-p)**6)

# M?ssen wissen ob es mit oder ohne Sch?ler "zur?cklegen" ist

# falsch, Richtige Antwort:

a <- choose(9, 3)
b <- choose(8, 2)

c <- (b / a)

##  Task 2  ##
# Package davor installieren
library(UsingR)
data(father.son)

# Task 2.1  #
# Classentyp
class(father.son)

# Welche Dimension
dim(father.son)

# Schauen nach fehlende Werte
sum(is.na(father.son))


# Task 2.2  #
# Höhe in inch zu centimeters (1 inch = 2.54 cm)
father.son$fheight <- father.son$fheight * 2.54
father.son$sheight <- father.son$sheight * 2.54

# Sortieren (ascending)
father.son <- father.son[order(father.son$fheight), ]


# Task 2.3  #
# Scatterplot
plot(father.son$fheight, father.son$sheight, 
     xlab = "Height father (cm)",
     ylab = "Height son (cm)",
     main = "Höhen Scatterplot",
     type = "p",
     xlim = c(150, 200),
     ylim = c(150, 200),
     pch = 1, # Punkttyp
     cex = 1  # Punktgröße
)

# Task 2.4  #
# Korrelation
corr_father_son <- cor(father.son$fheight, father.son$sheight)

cat("Korrelation F_S: ", corr_father_son, "\n")

# 0.5 ist nicht viel Korrelation bzw. leichte Korelation


# Task 2.5  #
library(alr3)

data(heights)
corr_mother_daughter <- cor(heights$Mheight, heights$Dheight)

cat("Korrelation M_D: ", corr_mother_daughter, "; Korrelation F_S: ", corr_father_son, "\n")
# nicht viel unterschied, beide ca. 0.5


# Task 2.6  #
boxplot(father.son$fheight, father.son$sheight,
        names = c("Fathers", "Sons"),
        xlab = "Group",
        ylab = "Heights (cm)",
        main = "Comparison of Father and Son Heights"
)
# Söhne sind im durchschnitt höher.


# Task 2.7  #
tallest_son_height <- max(father.son$sheight)
tallest_son_father_height <- father.son$fheight[which.max(father.son$sheight)]

row_highest_avg_height <- which.max(rowMeans(father.son))
row_highest_abs_diff <- which.max(abs(father.son$fheight - father.son$sheight))

cat("Größter Sohn:", tallest_son_height, "cm\n")
cat("Vatergröße von größter Sohn:", tallest_son_father_height, "cm\n")
cat("Row Number mit höchster Mittelwert:", row_highest_avg_height, " values: fheight:", father.son$fheight[row_highest_avg_height], ", sheight:", father.son$sheight[row_highest_avg_height], "\n")
cat("Row Number mit höchster absolute Differenz:", row_highest_abs_diff, " values: fheight:", father.son$fheight[row_highest_abs_diff], ", sheight:", father.son$sheight[row_highest_abs_diff], "\n")



##  Task 3 ##
library(ISLR)

# Task 3.1  #
data("Auto")
dim(Auto)
sum(is.na(Auto))


# Task 3.2  #
# "origin" ist die Spalte die Categorial ist
Auto$origin <- as.character(Auto$origin)

# Task 3.3  #
# Kovarianz
cov_matrix <- cov(Auto[, 1:6])

# Korrelation
cor_matrix <- cor(Auto[, 1:6])

print(cor_matrix)
# Pos:
# displacement mit cylinders, horsepower und weight
# aber auch cylinders mit horsepower und weight
# und weight mit horsepower

# Neg:
# miles per gallon (mpg) mit fast alle (displacement, cylinders, horsepower, weight) außer acceleration

# Negativ macht sinn, weil je mehr Horsepower, desto mehr verbraucht das Auto und deswegen weniger miles rauskommen

# Task 3.4  #
plot(Auto$weight, Auto$mpg,
     xlab = "Weight",
     ylab = "Meilen pro Gallon",
     main = "Meilen pro Gallon gegen Weight")

(lm_model <- lm(mpg ~ weight, data = Auto))

rmse <- sqrt(mean(lm_model$residuals^2))
cat("Root-Mean-Square Error (RMSE):", rmse, "\n")


# Task 3.5  #
Auto$liters100 <- 235.21 / Auto$mpg

# neue Scatterplot
plot(Auto$weight, Auto$liters100,
     xlab = "Weight",
     ylab = "Liter pro 100 km",
     main = "Liter pro 100 km gegen Weight")

lm_model_liters <- lm(liters100 ~ weight, data = Auto)

# Berechnung R_square
r_squared <- summary(lm_model_liters)$r.squared
cat("R²:", r_squared, "\n")

# Berechnung RMSE
rmse_liters <- sqrt(mean(lm_model_liters$residuals^2))
cat("RMSE für Liter pro 100 km:", rmse_liters, "\n")

# R_Square: Anteil der Varianz in der abhängigen Variablen
# Wertebereich zwischen 0 und 1 -> 0 sehr schlecht und 1 sehr gut

# RSME: Vorhersagefehler des Modells für Liter pro 100 km




