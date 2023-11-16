## ---- Working Directory ------------------------------------------------------
setwd(dir = "C:\FH\Semester5\DAT")


## ---- core_team_members ------------------------------------------------------
# see R contributors by typing this into the console
contributors()


## ---- change_prompt ----------------------------------------------------------
options(prompt = "R> ")


## ---- show_r_version ---------------------------------------------------------
# show R version
version


## ---- get_working directory --------------------------------------------------
# current setting on my computer
getwd()


## ---- change working directory -----------------------------------------------
setwd(dir = "C:\\FH\\Semester5\\DAT")


## ---- set_wd_change2 ---------------------------------------------------------
# change to another already existing directory
# setwd(dir = "C:/FH/Semester5/DAT")


## ---- create_directory -------------------------------------------------------
# create a new directory with name "test_directory"
# dir.create(path = "C:/FH/Semester5/DAT/02_working_with_R")


## ---- dir_content ------------------------------------------------------------
# view files in directory, but only show the first 5
list.files()[1:5]


## ---- introduce_comments -----------------------------------------------------
# a comment in a separate line
getwd()  # a comment after command in the same line


## ---- Addition and Subtraction -----------------------------------------------
1 + 2
3 - 5


## ---- Multiplication and Division --------------------------------------------
# decimal point is a point and no comma in R!  
3.5 * 5.5
3.5 / 5.5


## ---- power and square root --------------------------------------------------
# calculate 2*2*2*2*2
2^5


## ---- precedence -------------------------------------------------------------
# use brackets if needed
3 + 4 * 5
(3 + 4) * 5


## ---- integer division -------------------------------------------------------
# exact result would give 7.68
19.2 %/% 2.5


## ---- modulo operation -------------------------------------------------------
# gives the remainder of division
18 %% 2
19 %% 2 


## ---- square root ------------------------------------------------------------
# square root 
sqrt(20)


## ---- logarithms -------------------------------------------------------------
# log ... base e (natural logarithm)
log(x = 4)

# log10 ... base 10; log2 ... base 2
log10(x = 100)

# we can also use any other base
log(x = 100, base = 3)


## ---- exponential function ---------------------------------------------------
# Euler's exponential function
exp(x = 5)

# short test
log(exp(5))


## ---- Plot exponential function ----------------------------------------------
par(cex.main = 1.5, cex.axis = 1.3, cex.lab = 1.3)
x <- seq(from = -4, to = 4, by = 0.01)
plot(x = x, y = exp(x), type = "l", main = "Exponential function f(x) = exp(x)", xlab = "x", ylab = "f(x) = exp(x)", lwd = 2)
abline(h = 0)
par(cex.main = 1.2, cex.axis = 1.0, cex.lab = 1.0)


## ---- Trigonometric functions ------------------------------------------------
# R knows Pi
pi

# more digits
options(digits = 6)
pi

# sine, cosine, tangent and inverse functions; Inf ... infinity
sin(x = pi/2)
atan(x = Inf) # which is pi/2


## ---- reset number of digits shown -------------------------------------------
options(digits = 7)


## ---- plot trigonometric function --------------------------------------------
par(mfrow = c(1, 2), cex.main = 1.5, cex.axis = 1.3, cex.lab = 1.3)
x <- seq(from = -2 * pi, to = 2 * pi, by = 0.01)
xt <- seq(from = -pi, to = pi, by = 0.01)
plot(x = x, y = sin(x), type = "l", main = "sin(x) and cos(x)", xlab = "x", ylab = "f(x)", lwd = 2,
     col = "black")
lines(x = x, y = cos(x), type = "l", lwd = 2, col = "red")
text(x = -5.5, y = -0.55, labels = "sin(x)", cex = 1.2)
text(x = -5.5, y = -0.85, labels = "cos(x)", cex = 1.2, col = "red")
abline(h = 0)
plot(x = xt, y = tan(xt), type = "l", ylim = c(-15, +15), main = "tan(x)", xlab = "x", ylab = "f(x)",
     lwd = 2, col = "blue")
abline(h = 0)
text(x = -2.7, y = -12.8, labels = "tan(x)", cex = 1.2, col = "blue")
par(mfrow = c(1, 1), cex.main = 1.2, cex.axis = 1.0, cex.lab = 1.0)


## ---- factorial function -----------------------------------------------------
# calculate 5! = 1*2*3*4*5
factorial(x = 5)


## ---- readability ------------------------------------------------------------
# good
3 * 4 + 2

# not so good
3*4+2


## ---- incomplete statement ---------------------------------------------------
# pressing enter before function complete
3 / (2 -
       4)


## ---- scientific notation ----------------------------------------------------
# small
3 / 6000000

# large
factorial(30)


## ---- command_history --------------------------------------------------------
history()


## ---- help_function ----------------------------------------------------------
# help for sin function
help(sin)

# help for sin function with ?
?sin

# do not forget the quotes
RSiteSearch("trigonometric functions")

help.search("trigonometric functions")

help.start()


## ---- example_function -------------------------------------------------------
# see if there are examples for the usage of mean function
example(mean)

# perhaps more spectacular -> linear models or plots 
example(lm)
example(contour)

# output is not shown
demo()


## ---- demo_persp -------------------------------------------------------------
# output (= code and plots) not shown
demo(persp)


## ---- demo_vignette ----------------------------------------------------------
# output again not shown
vignette()


## ---- display_vignette -------------------------------------------------------
# output not shown
vignette(topic = "chemometrics-vignette")


## ---- assignments ------------------------------------------------------------
# save a number in variable y with "<-"
y <- exp(2)

# alternatively with "="
y = exp(2)

# alternative with "->"
exp(2) -> y

# or a little more complicated
assign("y", value = exp(2))


## ---- case_sensitive ---------------------------------------------------------
# assign different values
a <- 5
A <- 4

# difference is not (!) zero, i.e. a and A are different objects
a - A


## ---- using variables --------------------------------------------------------
# typing the name displays the contents
y

# in fact the print() function is invoked
print(y)

# both steps (assignment and print):
(y <- exp(2))

# use name of object for further calculations
y^2


## ---- semicolon --------------------------------------------------------------
x <- 5; y <- 4; (x - y)


## ---- not_working ------------------------------------------------------------
pi
pi <- 100
pi


## ---- restore_pi -------------------------------------------------------------
help(pi)

pi <- base::pi
pi


## ---- complex_image ----------------------------------------------------------
# a + bi Form
par(mfrow = c(1, 2))
plot(x = 1:10, y = 1:10, type = "n", xlab = "Real Part", ylab = "Imaginary Part",
     cex.axis = 1.4, cex.lab = 1.4, xlim = c(0.3, 10), ylim = c(0.3,10),
     main = expression(paste("Complex Number z = a + bi")), cex.main = 1.7)
points(x = 4, y = 3, cex = 1.5, col = "red", pch = 19)
segments(x0 = 4, y0 = 0, x1 = 4, y1 = 3, lty = "dashed", lwd = 1.5)
segments(x0 = 0, y0 = 3, x1 = 4, y1 = 3, lty = "dashed", lwd = 1.5)
text(x = 5.3, y = 3.7, labels = "z = a + bi", cex = 1.8)

# r/Phi form
plot(x = 1:10, y = 1:10, type = "n", xlab = "Real Part", ylab = "Imaginary Part",
     cex.axis = 1.4, cex.lab = 1.4, xlim = c(0.3, 10), ylim = c(0.3,10),
     main = expression(paste("Complex Number z = (r, ", phi1, ")", sep = "")), cex.main = 1.7)
points(x = 4, y = 3, cex = 1.5, col = "red", pch = 19)
segments(x0 = 0, y0 = 0, x1 = 4, y1 = 3, lty = "dashed", lwd = 1.5)
text(x = 5.3, y = 3.7, labels = expression(paste("z = (r, ", phi1, ")")), cex = 1.8)
text(x = 2, y = 2, labels = "r", cex = 1.8)
text(x = 1.2, y = 0.3, labels = expression(paste(phi1)), cex = 1.8)
par(mfrow = c(1, 1))


## ---- complex numbers --------------------------------------------------------
# we receive an NaN (not a number, see later)
(z <- sqrt(-2))

# tell R that we deal with complex numbers; -2 = -2 + 0i
(z <- sqrt(-2 + 0i))

# test
z*z

# enter a real and an imaginary part
(z <- complex(real = 3, imaginary = -2))

# due to partial matching (see later) the following is also correct
(z <- complex(r = 3, im = -2))

# complex number z was
z

# remember: both real and imaginary part are real! values
# real part (= a)
Re(z)

# imaginary part (= b)
Im(z)

# conjugate-complex
Conj(z)

# r
Mod(z)

# phi
Arg(z)

# phi in degrees instead of radians
Arg(z) * 180/pi

# z * z' = r^2
z * Conj(z)
Mod(z)^2 # gives the same

# Euler 
exp(complex(real = 0, imaginary = pi))


## ---- vectors ----------------------------------------------------------------
# height of 6 people in m (separated by comma) as vector
height <- c(1.68, 1.74, 1.70, 1.84, 1.73, 1.91)

# if we want the result of the assignment to be printed - type the name again
height

# number of elements in vector height
length(height)

# combine a and b with intermediate 0
a <- c(1, 2, 3)
b <- c(4, 5, 6)
(comb_vector <- c(a, 0, b))


## ---- add vectors ------------------------------------------------------------
# add two vectors of length 3
a <- c(1, 2, 3)
b <- c(4, 5, 6)
(sum_vec <- a + b)


## ---- multiply vectors -------------------------------------------------------
# take the same vectors a, b as above
(prod_vec <- a * b)


## ---- inner_product ----------------------------------------------------------
# scalar multiplication
a %*% b


## ---- vectors with different lengths -----------------------------------------
# a has length 6, b length 2 (6 = multiple of 2)
a <- c(1, 2, 3, 4, 5, 6)
b <- c(10, 20)
(sum_vec <- a + b)

# a has length 5, b length 2 (5 not a multiple of 2)
a <- c(1, 2, 3, 4, 5)
b <- c(10, 20)
(sum_vec <- a + b)


## ---- int_sequences ----------------------------------------------------------
# create an integer sequence from 1 to 10
1:10  

# increment using the 'by' argument
seq(from = 1, to = 4, by = 0.5)

# last element in vector is not larger than value given in the 'to' argument
seq(from = 1, to = 3.9, by = 0.5)

# set the length of resulting vector
seq(from = 1, to = 4, length.out = 16)

# create a vector with seq that has the same length as other vector
x <- 1:4 # has length 4
(y <- seq(from = 20, to = 40, along.with = x))


## ---- reverse the order ------------------------------------------------------
# use last vector
rev(y)


## ---- repeat -----------------------------------------------------------------
# repeat 4 for 3 times
rep(x = 4, times = 3)

# a little more complicated
rep(x = 1:3, times = c(1, 4, 2))

# another usage
rep(x = 1:3, each = 2)    


## ---- named vectors ----------------------------------------------------------
# create named vector
y2 <- c(apples = 5, oranges = 10, bananas = 12)
y2

# get the names of this vector
names(y2)


## ---- set names of vector elements -------------------------------------------
# create vector
(y3 <- c(5, 10, 12))

# create names with setNames() 
(y3 <- setNames(y3, c("apples", "oranges", "bananas")))


## ---- sorting vector elements ------------------------------------------------
# sort in increasing and decreasing order
x <- c(5, 3, 9, 11, 2)
sort(x)
sort(x, decreasing = TRUE)


## ---- order() function -------------------------------------------------------
# create a vector
x <- c(10, 50, 30, 90)

# position of smallest element first, largest element last 
order(x, decreasing = FALSE)


## ---- sum of vector elements -------------------------------------------------
x <- c(1, 5, 3, 7)
# sum of elements 
sum(x)


## ---- product of vector elements ---------------------------------------------
x <- c(1, 5, 3, 7)

# product of elements 
prod(x)


## ---- arithmetic_mean0, echo = -c(1,2,3,4)---------------------------
set.seed(55)
# create sample data vector of 
# 20 N(0,1) random numbers
x <- round(rnorm(10, mean = 0, sd = 1), 2) + 5

# our data vector of length 10
x

# arithmetic mean
mean(x)

# variance
var(x)

# standard deviation
sd(x)


## ---- minimum and maximum ----------------------------------------------------
set.seed(123)
# create sample data vector of 10 N(0,1) random numbers
x <- round(rnorm(10, mean = 0, sd = 1), 2)

# data
x

# Minimum
min(x)

# Maximum
max(x)

# Range (vector of length 2 with minimum and maximum)
range(x)

# spread ('Spannweite')
diff(range(x))


## ---- all maxima -------------------------------------------------------------
# maxima at positions 3 and 8
x <- c(1, 5, 9, 2, 3, -1, -8, 9, 4, 0)
which(x == max(x))


## ---- sign function ----------------------------------------------------------
x <- c(-5, 0, 3)
sign(x)


## ---- absolute value ---------------------------------------------------------
# 5 N(-1,1) random numbers
set.seed(123)
x <- round(rnorm(5, mean = -1, sd = 1), 1)
x

# absolute values
abs(x)


## ---- euklidean norm ---------------------------------------------------------
# take vector x from above (see also the norm() function)
sqrt(sum(x^2))

# Euclidean or "2" norm
norm(x, type = "2")


## ---- ranks ------------------------------------------------------------------
# 6 observations
x <- c(4.3, 2.9, 8.8, 1.4, 1.9, 5.5)

# ranks
rank(x)

# 6 observations with ties
x <- c(1.4, 1.9, 1.9, 1.4, 1.9, 5.5)

# ranked observations
rank(x)


## ---- quant1 -----------------------------------------------------------------
set.seed(123)
(dat <- sort(round(rnorm(10), 2)))


## ---- cumulative sums and products -------------------------------------------
x <- c(3, 2, 4, 2, 5)
cumsum(x)
cumprod(x)


## ---- rounding ---------------------------------------------------------------
x <- c(3.9, 4.0, 4.1)
ceiling(x)

floor(x)

round(pi, digits = 3)


## ---- numerical accuracy -----------------------------------------------------
# why not equal?
sqrt(2)^2 - 2

# load package
require(sfsmisc)

# check
is.whole(sqrt(2)^2)


## ---- union and intersection -------------------------------------------------
# data
x <- c(2, 3, 7)
y <- c(8, 9, 3, 4, 7, 1)

# union (Mengenvereinigung)
union(x, y)

# intersect = Mengendurchschnitt
intersect(x, y)

# setdiff = Mengendifferenz: all elements in x, which are NOT contained in y
setdiff(x, y)


## ---- equality of sets -------------------------------------------------------
# define two sets
set_x <- c(1, 2, 3)
set_y <- c(1, 2, 2, 2, 2, 3, 3)

# check for equality (in the sense of sets)
setequal(set_x, set_y)

# are these elements contained in the set y?
is.element(el = c(1, 2, 17), set = set_y) 

# are these elements contained in the set y?
c(1, 2, 17) %in% set_y 


## ---- subsets ----------------------------------------------------------------
# define function which checks for subset
subs <- function(a, b) { # a and b are sets
  return(all(a %in% b))
}

# check our function
subs(a = c(1, 2, 17), set_y)
subs(a = c(1, 2, 3), set_y)


## ---- sample function --------------------------------------------------------
help(sample)

set.seed(123)
# we interpret the last number as "Zusatzzahl"
sample(x = 1:45, size = 7, replace = FALSE)


## ---- seeds ------------------------------------------------------------------
# 1st try
sample(1:45, size = 7)

# 2nd try
sample(1:45, size = 7)

# 1st try
set.seed(123)
sample(1:45, size = 7)

# 2nd try
set.seed(123)
sample(1:45, size = 7)

# 1st try
set.seed(75)
sample(1:45, size = 7)

# 2nd try
set.seed(75)
sample(1:45, size = 7)


## ---- vector modes -----------------------------------------------------------
# vector of real values, alternative to mode(): typeof()
real_vec <- c(1.5, 1.2, 0.9)
mode(real_vec)

# check
is.numeric(real_vec)

# integer sequence from 1 to 10
x_n <- 1:10
is.integer(x_n)

# Pi as an irrationale number, i.e. a real number which cannot be written as a fraction
y_n <- pi
is.integer(y_n)
is.numeric(y_n)

# integer or not?
a <- c(1, 2, 3)
is.integer(a)

# force integer with the "L" suffix
a_new <- c(1L, 2L, 3L)
is.integer(a_new)

# as.* functions
b <- as.double(a_new)
is.integer(b)
is.double(b)
is.numeric(b)


## ---- complex vectors --------------------------------------------------------
# complex number with real part = 2, imaginary part = 1
(x_c <- complex(real = c(2, -5), imaginary = c(1, -1)))
mode(x_c)

# check
is.complex(x_c)


## ---- logical vectors --------------------------------------------------------
x_l <- c(TRUE, TRUE, FALSE, TRUE, FALSE)
mode(x_l)

# the same as
y_l <- c(T, T, F, T, F)
mode(y_l)

# check
is.logical(x_l)


## ---- character vectors ------------------------------------------------------
# a character vector
x_char <- c("Anna", "Hans", "Maria")
mode(x_char)

# check
is.character(x_char)


## ---- mix modes --------------------------------------------------------------
# mixing character/numeric -> 2 and 6 converted to characters!
(x <- c("Anna", 2, 6))
is.character(x)

# numeric/logical: T/F -> 1/0
(y <- c(TRUE, FALSE, 4))

# check
is.numeric(y)


## ---- equality and inequality, smaller, larger -------------------------------
(a <- 1:5)

# recycling !
a == 4
a != 4

a < 4
a > 4

a <= 4
a >= 4


## ---- help on these operators ------------------------------------------------
help("==")


## ---- all and any ------------------------------------------------------------
# 5 N(0,1) random normal numbers
(x <- rnorm(5))
all(x > 0)
any(x > 0)


## ---- check if identical -----------------------------------------------------
x <- 1:4
y <- c(1L, 2L, 3L, 4L)

# are the entries numerically identical?
x == y

# are the two objects x and y identical?
identical(x, y)

all.equal(x, y)

# check if x (or z) is contained in y
x <- 2
z <- 3
y <- c(8, 9, 3, 4, 7, 1)

# no
x %in% y

# yes
z %in% y

# check for each element in x if also member of y
x <- c(2, 3, 7)
y <- c(8, 9, 3, 4, 7, 1)

# the result will be a vector of the same length as x
x %in% y

# print only those elements (indexing/subsetting see later)
x[x %in% y]


## ---- logical vectors and operations -----------------------------------------
# is TRUE, if both are TRUE
TRUE & TRUE
TRUE & FALSE

# is TRUE, if at least one of both is TRUE
TRUE | FALSE
FALSE | FALSE

# is TRUE, if exactly one is true
e <- f <- TRUE
xor(e, f)

# 2 logical vectors
a <- c(TRUE, FALSE, FALSE, TRUE)
b <- c(TRUE, TRUE, FALSE, FALSE)

# AND
a & b

# or
a | b

# ANDAND
a && b

# oror
a || b

e <- TRUE; f <- FALSE
e || f # to be expected

e <- TRUE; f <- FALSE; rm(f)
e || f # no problem for ||

e <- TRUE; f <- FALSE; rm(f)
e | f # error for |


## ---- coercion to character --------------------------------------------------
# logical, numeric -> character
c(TRUE, 14, "Karl Pearson")


## mix logical and numeric -----------------------------------------------------
c(TRUE, 5) + c(100, FALSE)


# as.logical example
as.logical(c(1, -2.5, 0, 15))


## ---- vector subsetting ------------------------------------------------------
# data vector x
x <- c(3, 7, 4, 1, 10)

# get the 2nd element
x[2]

# get the 2nd and last element
x[c(2, 5)]

# or more general
x[c(2, length(x))]

# get each element twice
x[rep(1:length(x), each = 2)]


## ---- using names for subsetting ---------------------------------------------
# create a vector with names
x <- c(3, 7, 4, 1, 10)
names(x) <- c("A", "B", "C", "D", "E")

# show vector
x

# get the elements with names "B" and "C"
x[c("B", "C")]


## ---- exclude with minus sign ------------------------------------------------
# a vector
x <- c(3, 7, 4, 1, 10)

# all but the first and last element via -
x[-c(1, length(x))]


## ---- logical vectors --------------------------------------------------------
# source vector
x <- c(3, 7, 4, 1, 10)

# elements to be retained: TRUE
log_vec <- c(TRUE, FALSE, FALSE, TRUE, TRUE)
x[log_vec]


## ---- TRUE versus T ----------------------------------------------------------
# create vector and assign the value 5 to variable T
a_vector <- c(4, 3, 7, 9, 11, 14, 2)
T <- 5

# then we make some calculations
# ...

# get the 2nd, 3rd and 6th element
a_vector[c(FALSE, TRUE, TRUE, FALSE, FALSE, TRUE, FALSE)]

# we also could use the abbreviations
a_vector[c(F, T, T, F, F, T, F)]

# reassign
T <- TRUE


## ---- initialization of vectors ----------------------------------------------
# create/initialize numeric vector of length 5
new_vector <- numeric(length = 5)

# check the object
is.vector(new_vector)

# print a vector
new_vector

# insert some values
new_vector[2:5] <- -1
new_vector

# without initialization it does not work
# first remove the vector
rm(new_vector)

# set the third element in non-existing vector
new_vector[3] <- 200


# numbers = vectors of length 1 
x <- 5
length(x)
is.vector(x)


# initialize character vector
# create vector of length 4
(a <- vector(mode = "character", length = 4))

# fill with letters
a[c(1, 2)] <- letters[1:2]
a[c(3, 4)] <- LETTERS[3:4]
a


## ---- missing values ---------------------------------------------------------
# 5 element vector with missing 2nd element
x <- c(1, NA, 4, 6, 2)

# create second vector y
y <- 1:5
x + y

# x contains missing values
mean(x)

# but
mean(x, na.rm = TRUE)

# vector of length 6
(x <- c(NA, 1:5))

# missing values
is.na(x)

# number of missing values -- the sum for vectors of mode logical -> count TRUE values
sum(is.na(x))

# only keep the non-NA values
x[!is.na(x)]


## ---- infinity ---------------------------------------------------------------
4/0
-2/0
0/0

# Infinity - Infinity not defined
Inf - Inf

# Infinity + Infinity = Infinity
Inf + Inf

# NaN = not a number
sqrt(-1)


## ---- missing values and logical expressions ---------------------------------
# here we get a NA
NA & TRUE

# ... but here a TRUE
NA | TRUE

# ... and here a NA
NA | FALSE


## ---- matrices ---------------------------------------------------------------
help(matrix)


# 1x1 matrix with NA
matrix()

# either ncol or nrow would be sufficient
(my_matrix <- matrix(data = 1:9, nrow = 3, ncol = 3))

# Dimension of matrix
dim(my_matrix)

# get all attributes of the object my_matrix
attributes(my_matrix)

is.matrix(my_matrix)

# delete the dimension attribute
attributes(my_matrix)$dim <- NULL

# now my_matrix is a vector
my_matrix
is.vector(my_matrix)


## ---- vectors to matrices ----------------------------------------------------
# create vector
(a <- 1:9)

# set a dim attribute
attr(a, which = "dim") <- c(3, 3)

# now a is a matrix
a

is.matrix(a)


## ---- matrix and names -------------------------------------------------------
# matrix with 3 rows and 2 columns (height and weight)
x <- matrix(c(1.72, 1.65, 1.85, 70, 59, 80), ncol = 2)

# set columnnames
colnames(x) <- c("Height", "Weight")

# set rownames
rownames(x) <- c("Stefan", "Anna", "Fritz")

# show matrix
x

# 2 attributes - dim and dimnames
attributes(x)


# dimension during creation 
matrix(data = c(1.72, 1.65, 1.85, 70, 59, 80), ncol = 2,
       dimnames = list(name = c("Stefan", "Anna", "Fritz"),
                       data = c("Height", "Weight")))


## ---- means and sums ---------------------------------------------------------
# only mean over columns makes sense in above example
colMeans(x)

# Sum for each column separately
colSums(x)

# sum over all matrix elements
mean(x)

# standardize the matrix x
scale(x)


## ---- scaling_demo -----------------------------------------------------------
par(mfrow = c(1,3))
set.seed(123)
datA <- data.frame(a = rnorm(20, mean = 2, sd = 2),
                   b = rnorm(20, mean = 5, sd = 3.5),
                   c = rnorm(20, mean = -2, sd = 4))
plot(x = rep(1:3, each = 20), y = unlist(datA),
     pch = 19, col = rep(1:3, each = 20), axes = FALSE,
     xlab = "", ylab = "", cex = 1.2, ylim = c(-10,10),
     xlim = c(0.5, 3.5), main = "Original Data", cex.axis = 1.3,
     cex.main = 1.7)
axis(side = 2, line = 2, cex.axis = 1.5)
plot(x = rep(1:3, each = 20), y = unlist(datA) - rep(apply(datA, 2, mean), each = 20),
     pch = 19, col = rep(1:3, each = 20), axes = FALSE,
     xlab = "", ylab = "", cex = 1.2, ylim = c(-10,10),
     xlim = c(0.5, 3.5), main = "Centered Data", cex.main = 1.7)

plot(x = rep(1:3, each = 20), y = (unlist(datA) - rep(apply(datA, 2, mean), each = 20))/rep(apply(datA, 2, sd), each = 20),
     pch = 19, col = rep(1:3, each = 20), axes = FALSE,
     xlab = "", ylab = "", cex = 1.2, ylim = c(-10,10),
     xlim = c(0.5, 3.5), main = "Centered and Scaled Data", cex.main = 1.7)
axis(side = 4, line = 0, cex.axis = 1.5)
par(mfrow = c(1,1))


## ---- vector subsetting ------------------------------------------------------
# 3-vector with N(0,1) random numbers
(y <- rnorm(3))

# get second element
y[2]


## ---- matrix subsetting ------------------------------------------------------
# 3 x 3 matrix with N(0,1) random numbers
(y <- matrix(data = rnorm(9), ncol = 3))

# get element in position (2, 3), i.e. 2nd row, 3rd column
y[2, 3]

# get entire 2nd row (no entry -> take all entries)
y[2, ]

# get entire 3rd column
y[, 3]


## ---- using names for matrix subsetting --------------------------------------
# our height/weight matrix
x

# get Anna's data
x["Anna", ]

# get the Weight vector
x[, "Weight"]


## ---- using logical vectors for subsetting -----------------------------------
# we want all columns of the 2nd row
log_vec <- c(FALSE, TRUE, FALSE)
x[log_vec, ]

# all observations with height < 1.80
x[x[, "Height"] < 1.8, ]


## ---- cbind and rbind --------------------------------------------------------
# new column as vector first
Age <- c(22, 39, 30)

# bind by column
(x_new <- cbind(x, Age))

# new dimension
dim(x_new)

# Height, Weight and Age of new observation
Peter <- c(1.79, 82, 45)
(x_new2 <- rbind(x_new, Peter))


## ---- transpose of a matrix --------------------------------------------------
my_matrix <- matrix(data = 1:9, nrow = 3, ncol = 3)
t(my_matrix)


## ---- matrix arithmetics------------------------------------------------------
# define two matrices
(matrix_1 <- matrix(data = 1:4, ncol = 2))
(matrix_2 <- matrix(data = c(5, 2, 6, 8), ncol = 2))

# Addition
matrix_1 + matrix_2

# Multiplication
matrix_1 * matrix_2

# two matrices
(mat_1 <- matrix(1:6, ncol = 3))
(mat_2 <- matrix(c(4, -2, 0, 1, 2, -1), ncol = 2))

# matrix product
mat_1 %*% mat_2


## ---- solving systems of linear equations ------------------------------------
# matrix A (3 x 3)
A <- matrix(c(3, -2, 4, 1, 0, 2, 2, 6, -1), ncol = 3)

# give column names
colnames(A) <- paste("x", 1:3, sep = "_")

# show A
A

# vector b(3 x 1)
b <- c(5, 14, 2)

# solve Ax = b
solve(A, b)

# same matrix A as before, B now matrix with 2 columns
B <- matrix(c(5, 14, 2, 5, -4, 6), ncol = 2)
colnames(B) <- paste("b", 1:2, sep = "_")

# solve Ax = B, i.e. Ax = b1 amd Ax = b2
solve(A, B)


## ---- row amd col functions --------------------------------------------------
# a given matrix
matrix_1

# row() and col() functions
row(matrix_1)
col(matrix_1)


## ---- diag function ----------------------------------------------------------
# 3 x 3 matrix
set.seed(123)
(new_matrix <- round(matrix(rnorm(9), ncol = 3), 2))

# extract diagonal
diag(new_matrix)

# create 3 x 3 identity matrix
diag(3)

## outer function --------------------------------------------------------------
# create 2 vectors
x <- 1:3; y <- 1:4
outer(x, y, FUN = "^")


## ---- apply function ---------------------------------------------------------
help(apply)

# we return to the height/weight correlation example
# and add an additional random column
Height <- c(1.70, 1.76, 1.65, 1.90, 1.55, 1.80, 1.84, 1.72)
Weight <- c(75, 70, 58, 94, 56, 70, 89, 62)

# create another column (= variable) just to have more data
set.seed(123)
rand <- round(rnorm(8), digits = 2)

# create data matrix and set column and rownames
data_matrix <- matrix(c(Height, Weight, rand), ncol = 3)
colnames(data_matrix) <- c("Height", "Weight", "Random")
rownames(data_matrix) <- LETTERS[1:8]

# heights/weights data matrix
data_mat <- data_matrix[, 1:2]
data_mat

# column means (i.e. MARGIN = 2)
apply(X = data_mat, MARGIN = 2, FUN = mean)

# set 2 missing values
data_mat[1, 1] <- data_mat[4, 2] <- NA

# data matrix with NAs
data_mat

# column means
apply(data_mat, 2, mean)


# numeric column means with na.rm = TRUE
apply(data_mat, 2, mean, na.rm = TRUE)


## ---- arrays -----------------------------------------------------------------
(test_array <- array(data = c(110, 90, 120, 60, 67, 72, 95, 130, 125,
                              68, 75, 90),
                     dim = c(3, 2, 2),
                     dimnames = list(Patient = c("Mayer", "Mueller",
                                                 "Huber"),
                                     Variable = c("Blood Pressure",
                                                  "Pulse"),
                                     Month = c("January", "February"))))

# check
is.array(test_array)


# subsetting an array - e.g. get data for Patient Huber
test_array[3, , ]

# or
test_array["Huber", , ]

# MARGIN = 2 (the dimension we want to keep)
apply(test_array, 2, mean)

# now we keep patients and variables
apply(test_array, c(1, 2), mean)


## ---- creating lists ---------------------------------------------------------
# store integer vector, matrix and character vector in one list object
a_vec <- 1:4
b_mat <- matrix(rnorm(6), ncol = 3)
c_char <- "A character vector"

# create a list
(test_list <- list(a_vec, b_mat, c_char))

# we want the matrix (list element 2)
test_list[[2]]

# give names to list items
names(test_list) <- c("numeric_vector", "numeric_matrix",
                      "character_vector")

test_list2 <- list(a_vec = 1:4,
                   b_mat = matrix(rnorm(6), ncol = 3),
                   c_char = "A character vector")

# get character and integer vector
test_list[["character_vector"]]
test_list$numeric_vector

is.list(test_list)


## ---- partial matching -------------------------------------------------------
# create example list
list2 <- list(abc = 3, bcd = 5)

# access abc item via $ and partial matching
list2$a

# not working with [[]]
list2[["a"]]

# make it working:
list2[["a", exact = FALSE]]


## partial matching warning ion-------------------------------------------------
options(warnPartialMatchDollar = TRUE)
list2$a

options(warnPartialMatchDollar = FALSE)
list2$a


## ---- evaluation -------------------------------------------------------------
item_name <- "abc"

# extract element abc from list; item_name is evaluated
list2[[item_name]]

# not working with $
list2$item_name


## ---- list and single square brackets ----------------------------------------
# first two list items
test_list[1:2]


## ---- single versus double square brackets -----------------------------------
# single square brackets
test_list[1]

# check
is.list(test_list[1])

# double square brackets
test_list[[1]]

# check
is.list(test_list[[1]])

# define a list
a <- list(1:3, "a string", 3.141525, c(-1, -5))

# create a named list
(test_list <- list(numeric_vector = 1:4,
                   numeric_matrix = matrix(rnorm(6), ncol = 3),
                   character_vector = "A character vector"))


## ---- structure --------------------------------------------------------------
# Structure of a list object
str(test_list)


## ---- removing list items ----------------------------------------------------
# remove the first item
test_list[["numeric_vector"]] <- NULL
test_list

length(test_list)


## ---- list_of_lists ----------------------------------------------------------
# create a list
new_list <- list(aa = 25, bb = matrix(rnorm(10), ncol = 2), cc = 1:20)

# add this list to existing list as a new item
test_list[["further_item"]] <- new_list

# show test_list
str(test_list)

# show test_list, restrict output
str(test_list, max.level = 1)


## ---- lapply, sapply and vapply ----------------------------------------------
set.seed(123)
new_list <- list(A = rnorm(10), B = rnorm(20), C = rnorm(30))

# range for each list item
lapply(X = new_list, FUN = range)

# same data as before
sapply(new_list, FUN = range)

# 1st and 3rd quartile of the 3 data vectors in new_list
sapply(X = new_list, FUN = quantile, probs = c(0.25, 0.75))

set.seed(123)
li <- list(A = sample(1:10, 10, replace = TRUE),
           B = sample(1:10, 10, replace = TRUE))
sapply(li, unique)

vapply(X = new_list, FUN = range, FUN.VALUE = numeric(2))


## ---- unlist and concatenating lists -----------------------------------------
# list -> vector
unlist(new_list)

small_list1 <- list(a = 1:3, b = 4:6)
small_list2 <- list(c = 11:13, d = 40:42)

# create ONE longer list
(large_list <- c(small_list1, small_list2))

# now of length 4
length(large_list)


## ---- data_frames ------------------------------------------------------------
# small numeric data matrix
x <- matrix(c(1.72, 1.65, 1.85, 70, 59, 80), ncol = 2)
colnames(x) <- c("Height", "Weight")
rownames(x) <- c("Stefan", "Anna", "Fritz")

# character variable
University <- c("BOKU", "TU", "TU")
(x <- cbind(x, University))

# create data frame
df <- data.frame(Height = c(1.72, 1.65, 1.85),
                 Weight = c(70, 59, 80),
                 University = c("BOKU", "TU", "TU"),
                 row.names = c("Stefan", "Anna", "Fritz"))
# print
df


# convert to data frame --------------------------------------------------------
as.data.frame(x)

# is a factor
class(df$University)

df_cat <- data.frame(Height = c(1.72, 1.65, 1.85),
                     Weight = c(70, 59, 80),
                     University = c("BOKU", "TU", "TU"),
                     row.names = c("Stefan", "Anna", "Fritz"),
                     stringsAsFactors = FALSE)
class(df_cat$University)


## ---- names of a data frame --------------------------------------------------
# row and column names of a data frame
rownames(df)
colnames(df)

# both in a single step -> gives list
dimnames(df)


## ---- accessing a data frame -------------------------------------------------
# item in position (1,1)
df[1, 1]

# 2nd and 3rd row
df[2:3, ]

# 2nd column = Weight
df[, 2]

# get Height column
df$Height

# alternative:
df[, "Height"]

# rows by rowname
df["Stefan", ]

# all rows with University TU
df[df$University == "TU", ]


# subset single row
(df_1_row <- df[df$University != "TU", ])
class(df_1_row)


# subset single row and single column
(df_1_1 <- df[df$University != "TU", "Weight"])
class(df_1_1)

(df_1_col <- df[, "Weight"])
class(df_1_col)

class(df[df$University != "TU", 2, drop = FALSE])


## ---- factors - eye_colors -----------------------------------------------------
# eye color of 10 persons
(eye_colors <- c("blue", "blue", "brown", "blue", "brown",
                 "green", "green", "blue", "brown", "green"))

# convert to factor (alternative: as.factor())
(eye_colors_fac <- factor(eye_colors))

# remove the class
unclass(eye_colors_fac)

# look at attributes of factor -> levels and class
attributes(eye_colors_fac)

df$University

# list levels
levels(eye_colors_fac)

# number of levels
nlevels(eye_colors_fac)

# factor -> character
eye_colors_char <- as.character(eye_colors_fac)
attributes(eye_colors_char)

# check if factor
is.factor(eye_colors_fac)


# recoding - create gender vector
gender_vec <- c("M", "F", "F", "M", "M")
gender_fac <- factor(gender_vec)
gender_fac

# first Female, then male
levels(gender_fac) <- c("Female", "Male")
gender_fac

# summary of a factor
summary(gender_fac)

# load package
require(plyr)

# recode factor again old = "new"
revalue(gender_fac, c(Female = "female", Male = "male"))


## ---- ordered factor ---------------------------------------------------------
# marks of 7 pupils
marks <- c("Sehr Gut", "Gut", "Sehr Gut", "Nicht Genuegend",
           "Befriedigend", "Genuegend", "Sehr Gut")

# create ORDERED factor
marks_of <- factor(marks,
                   levels = c("Sehr Gut", "Gut", "Befriedigend",
                              "Genuegend", "Nicht Genuegend"),
                   ordered = TRUE)

marks_of

is.ordered(marks_of)


## ---- drop levels of a factors -----------------------------------------------
# we use the last factor
marks_of

# keep only first 3 items -> levels Befriedigend, ... still there
marks_of3 <- marks_of[1:3]
marks_of3

# factor()
(marks_of3_dropped <- factor(marks_of3))

# droplevels()
(marks_of3_dropped2 <- droplevels(marks_of3))


## ---- cut a data vector ------------------------------------------------------
set.seed(123)
# create some data
data_vec <- rnorm(100)
head(data_vec)

# important arguments x, breaks and (eventually) labels
cut_x <- cut(x = data_vec,
             breaks = c(-Inf, -0.67, 0, +0.67, +Inf),
             labels = c("very_low", "rather_low",
                        "rather_high", "very_high"),
             ordered_result = TRUE)
head(cut_x)
table(cut_x)


# dimension of a data frame 
dim(df)
nrow(df)
ncol(df)


## ---- list to data frame -----------------------------------------------------
# a simple list
my_list <- list(a = 1:3, b = 4:6)

# transform to data frame
(my_df <- as.data.frame(my_list))

# back to list
as.list(my_df)


## ---- subset function --------------------------------------------------------
# get the height and weight of all persons with a height smaller than 1.8
subset(x = df, subset = (Height < 1.80), select = c("Height", "Weight"))

# same result as above (not shown)
subset(x = df, subset = (Height < 1.80), select = c(Height, Weight))

# remove Height column
subset(x = df, subset = (Height < 1.80), select = -Height)

# select columns from ... to
subset(x = df, subset = (Height < 1.80), select = Height:Weight)


## ---- view available data sets -----------------------------------------------
# view data sets (output not shown)
data()


## ---- airquality data set ----------------------------------------------------
# obtain additional information on e.g. the airquality data set
# output not shown
help(airquality)

# view data sets in package car
data(package = "car")


## ---- women data set ---------------------------------------------------------
# number of observations and variables, data type
dim(women)
class(women)

# first/last rows with head/tail
head(women, n = 4)
tail(women, n = 4)

# headTail combines both, needs package psych
require(psych)
headTail(women)

# load package
require(MESS)

# first 3 and last 2 rows (default is 6/6)
ht(women, n = 3, m = 2)

# load package first!
require(dplyr)
glimpse(women)

# extract height, weight + transform
h_m <- women$height * 2.54/100
w_kg <- women$weight * 0.454

# create new df + calculate BMI
women2 <- data.frame(height_m = h_m,
                     weight_kg = w_kg,
                     BMI = w_kg/h_m^2)

# some results
head(women2, n = 4)


# transform function -----------------------------------------------------------
women_transformed <- transform(women,
                               height_m = height * 2.54/100,
                               weight_kg = weight * 0.454,
                               BMI = weight * 0.454/(height * 2.54/100)^2)

# result
head(women_transformed)

women_transformed <- within(women, {
  height_m <- height * 2.54/100
  weight_kg <- weight * 0.454
  BMI <- weight_kg/height_m^2
  # remove original variables from data frame
  rm(height, weight)
})

# resulting data frame
head(women_transformed)

# a quick look at the qirquality data set 
headTail(airquality)

# number of missing values
sum(is.na(airquality))

# summary
summary(airquality)


# by function 
# only means for first 4 columns, na.rm for numeric results
by(data = airquality[, 1:4], INDICES = airquality$Month,
   FUN = colMeans, na.rm = TRUE)


# aggregate function
# note that here "mean" instead of colMeans is required
aggregate(x = airquality[, 1:4], by = list(Month = airquality$Month),
          FUN = mean, na.rm = TRUE)


## ---- search path and objects ------------------------------------------------
# the so-called search path
search()

# objects currently in workspace
ls()

# object a and aa
a
aa


## ---- attaching and detaching ------------------------------------------------
attach(women)
search()
rm(height)

# objects in women data frame
ls(pos = 2)

# now do some calculations
h_m <- height * 2.54/100
w_kg <- weight * 0.454
BMI <- w_kg/h_m^2
women2 <- data.frame(height_m = h_m, weight_kg = w_kg,
                     BMI = BMI)

# remove the data frame from search path
detach(women)

# split the df (also works with vectors or matrices)
split_air <- split(x = airquality, f = airquality$Month)

# structure
str(split_air, max.level = 1)

# reverse (usually some computation is performed before this)
original_df <- unsplit(split_air, f = airquality$Month)
head(original_df)

# airquality data set
nrow(airquality)

# NAs in Ozone and Solar.R columns
apply(is.na(airquality), 2, sum)

# we remove NA rows
airquality_na <- na.omit(airquality)
nrow(airquality_na)

# look at attribute
attributes(airquality_na)


## ---- complete cases ---------------------------------------------------------
# two sample vectors
vec1 <- c(NA, 2,  4, 6, NA)
vec2 <- c( 1, 2, NA, 9, NA)

# complete.cases
complete.cases(vec1)
complete.cases(vec1, vec2)

complete.cases(airquality)


## ---- rbind matrices ---------------------------------------------------------
df_A <- matrix(data = c(1.72, 1.65, 1.85, 70, 59, 80), ncol = 2,
               dimnames = list(name = c("Stefan", "Anna", "Fritz"),
                               data = c("Height", "Weight")))
df_A <- as.data.frame(df_A)

# first Height, then Weight
df_A

df_B <- matrix(data = c(72, 93, 66, 1.65, 1.88, 1.70), ncol = 2,
               dimnames = list(name = c("Karl", "Michael", "Johannes"),
                               data = c("Weight", "Height")))
df_B <- as.data.frame(df_B)

# other way round
df_B

# combine -> columns in B are reordered
rbind(df_A, df_B)

# create a small data frame
DF <- data.frame(name = c("Vienna", "Lower Austria", "Upper Austria"),
                 area = c(414.87, 19186.27, 11979.91),
                 pop  = c(1897491, 1677542, 1482095),
                 stringsAsFactors = FALSE)
DF

# take the df and add a row
DF2 <- rbind(DF,
             c("Burgenland", 3961.8, 293433))

# structure of the resulting df
str(DF2)

# first make a df ...
DF3 <- data.frame(name = "Burgenland",
                  area = 3961.8,
                  pop  = 293433)

# ... bind to original df
DF_fin <- rbind(DF, DF3)
str(DF_fin)


## ---- tibbles ----------------------------------------------------------------
# install first if necessary
require(tibble)

# install a data package -> olives data set
require(classifly)

# print olives data set (n = 572)
olives

# convert to tibble
olives <- as_tibble(olives)
olives

# sequential evaluation, try this with data.frame()
tib1 <- tibble(a = 1:7,
               '9 b' = rnorm(7),
               c = 1,
               d = LETTERS[1:7],
               e = a^2 - c)
# print
tib1

# use columns x to create column y
tibble(x = 1:3,
       y = 2 * x)

# this works ...
tibble(x = 1:3, y = 10)

# ...but this doesn't
tibble(x = 1:3, y = c(10, 20))


## ---- tribbles ---------------------------------------------------------------
# note the formula notation for the column names
tribble(~x, ~y, ~z,
        "a", 2, 3.6,
        "b", 1, 8.5)


## ---- mtcars data set, filter and select -------------------------------------
# convert mtcars to tibble, keep rownames
mtcars <- as_tibble(mtcars, rownames = NA)

(mtcars <- rownames_to_column(mtcars, var = "rowname"))

# get all 6 cylinder cars
filter(mtcars, cyl == 6)

# get all cars with 6 cylinders, manual transmission and 4 forward gears
filter(mtcars, cyl == 6, am == 1, gear == 4)

# increasing cylinders, decreasing horsepower
arrange(mtcars, cyl, desc(hp))

# only keep mpg and hp columns
select(mtcars, mpg, hp)

# only variables which names are ending with "p"
select(mtcars, ends_with("p", ignore.case = TRUE))

# variables between wt and am
select(mtcars, wt:am)

# all variables BUT those between wt and am
select(mtcars, -(wt:am))

# everything() function
select(mtcars, cyl, disp, everything())

# keep all variables, but these two with modified names
rename(mtcars, Weight = wt, Horsepower = hp)

# result has 3 columns, 2 have new names
sel_mtcars <- select(mtcars, disp, Weight = wt, Horsepower = hp)


## ---- mutate function --------------------------------------------------------
# power weight ratio
mutate(mtcars, pwr = hp * 0.7355 / (wt * 0.4536))

# power weight ratio in 2 Units (kW and W)
mutate(mtcars, pwr = hp * 0.7355 / (wt * 0.4536), pwr_W = pwr * 1000)


## ---- summarise function -----------------------------------------------------
# returns a tibble with a single row and column
summarise(mtcars, mean_wt = mean(wt, na.rm = TRUE))

# build groups of data
cars_by_cyl <- group_by(mtcars, cyl)

# average fuel consumption BY GROUP
summarise(cars_by_cyl,
          mean_mpg = mean(mpg, na.rm = TRUE))


## ---- group by ---------------------------------------------------------------
# build groups of data
cars_by_cyl <- group_by(mtcars, cyl)

# how many cars BY GROUP
summarise(cars_by_cyl, no_of_cars = n())

# ggplot2 for plotting
require(ggplot2)

# only 4- and 8-cylinder cars
mtcars_48 <- filter(mtcars, cyl %in% c(4, 8))

# group by cylinders
cars_cyl <- group_by(mtcars_48, cyl)

# plot
ggplot(data = cars_cyl, aes(x = wt, y = mpg, color = as.factor(cyl))) +
  geom_point() +
  geom_smooth(method = "gam", se = TRUE)


## ---- pipes ------------------------------------------------------------------
# output is the same as before, not shown
result <- mtcars %>%
  filter(cyl %in% c(4, 8)) %>%
  group_by(cyl) %>%
  ggplot(aes(x = wt, y = mpg, color = as.factor(cyl))) +
  geom_point() +
  geom_smooth(method = "gam", se = TRUE)


# group count
mtcars %>%
  group_by(cyl) %>%
  summarize(highest_hp = first(hp, order_by = hp),
            lowest_hp  = last(hp, order_by = hp))


## ---- pipe null --------------------------------------------------------------
par(cex.main = 1.3, cex.lab = 1.2, cex.axis = 1.2)
# result = NULL, not dim of the tibble
mtcars %>%
  select(wt, mpg) %>%
  plot(pch = 19) %>%
  dim()
par(cex.main = 1.2, cex.lab = 1, cex.axis = 1)


## ---- pipe not null ----------------------------------------------------------
par(cex.main = 1.3, cex.lab = 1.2, cex.axis = 1.2)
# tee-pipe
mtcars %>%
  select(wt, mpg) %T>%
  plot(pch = 19) %>%
  dim()
par(cex.main = 1.2, cex.lab = 1, cex.axis = 1)


## ---- tibble for correlation -------------------------------------------------
require(magrittr)
mtcars %$%
  cor(hp, mpg)

# only keep 2 variables, overwrite mtcars
mtcars <- mtcars %>%
  select(hp, mpg)

# only keep 2 variables, overwrite mtcars
mtcars %<>%
  select(hp, mpg)
dim(mtcars)

rnorm(100) %>%
  matrix(ncol = 5) %>%
  apply(2, mean)

# create a matrix with random entries with random number of columns
sample(2:5) %>%
  matrix(rnorm(prod(2:5)), ncol = .) %>%
  apply(2, mean)

# as expected
1:100 %>%
  mean()

# with placeholder
1:100 %>%
  mean(.)

# without parantheses
1:100 %>%
  mean


# ---- data tables -------------------------------------------------------------
# load data.table package (must be installed first)
require(data.table)


## ---- make a small data table ------------------------------------------------
(firstDT <- data.table(A = 1:4,
                       B = c("a", "k", "l", "p"),
                       C = c(TRUE, FALSE)))


## ---- cars_as_data_tables, echo = -c(1)------------------------------
mtcars <- datasets::mtcars

# data frame --> data table
carsDT <- as.data.table(mtcars, keep.rownames = TRUE)
head(carsDT)

class(carsDT)


## ---- print data taböes ------------------------------------------------------
options("datatable.print.nrows")


## ---- select rows ------------------------------------------------------------
# select first two rows
carsDT[1:2, ]

# but also this works (also with data frames?)
carsDT[1:2]

# select first two rows by not selecting all others
carsDT[-(3:32), ]

# also exclamation mark works
carsDT[!(3:32), ]

# with logical vector -- high hp cars
carsDT[hp > 250, ]

# last row
carsDT[.N]

# last 3 rows
carsDT[(.N-2):(.N)]


## ---- sorting rows -----------------------------------------------------------
# sorting the rows
carsDT_sorted <- carsDT[order(gear, -wt)]
head(carsDT_sorted)


## ---- load flights data set --------------------------------------------------
# import the csv file
flights <- read.table("flights.csv", sep = ",", header = TRUE)

# quite many rows
dim(flights)

# columns
names(flights)

system.time(nrow(flights[flights$SCHEDULED_TIME == 180, ]))

# transform to a data table
flights <- as.data.table(flights)

# what is the class
class(flights)

# are there indices
indices(flights)

# see attributes
names(attributes(flights))

# we could take any other column in j as well
system.time(flights[SCHEDULED_TIME == 180, length(YEAR)])

# index?
indices(flights)

# attributes
names(attributes(flights))

system.time(flights[SCHEDULED_TIME == 180, length(YEAR)])

# use column AIR_TIME as index
setindex(flights, AIR_TIME)

# %like%
head(flights[AIRLINE %like% "A$" &
               ORIGIN_AIRPORT %like% "A$" &
               DESTINATION_AIRPORT %like% "A$",
             .(AIRLINE, ORIGIN_AIRPORT, DESTINATION_AIRPORT)])

# are there flights with distance and AIR_TIME in certain ranges?
nrow(flights[DISTANCE %between% c(1000, 1500) & AIR_TIME %between% c(60, 120)])


flights$ORIGIN_AIRPORT <- as.character(flights$ORIGIN_AIRPORT)

# are there flights starting from Vienna, Berlin Schoenefeld or Rome?
nrow(flights[ORIGIN_AIRPORT %chin% c("VIE", "SXF", "FCO")])


## ---- select data table colum ------------------------------------------------
# select column wt
carsDT_wt1 <- carsDT[, hp]
head(carsDT_wt1)

# second possibility
carsDT_wt2 <- carsDT[, list(hp)]
head(carsDT_wt2)

# third possibility
carsDT_wt3 <- carsDT[, .(hp)]
head(carsDT_wt3)


## ---- select more than one column --------------------------------------------
# get hp and weight columns
carsDT_2 <- carsDT[, .(hp, wt)]
head(carsDT_2, n = 4)

# get hp and weight columns
carsDT_2 <- carsDT[, c("hp", "wt")]
head(carsDT_2, n = 4)

# get only the hp column - still a data table
class(carsDT[, "hp"])

# get only the hp column - a vector
class(mtcars[, "hp"])

# vector with column names of interest
names_vec <- c("hp", "wt")

# get these columns from the data table
head(carsDT[, ..names_vec])

# still the same vector
names_vec <- c("hp", "wt")

# get these columns from the data table
head(carsDT[, names_vec, with = FALSE])


## ---- demo of the with function ----------------------------------------------
# note that no iris$... is needed.
with(iris, mean(Sepal.Width))


## ---- exclude columns --------------------------------------------------------
# select all columns between hp and wt
head(carsDT[, hp:wt], n = 3)

# select all but the hp and wt columns
head(carsDT[, !c("hp", "wt")], n = 3)

# other possibility
head(carsDT[, -c("hp", "wt")], n = 3)

# get hp and weight columns
carsDT_3 <- carsDT[, .(horsepower = hp, weight = wt)]
head(carsDT_3, n = 4)

# first weight, then horsepower
setcolorder(carsDT_3, c("weight", "horsepower"))

# first weight, then horsepower
setnames(carsDT_3, c("Weight", "Horsepower"))


## ---- computations with data tables ------------------------------------------
# keep car names, calculate ratio of hp and weight
head(carsDT[, .(Name = rn, PW_ratio = hp / wt)])

# keep car names, calculate ratio of hp and weight
head(carsDT[cyl == 8, .(Name = rn, PW_ratio = hp / wt)])

# summary statistics
carsDT[, .(av_mpg = mean(mpg), min_time = min(qsec))]

# summary statistics by group
carsDT[, .(av_mpg = mean(mpg)), by = .(cyl)]

carsDT[, mean(mpg), by = cyl]

head(carsDT, n = 5)

# weight given in 1000 lbs
carsDT[, .(Count = .N), by = .(Weight_class = round(wt))]

# two separate calculations (result not shown)
intermed <- carsDT[, .(Count = .N), by = .(Weight_class = round(wt))]
intermed[order(Weight_class), ]

# two separate calculations
carsDT[, .(Count = .N), by = .(Weight_class = round(wt))][order(Weight_class), ]

# two separate calculations
carsDT[, .(Count = .N), keyby = .(Weight_class = round(wt))]


## ---- two by-variables -------------------------------------------------------
carsDT[,.(mean_mpg = mean(mpg)) , by = .(Engine = vs, Transmission = am)]

carsDT[,.(mean_mpg = mean(mpg)) , by = c("vs", "am")]


## ---- mean of columns --------------------------------------------------------
# eventually sorted by no. of cylinders
carsDT[, .(mean_mpg = mean(mpg),
           mean_hp = mean(hp),
           mean_wt = mean(wt)), keyby = .(cyl)]

# usage of .SD; remove rowname column first
carsDT[, !"rn"][, lapply(.SD, mean), by = .(cyl)]

# usage of .SD; remove rowname column first
carsDT[, lapply(.SD, mean), by = .(cyl), .SDcols = 2:12]

# usage of .SD; remove rowname column first
carsDT[, head(.SD, n = 2), by = .(cyl), .SDcols = c("mpg", "wt")]


## ---- modify_and_delete ------------------------------------------------------
# miles/gallon -> km/gallon -> km/l -> l/100 km
carsDT5 <- carsDT[, lphkm := 100 / (1.609 * mpg / 3.78541)]
head(carsDT5, 4)

# displacement (cu.in) -> cm^3 and wt (1000 lbs) -> kg
carsDT6 <- carsDT5[, c("disp_cm3", "wt_kg", "disp", "wt") :=
                     .(disp * 2.54^3, wt * 453.6, NULL, NULL)]
head(carsDT6, 4)

# show attributes
attributes(mtcars)

# use for subsetting
mtcars["Merc 450SL", ]

# there is no need to assign the object back to carsDT
setkey(carsDT, cyl)

# Name "cyl" as character
setkeyv(carsDT, "cyl")

# list attributes
attributes(carsDT)

# get key column
key(carsDT)

# only show a few of the 8 cylinder cars
head(carsDT[.(8)], n = 4)

# first and last 8 cylinder car
carsDT[.(8), mult = "first"]
carsDT[.(8), mult = "last"]

# 6 and 8 cylinder cars
head(carsDT[.(c(6, 8))], n = 10)

# define key consisting of 2 variables
setkey(carsDT, cyl, am)

# show all cars with 8 cylinders and manual transmission
carsDT[.(8, 1)]

# only use first key, e.g. all 8 cylinder cars
head(carsDT[.(8)], n = 3)

# only use first key, e.g. all 8 cylinder cars
head(carsDT[.(unique(cyl), 1)], n = 3)

# set a two-colum key
setkey(carsDT, cyl, hp)

# 6 cylinders, 110 horsepower
carsDT[.(6, 110)]

# 6 cylinders, 108 horsepower
carsDT[.(6, 108)]

# 6 cylinders, 108 horsepower -> empty data table
carsDT[.(6, 108), nomatch = 0]

aq <- airquality
aq$Month <- factor(aq$Month, levels = 5:9, labels = c("May", "June", "July", "August", "September"))
aq$Day <- as.numeric(aq$Day)
airquality2 <- aq

# transform to data table
airqualityDT <- as.data.table(airquality2)

# set Month and Day as 2-column key
setkey(airqualityDT, Month, Day)

# a few rows
head(airqualityDT)


## ---- roll_join --------------------------------------------------------------
airqualityDT[.("May", 2)]

airqualityDT[.("May", 3.7)]

airqualityDT[.("May", 3.7), roll = TRUE]

airqualityDT[.("May", 3.7), roll = "nearest"]

airqualityDT[.("May", 3.7), roll = 0.5]

airqualityDT[.("May", 3.7), roll = 0.8]

airqualityDT[.("May", 3.7), roll = -0.2]

airqualityDT[.("May", 3.7), roll = -0.4]

airqualityDT[.("May", 33), roll = TRUE]

airqualityDT[.("May", 33), roll = TRUE, rollends = FALSE]


## ---- skewness_demo ----------------------------------------------------------
par(mfrow = c(1, 3))
x1 <- seq(from = -4, to = +4, by = 0.01)
x2 <- seq(from = 0, to = +4, by = 0.01)
x3 <- seq(from = 0, to = 20, by = 1)

f_density <- function(x, df1, df2) {
  return(df(x, df1 = df1, df2 = df2))
}

plot(x = x1, y = dnorm(x1), col = "red",
     main = "Symmetric - v(X) = 0", xlab = "", ylab = "", type = "l", lwd = 3, xaxt = "n",
     yaxt = "n", cex.main = 3, bty = "n")

plot(x2, f_density(x2, df1 = 20, df2 = 20), col = "red", xlab = "", ylab = "",
     type = "l", lwd = 3, xaxt = "n", yaxt = "n", bty = "n", main = "Rightskewed - v(X) > 0",
     cex.main = 3)

plot(x3, dbinom(x3, size = 20, prob = 0.9), col = "red", type = "h", lwd = 3, xlab = "",
     ylab = "", bty = "n", xaxt = "n", yaxt = "n", cex.main = 3, main = "Leftskewed - v(X) < 0")

par(mfrow = c(1, 1))


## ---- kurtosis_demo ----------------------------------------------------------
require(jmuOutlier)
par(mfrow = c(1, 3))
x1 <- seq(from = -4, to = +4, by = 0.01)
x2 <- seq(from = 0, to = +4, by = 0.01)
x3 <- seq(from = -4, to = +4, by = 0.01)

f_density <- function(x, df1, df2) {
  return(df(x, df1 = df1, df2 = df2))
}

plot(x = x1, y = dnorm(x1), col = "red",
     main = "Kurtosis w(X) = 3", xlab = "", ylab = "", type = "l", lwd = 3, xaxt = "n",
     yaxt = "n", cex.main = 3, bty = "n")
abline(h = 0, col = "lightgrey", lwd = 2)

plot(x2, dunif(x2, min = 0, max = 4), col = "red", xlab = "", ylab = "",
     type = "l", lwd = 3, xaxt = "n", yaxt = "n", bty = "n", main = "Kurtosis w(X) < 3",
     cex.main = 3, ylim = c(0, 0.3))
segments(x0 = 0, x1 = 0, y0 = 0, y1 = 1/4, col = "red", lty = "dashed", lwd = 1)
segments(x0 = 4, x1 = 4, y0 = 0, y1 = 1/4, col = "red", lty = "dashed", lwd = 1)
abline(h = 0, col = "lightgrey", lwd = 2)

plot(x3, dlaplace(x3, mean = 0, sd = 1), col = "red", type = "l", lwd = 3, xlab = "",
     ylab = "", bty = "n", xaxt = "n", yaxt = "n", cex.main = 3, main = "Kurtosis w(X) > 3")
abline(h = 0, col = "lightgrey", lwd = 2)

par(mfrow = c(1,1))

# alternative: library(e1071)
require(e1071)


## ---- skewness and kurtosis --------------------------------------------------
# first create a sample from a N(0;1)
set.seed(123)
x <- rnorm(n = 100, mean = 0, sd = 1)

# skewness of various types (default: type = 3)
# we would expect a value around 0
skewness(x, type = 1)
skewness(x, type = 2)
skewness(x, type = 3)

# example for kurtosis
kurtosis(x)


## ---- install_packages1 ------------------------------------------------------
# download and install package e1071
install.packages(pkgs = "e1071", dependencies = TRUE)

# install binary Windows version
install.packages(pkgs = "D:/Boku/e1071_1.6-7.zip", repos = NULL)

require(e1071) # alternative: library(e1071)


## ---- bioconductor packages ---------------------------------------------------
# BiocManager provides e.g. install() and available() functions
install.packages("BiocManager")

# show available packages
avail <- BiocManager::available()
length(avail)
head(avail)

BiocManager::install(c("a4", "a4Base"))


## ---- install github packages ------------------------------------------------
# provides installation function
require(devtools)

# repo = main argument
install_github(repo = "ririzarr/rafalib", dependencies = TRUE)

# packages alr3 and chemometrics are installed
(ret_require <- require(alr3))
(ret_library <- library(chemometrics))


# package ACD is not installed
(ret_require2 <- require(ACD))

(ret_library2 <- library(ACD))

library(help = "alr3")


## ---- package version --------------------------------------------------------
# get package version
packageVersion("DT")


## ---- update_packages --------------------------------------------------------
# see outdated packages; remove 2 columns
list_old <- old.packages(repos = "https://cran.wu.ac.at/")
head(list_old[, -c(2, 6)])

# update 3 packages at once
update.packages(c("DT", "FactoMineR"))

# package sessioninfo must be installed
require(sessioninfo)
session_info()


## ---- install new version of R -----------------------------------------------
install.packages("installr")
require(installr)

# is there a newer version of R?
check.for.updates.R()

install.R()

copy.packages.between.libraries()

# show R version
version

require(gtools)
checkRVersion()


## ---- list and remove available objects --------------------------------------
# list objects in memory
objects()[1:70] # alternative: ls()

# remove object A
rm(A)

# list first 10 objects again -> object A was removed
objects()[1:10]

# BMI should exist
exists("BMI")

# should not exist
exists("abc")


## ---- save_variable_RData ----------------------------------------------------
# save object Age with extension .RData
save(Age, file = "Age.RData")

# save object Age with extension .RDS
saveRDS(Age, file = "Age.RDS")

# the same with .RDS files and saveRDS()
save(Age, file = "XYZ.RData")

save(iris, airquality, Age, file = "my_data_objects.RData")


## ---- save entire workspace --------------------------------------------------
# save entire workspace
save.image(file = "my_current_workspace.RData")

# before: save(Age, file = "Age.RData")
load("Age.RData")

# before: save(Age, file = "XYZ.RData")
load("XYZ.RData")

# before: save(Age, file = "Age.RData")
a <- load("Age.RData")

xyz <- readRDS("Age.RDS")


## ---- read.table() and write.table() functions -------------------------------
# file contains a header
data_table <- read.table(file = "data_table.txt",
                         header = TRUE, dec = ".")
data_table
dim(data_table)
# first column is taken as rownames if no entry in position (1,1)

# first argument = R object name, second argument = filename
write.table(data_table, file = "dat_table.txt")


## ---- read.csv() and write.csv() functions -----------------------------------
# row.names ... column number which contains the row names
table_2 <- read.csv2(file = "data_table.csv", header = TRUE,
                     row.names = 1)
table_2

write.csv(table_2, file = "dat_table.csv", row.names = FALSE)


## ---- compression ------------------------------------------------------------
# criting a compressed file
write.csv(table_2, file = bzfile("dat_table.csv", compression = 7),
          row.names = FALSE)

# load data file from internet
AUS_weather <- read.table(file = "http://rattle.togaware.com/weatherAUS.csv",
                          header = TRUE, sep = ",")

# load package (must be installed)
require(readr)

# read.csv in utils package
read.csv("file_name.csv", stringsAsFactors = FALSE)

# read_csv in readr package
read_csv("file_name.csv")

# data table package fread()
require(data.table)

# read.table (utils)
system.time(readtable_time <- read.table("FTIR.csv", header = TRUE,
                                         row.names = NULL, sep = ";",
                                         stringsAsFactors = FALSE))

# read_csv2 (readr)
system.time(readcsv_time <- read_csv2("FTIR.csv", col_types = cols()))

# fread (data.table)
system.time(fread_time <- fread("FTIR.csv"))


## ---- write test -------------------------------------------------------------
# compress with gzfile
write_csv(x = readcsv_time, file = gzfile("FTIR_compressed.csv.gz",
                                          compression = 9))

# compress with bzfile
write_csv(x = readcsv_time, file = bzfile("FTIR_compressed.csv.bz",
                                          compression = 9))

# compress with xzfile
write_csv(x = readcsv_time, file = xzfile("FTIR_compressed.csv.xz",
                                          compression = 9))


## ---- readxl package install -------------------------------------------------
# install, if necessary, load package
require(readxl)


## ---- list Excel_files -------------------------------------------------------
# list all Excel files in the working directory
list.files(pattern = "xlsx$")

# list the names of the sheets
excel_sheets("Population_Austria.xlsx")

# readxl()
read_excel("Population_Austria.xlsx", sheet = "Year_1981")

# import all sheets at once
excel_file <- lapply(excel_sheets("Population_Austria.xlsx"),
                     read_xlsx,
                     path = "Population_Austria.xlsx")
str(excel_file, max.level = 1)

# we load the package and import our population Excel file
require(XLConnect)
excel_book <- loadWorkbook(filename = "Population_Austria.xlsx")
sheets <- getSheets(excel_book)

readWorksheet(excel_book, sheet = "Year_2001",
              startRow = 1, endRow = 4, header = TRUE)

# result is a list of our data frames
all_sheets <- lapply(sheets, readWorksheet, object = excel_book)

excel_book <- loadWorkbook(filename = "Population_Austria.xlsx")
sheets <- getSheets(excel_book)

# add a sheet 
createSheet(excel_book, name = "Summary")
sheets <- getSheets(excel_book)


## ---- get the data -----------------------------------------------------------
# list with data frames
all_sheets <- lapply(sheets[-length(sheets)], readWorksheet,
                     object = excel_book)


## ---- reduce the data --------------------------------------------------------
# cbind the population columns, get mean
mean_pop <- apply(data.frame(lapply(all_sheets,
                                    "[[", "Bevoelkerung")), 1, mean)


## ---- summary_df-----------------------------------------------------
# keep country columns
df <- data.frame(all_sheets[[1]][, 1:2], Bevoelkerung = mean_pop)

# write df
writeWorksheet(excel_book, data = df, sheet = "Summary")

# save_wb (with new name)
saveWorkbook(excel_book, "Summary.xlsx")

# rename a sheet
renameSheet(excel_book, sheet = "Summary",
            newName = "Zusammenfassung")

# get the sheets
getSheets(excel_book)

# save the Workbook
saveWorkbook(excel_book, "Zusammenfassung.xlsx")

# remove the yearly data
removeSheet(excel_book, sheet = getSheets(excel_book)[1:5])

# current sheets
getSheets(excel_book)

# save the Excel file
saveWorkbook(excel_book, "Result.xlsx")

# package must be installed
require(haven)


## ---- import SAS files -------------------------------------------------------
# read SAS data file [data from SAS]
sales_data_sas <- read_sas("sales.sas7bdat")

# structure
str(sales_data_sas)


## ---- import STATA files -----------------------------------------------------
# read a STATA file
trade_data_stata <- read_stata("trade.dta")

# structure
str(trade_data_stata)

# convert 
trade_data_stata$Date <- as.Date(as_factor(trade_data_stata$Date))

trade_data_stata$Date

as_factor(trade_data_stata$Date)

as.Date(as_factor(trade_data_stata$Date))


## ---- read SPSS files --------------------------------------------------------
# read a SPSS .sav or .por file (automatically chosen)
int_data_spss <- read_spss("temprate.sav")

# have a short look
glimpse(int_data_spss)


## ---- source a .R file -------------------------------------------------------
# source the script from the working dir
source("geometric_mean.R")

# list objects
ls()[1:20]

# test the function
set.seed(123)
geo_mean(x = abs(rnorm(5)))


## ---- function call ----------------------------------------------------------
# function matrix(), input = data vector, no. of columns
matrix(data = c(1, 5, 8, -1, 4, 0), ncol = 2)

# formal arguments
formalArgs(matrix)

# don't forget the parentheses
matrix()

# all arguments named
matrix(data = 1:4, nrow = 2, ncol = 2, byrow = TRUE,
       dimnames = list(c("A", "B"), c("X", "Y")))

# different order of named arguments
matrix(dimnames = list(c("A", "B"), c("X", "Y")), data = 1:4,
       byrow = TRUE, ncol = 2, nrow = 2)

# first "data", then "nrow", "ncol", "byrow", last "dimnames"
matrix(1:4, 2, 2, TRUE, list(c("A", "B"), c("X", "Y")))

# wrong order, no names
matrix(2, 2, 1:4, list(c("A", "B"), c("X", "Y")), TRUE)

# this is not really necessary
mean(x = 1:10)

# sufficient
mean(1:10)

# name rarely used arguments
mean(1:10, trim = 0.1)

# partial matching: named argument "da" instead of "data" works
matrix(da = 1:4, nrow = 2, ncol = 2, byrow = TRUE,
       dimnames = list(c("A", "B"), c("X", "Y")))

# "d" does not work due to ambuguity (data, dimnames)
matrix(d = 1:4, nrow = 2, ncol = 2, byrow = TRUE,
       list(c("A", "B"), c("X", "Y")))


## ---- match order ------------------------------------------------------------
# first matching "byrow" (named argument)
# nc is a valid abbreviation for "ncol"
# remaining 3 arguments are matched in order:
# 1:4 with "data", 2 with "nrow" and the list with "dimnames"
matrix(1:4, 2, nc = 2, byrow = TRUE,
       list(c("A", "B"), c("X", "Y")))

matrix(b = TRUE, 1:4, list(c("A", "B"), c("X", "Y")),
       nc = 2, nro = 2)


## ---- hello_world function in R ----------------------------------------------
# we create a function
hello_world <- function() {
  print("Hello World")
}

hello_world <- function() print("Hello World")

# we call our function with no arguments
hello_world()

# function name without brackets/arguments shows code
hello_world

# source an existing function in working directory
source("hello_world.R")

# from now on R knows your function and you can use it
hello_world()


## ---- structure --------------------------------------------------------------
function_name <- function(arg1, arg2, ...) {
  
  # ... [what comes here is the 'BODY' of the function] ...
  #
  # take the arguments and do something
  #
  # eventually some side effects (plots, text on screen, ...)
  #
  # return something, e.g. the result(s) from more or less
  # complex calculations or (if side effect is sufficient)
  # simply NULL.
}


## ---- data and detail arguments ----------------------------------------------
# a 'data' argument x
mean(1:10)

# a 'detail' argument na.rm
mean(c(3, 4, NA, 7), na.rm = TRUE)

# slightly biased coin
sample(c("head", "tail"), size = 1, prob = c(0.6, 0.4))

# lotto function with 1 argument x (= our numbers)
lotto <- function(x) {
  
  # draw 6 numbers randomly
  numbers <- sample(x = 1:45, size = 6, replace = FALSE)
  
  # how many correct guesses
  correct <- sum(x %in% numbers)
  
  # return these 2 objects in one list
  return(list(guess = correct, numbers = sort(numbers)))
}

# involves randomness -> do not forget to set the seed
set.seed(123)

# let's try some numbers
lotto(x = c(4, 16, 21, 30, 36, 44))

# not really lucky

# Lotto
lotto <- function(x) {
  
  # x ... draw 6 numbers randomly
  numbers <- sample(x = 1:45, size = 6, replace = FALSE)
  
  # how many correct guesses
  correct <- sum(x %in% numbers)
  
  # return list invisibly
  return(invisible(list(guess = correct, numbers = sort(numbers))))
}

# let's try another seed ...
set.seed(345)

# ... but the same numbers
lotto(x = c(3, 14, 29, 31, 33, 44))

# we set the seed
set.seed(345)

# returned object (a list with 2 elements) stored in
# variable "lotto_results"
lotto_results <- lotto(x = c(3, 14, 29, 31, 33, 44))

# type of output
class(lotto_results)

# output
lotto_results


## ---- if and if else ---------------------------------------------------------
if (condition) {
  # do something
}


if (condition) {
  # do something
} else {
  # do something different
}


# add additional argument print.out with default FALSE
lotto <- function(x, print.out = FALSE) {
  # n...number of games, x...our numbers
  # draw 6 numbers randomly
  numbers <- sample(x = 1:45, size = 6, replace = FALSE)
  
  # how many correct guesses
  correct <- sum(x %in% numbers)
  
  # text output only if print.out == TRUE
  if (print.out == TRUE) {
    cat("You have", correct, "correct guess(es).", sep = " ")
  }
  
  # return 2 objects in a list
  return(invisible(list(guess = correct, numbers = sort(numbers))))
}


## ---- lotto_new --------------------------------------------------------------
lotto <- function(x, print.out = FALSE) {
  ...
  # text output only if print.out is TRUE
  if (print.out == TRUE) {
    cat("You have", correct, "correct guess(es).", sep = " ")
  }
  ...
}


## ---- lotto_test -------------------------------------------------------------
# we set the seed ...
set.seed(345)

# ... and change default value of print.out
result <- lotto(x = c(3, 14, 29, 31, 33, 44), print.out = TRUE)


# check input
if (length(x) == 6) {
  # proceed as usual
} else {
  stop("The supplied vector x has the wrong length.")
}


## final function --------------------------------------------------------------
lotto <- function(x, print.out = FALSE) {
  if (length(x) == 6) {
    # n...number of games, x...our numbers
    # draw 6 numbers randomly
    numbers <- sample(x = 1:45, size = 6, replace = FALSE)
    
    # how many correct guesses
    correct <- sum(x %in% numbers)
    
    # text output only if print.out is TRUE
    if (print.out) {
      cat("\n You have", correct, "correct guess(es),\n", sep = " ")
    }
    
    # return 2 objects in a list
    return(invisible(list(guess = correct, numbers = sort(numbers))))
  }
  else {
    stop("The supplied vector x has the wrong length.")
  }
}


## ---- check function ---------------------------------------------------------
# a seed ...
set.seed(123)

# ... and a wrong vector x
lotto(x = c(3, 22, 33, 39))


## ---- source new function ----------------------------------------------------
lotto <- function(x, print.out = FALSE) {
  
  # if x has correct length
  if (length(x) == 6) {
    
    # x...our numbers, draw 6 numbers randomly
    numbers <- sample(x = 1:45, size = 6, replace = FALSE)
    
    # how many correct guesses
    correct <- sum(x %in% numbers)
    
    # text output only if print.out is TRUE
    if (print.out) {
      cat("\n You have", correct, "correct guess(es).\n", sep = " ")
    }
    
    # return 2 objects as items of a list
    return(invisible(list(guess = correct, numbers = sort(numbers))))
  } else {
    stop("The supplied vector x has the wrong length.")
  }
}


## ---- else_part1 -------------------------------------------------------------
# good
if (condition) {
  
} else {
  
}


## ---- if_elseif_else-------------------------------------------------
x <- -1

if (x > 0) {
  print("positive")
} else if (x == 0) {
  print("zero")
} else {
  print("negative")
}

x <- 0

if (x > 0) {
  print("positive")
} else if (x == 0) {
  print("zero")
} else {
  print("negative")
}

x <- 1

if (x > 0) {
  print("positive")
} else if (x == 0) {
  print("zero")
} else {
  print("negative")
}


if (condition) {
  # do something
} else {
  # do something different
}
...

# x ... integer vector
x <- c(2, 5, 3, 9, NA, 16, 4)

# odd or even integer?
ifelse(x %% 2 == 0, "even", "odd")


## ---- plot iris without color ------------------------------------------------
plot(x = iris$Sepal.Length,
     y = iris$Sepal.Width, pch = 19,
     xlab = "Sepal Length",
     ylab = "Sepal Width",
     main = "Iris Flowers")

# ifelse: if setosa -> blue, otherwise -> black
col_vector <- ifelse(iris$Species == "setosa", "blue", "black")

# plot, color given by our col_vector
plot(x = iris$Sepal.Length,
     y = iris$Sepal.Width, pch = 19,
     col = col_vector,
     main = "Iris Flowers + Color",
     xlab = "Sepal Length",
     ylab = "Sepal Width")

# nested ifelse
col_vector2 <- ifelse(iris$Species == "setosa", "blue",
                      ifelse(iris$Species == "versicolor", "red", "green"))


# plot, color given by our col_vector
plot(x = iris$Sepal.Length,
     y = iris$Sepal.Width, pch = 19,
     col = col_vector2,
     main = "Iris Flowers + Color II",
     xlab = "Sepal Length",
     ylab = "Sepal Width")


## switch function -------------------------------------------------------------
# first argument = integer
switch(3, A = 10, B = 13, C = 15)

# first argument = character
switch("B", A = 10, B = 13, C = 15)


# vectors x, y and type of distance measure (with default)
Dist <- function(x, y, type = "Euclidean") {
  
  diff_vec <- x - y
  
  if (type == "Euclidean") distance <- sqrt(sum(diff_vec^2))
  else if (type == "Manhattan") distance <- sum(abs(diff_vec))
  else distance <- sum(abs(diff_vec) / (abs(x) + abs(y)))
  
  return(distance)
}


# check Distance function ------------------------------------------------------
x <- c(2, 5)
y <- c(3, 2)
Dist(x = x, y = y, type = "Euclidean")
Dist(x = x, y = y, type = "Manhattan")
Dist(x = x, y = y, type = "Canberra")


## ---- define_dist_function2------------------------------------------
# Dist2() using switch
Dist2 <- function(x, y, type = "Euclidean") {
  
  diff_vec <- x - y
  
  switch(type,
         Euclidean = sqrt(sum(diff_vec^2)),
         Manhattan = sum(abs(diff_vec)),
         Canberra = sum(abs(diff_vec) / (abs(x) + abs(y))))
}


# check
Dist2(x = x, y = y, type = "Euclidean")
Dist2(x = x, y = y, type = "Manhattan")
Dist2(x = x, y = y, type = "Canberra")


# switch with more rows to evaluate --------------------------------------------
Dist3 <- function(x, y, type = "Euclidean") {
  
  diff_vec <- x - y
  
  switch(type,
         Euclidean = sqrt(sum(diff_vec^2)),
         Manhattan = sum(abs(diff_vec)),
         Canberra = {
           nominator <- abs(diff_vec)
           denominator <- abs(x) + abs(y)
           sum(nominator / denominator)
         })
}

# take 2 rows, only numeric columns
(df <- iris[c(1, 51, 101), 1:4])

# distance
dist(df, method = "euclidean")


## ---- multiple lotto games ---------------------------------------------------
mult_lotto <- function(n, x) {
  
  # prepare (initialize) objects for results
  correct_guesses <- numeric(length = n)
  drawn_numbers <- matrix(NA, nrow = n, ncol = 6)
  
  # repeat for n times
  for (i in 1:n) {
    
    # one Lotto game
    one_draw <- lotto(x = x, print.out = FALSE)
    
    # save single results in position/row i
    correct_guesses[i] <- one_draw$guess
    drawn_numbers[i, ] <- one_draw$numbers
  }
  
  # return results as list
  return(invisible(list(guess = correct_guesses,
                        numbers = drawn_numbers)))
}

# test
set.seed(299)
results <- mult_lotto(n = 1000, x = c(8, 12, 23, 29, 38, 42))

# table
table(results$guess)


# evaluate with barplot
barplot(table(results$guess), xlab = "Correct guesses",
        ylab = "Frequency", main = "1000 Lotto Games")


## ---- for structure, next and break ------------------------------------------
...
for (name in vector) {
  # do something
}
...

# print only the odd values of vector in a loop
for (i in 1:10) {
  
  # if i is even -> skip
  if (i %% 2 == 0) next
  
  # if i is odd -> print the value
  else cat("The current value of i is", i, "\n", sep = " ")
}

# print elements of vector, but to avoid long output, print max. 5 elements

# create vector of a-prori unknown length
set.seed(123)
vec <- sort(unique(sample(x = 1:100, size = 100, replace = TRUE)))

# set counter
ct <- 0
for (i in vec) {
  
  # increase counter by 1
  ct <- ct + 1
  cat("The current value of i is", i, "\n", sep = " ")
  
  if (ct == 5) break
}


## ---- startup messages -------------------------------------------------------
require(mboost)

suppressMessages(require(mboost))

# create very large matrix
set.seed(123)
M <- matrix(rnorm(9000000), ncol = 3000)

# -------------------------
# possibility 1: a for loop
# -------------------------

# vector results growing larger in every iteration
results <- c()
system.time(
  for (i in 1:ncol(M)) {
    results <- c(results, mean(M[, i]))
  }
)

# -------------------------------
# possibility 2: another for loop
# -------------------------------

# results vector initialized
results <- numeric(length = ncol(M))
system.time(
  for (i in 1:ncol(M)) {
    results[i] <- mean(M[, i])
  }
)

# ----------------------
# possibility 3: apply()
# ----------------------

# not faster, but shorter and much higher readability
system.time(apply(M, 2, mean))

# -------------------------
# possibility 4: colMeans()
# -------------------------

system.time(colMeans(M))


## ---- while structure --------------------------------------------------------
...
while (condition) {
  # do something
  # value of condition might/should change in this block
}
...


# Fibonacci --------------------------------------------------------------------
fib <- function(M) {
  
  # first two FN in vector
  fn <- c(1, 1)
  
  # condition: last value <= M
  while (fn[length(fn)] <= M) {
    
    # sum of last 2 FN
    sum_2 <- fn[length(fn) - 1] + fn[length(fn)]
    
    # append
    fn <- c(fn, sum_2)
  }
  
  # last value might exceed M, remove it
  if (fn[length(fn)] > M) {
    fn <- fn[-length(fn)]
  }
  
  return(fn)
}


# test 
fib(M = 300)

# repeat loop structure 
repeat {
  # do something
}
...


## ---- fibonacci with repeat --------------------------------------------------
fib2 <- function(M) {
  
  # first 2 FN
  fn <- c(1, 1)
  
  repeat {
    
    # sum of last 2 FN
    sum_2 <- fn[length(fn) - 1] + fn[length(fn)]
    
    # break if sum_2 > n
    if (sum_2 > M) break
    
    # otherwise append to existing vector of FN
    fn <- c(fn, sum_2)
  }
  
  return(fn)
}

# test
fib2(M = 300)


## ---- lotto with replicate function ------------------------------------------
# each run ... one column
set.seed(123)
Lotto5 <- replicate(n = 5, sample(1:45, size = 7, replace = FALSE))
Lotto5


## ---- operators --------------------------------------------------------------
# Example
set.seed(123)
mean(x = rnorm(10, mean = 0, sd = 2))

# Examples
4 + 2

# remainder in division by 2
11 %% 2

# set operation
c(1, 4, 7) %in% c(4, 19, 34)

# Addition
"+"(4, 2)

# Remainder
"%%"(11, 2)

# Set Operation
"%in%"(c(1, 4, 7), c(4, 19, 34))


## ---- set operations ---------------------------------------------------------
# define sets A and B
A <- c(1, 4, 6, 8)
B <- c(4, 8, 13, 20)
union(A, B)

intersect(A, B)

# 2 equal sets A and B
A <- c(1, 2, 5)
B <- c(1, 5, 2)
setequal(A, B)

# 2 unequal sets A and B
A <- c(1, 2, 5)
B <- c(2, 7, 11, 19)
setequal(A, B)

is.element(el = c(2, 3), set = c(1, 3, 6))

# the operator %in%
c(1, 4, 7) %in% c(2, 4, 14)

# set differences
A <- c(1, 4, 6, 8)
B <- c(4, 8, 13, 20)
setdiff(A, B)


# delta operator ---------------------------------------------------------------
"%delta%" <- function(A, B) {
  
  # A\B = A without B
  A_wo_B <- setdiff(A, B)
  
  # B\A = B without A
  B_wo_A <- setdiff(B, A)
  
  # symmetric difference
  A_delta_B <- union(A_wo_B, B_wo_A)
  
  # return symm. diff.
  return(A_delta_B)
}

A <- c(1, 2, 3)
B <- c(1, 3, 7, 8, 9)

# symmetric difference of A and B
A %delta% B


## ---- The dots argument ------------------------------------------------------
# 3 x 3 matrix M with random numbers
set.seed(222)
M <- matrix(data = rnorm(9), ncol = 3)
apply(X = M, MARGIN = 2, FUN = mean)


# introduce NAs in 1st and 2nd column of M
M[1, 1] <- M[1, 2] <- NA
apply(X = M, MARGIN = 2, FUN = mean)

# pass na.rm = TRUE to mean() via ...
apply(X = M, MARGIN = 2, FUN = mean, na.rm = TRUE)


## ---- global environment -----------------------------------------------------
# create object x
(x <- 12)
# ...
# do something else
# ...
# later redefine x
x <- 15
x

ls()

# create vector m in workspace
m <- 1:5

# define a function (Euklidean length)
euclid <- function(x) {
  m <- x^2
  cat("The current value of m is:", m, "\n")
  return((sum(m))^0.5)
}

# use function
euclid(x = 5:8)

# value of m
m

# create function which returns input, increased by 1
add1 <- function(x) {
  d <- x + 1
  cat("The current value of d is: ", d, "\n")
  return(d)
}

# call function
add1(5)

# show value of variable d -> not existing any more
d


# search path ------------------------------------------------------------------
search()

# create function
add_args <- function(a, b) {
  return(a + b)
}

# test
add_args(3, 7)

# create erroneous function
add_args <- function(a, b) {
  
  # d instead of b
  return(a + d)
}

# test
add_args(3, 7)


d <- 17
# ...
# some hours later
# ...
add_args(3, 7)


# create an empty list
lst_1 <- list()

# populate with items
lst_1$months <- month.name
lst_1$letters <- letters[1:5]

# the current content
lst_1

# copy and change
lst_2 <- lst_1
(lst_2$letters <- rev(letters)[1:5])

# not really surprising
identical(lst_1$letters, lst_2$letters)

# empty environment
env_1 <- new.env()

# populate with items
env_1$months <- month.name
env_1$letters <- letters[1:5]

# the current content
ls.str(env_1)

env_2 <- env_1
(env_2$letters <- toupper(letters)[1:5])

# changed env_1
identical(env_1$letters, env_2$letters)

env_1$letters
env_2$letters

# get parent environment
parent <- parent.env(env_1)
parent

# a little nicer output
environmentName(parent)

# create object in global environment
new_object <- 120

# does exist in our environment - result surprising?
exists("new_object", envir = env_1)

# does exist in our environment (and only there)
exists("new_object", envir = env_1, inherits = FALSE)

# iris data - variable Sepal.Width
summary(object = iris$Sepal.Width)

# iris data
summary(object = iris$Species)


## ---- plot iris --------------------------------------------------------------
# scatterplot
plot(x = iris$Sepal.Length[iris$Species == "setosa"],
     y = iris$Sepal.Width[iris$Species == "setosa"],
     xlab = "Sepal Length", ylab = "Sepal Width",
     main = "Setosa - Sepal Width/Length",
     pch = 19)

# linear model
lin_mod <- lm(Sepal.Width ~ Sepal.Length, data = iris,
              subset = (Species == "setosa"))

# plot regression line
abline(lin_mod, col = "red", lwd = 2)

# linear model
lin_mod <- lm(Sepal.Width ~ Sepal.Length, data = iris,
              subset = Species == "setosa")
# model summary
summary(lin_mod)

# class of our data vector
class(iris$Sepal.Width)

# class of variable "Species"
class(iris$Species)

# class of Linear Model
class(lin_mod)

attributes(lin_mod)

# matrix containing characters
(char_mat <- matrix(month.name,
                    nrow = 4, ncol = 3))
class(char_mat)

# matrix containing characters
(num_mat <- matrix(round(rnorm(12), 1),
                   nrow = 4, ncol = 3))
class(num_mat)

typeof(char_mat)
typeof(num_mat)

summary


## ---- methods ----------------------------------------------------------------
# what methods are available for the generic function "summary"
# methods("summary") also works
methods(summary)

# structure of lm class object
str(lin_mod, give.attr = FALSE, give.head = TRUE, max.level = 1)

# class lin_mod
class(lin_mod)

# delete attribute
attributes(lin_mod)$class <- NULL

# class now
class(lin_mod)

# summary on this list
summary(lin_mod)

# create a class "myobj"
a <- c(1, 14, 45)
class(a) <- "myobj"

# print method
print.myobj <- function(x, ...) {
  cat("I'm an object of class 'myobj' and my values are ",
      paste(x, collapse = ", "), ".", sep = "")
}

# try
print(a)

# 3 classes of a tibble
require(dplyr)
class(as_tibble(iris))

# primitive Pythagorean triple
s <- c(3L, 4L, 5L)

# set classes
class(s) <- c("primitive_pythagorean_triple",
              "pythagorean_triple",
              "integer")

# least specific class
is.integer(s)

# not yet available
is.primitive_pythagorean_triple(s)

inherits(s, "primitive_pythagorean_triple")
inherits(s, "pythagorean_triple")
inherits(s, "numeric")

tell_me_your_class <- function(x, ...) {
  UseMethod("tell_me_your_class")
}

# method for the primitive Pythagorean triple
tell_me_your_class.primitive_pythagorean_triple <- function(x, ...) {
  
  # just print a short message
  message("I am an object of class 'primitive Pythagorean triple'.")
  
  # go to next method
  NextMethod("tell_me_your_class")
}

# method for the primitive Pythagorean triple
tell_me_your_class.pythagorean_triple <- function(x, ...) {
  
  # just print a short message
  message("I am an object of class 'Pythagorean triple'.")
  
  # go to next method
  NextMethod("tell_me_your_class")
}

# method for the primitive Pythagorean triple
tell_me_your_class.integer <- function(x, ...) {
  
  # just print a short message
  message("I am an object of class 'integer'.")
}

tell_me_your_class(s)


# methods for class lm
methods(class = "lm")


# test item for database with 4 slots
test_item <- list(first_name = "Michael", surname = "Melcher",
                  ID = "9425107", year_of_birth = 1976)
class(test_item) <- "student"

# test item fou database with 4 slots
test_item2 <- list(first_name = "Max", surname = "Mustermann",
                   ID = 0827119, year_of_birth = 1989)
test_item2


# S4 classes - student example
setClass(Class = "student",
         slots = c(first_name = "character",
                   surname = "character",
                   ID = "character",
                   year_of_birth = "numeric"))


# create a new instance
test_person <- new(Class = "student", first_name = "Max",
                   surname = "Mustermann", ID = "0827119",
                   year_of_birth = 1989)
test_person

# use @ instead of $
test_person@ID

# access via slot function
slot(test_person, "surname")

# changes in the usual way
test_person@year_of_birth <- 1990

# slot ID is a character, but we enter a numeric value
test_person@ID <- 1990

# non-existing slot "IT" instead of "ID"
test_person@IT <- "0874229"

# not a very nice output
show(test_person)

setMethod(f = "show", signature = "student",
          definition = function(object) {
            cat("Mr./Mrs. ", object@first_name, " ", object@surname,
                " has student ID ", object@ID, " and was born in ",
                object@year_of_birth, ".\n", sep = "")
          }
)

# alternative: simply type object to show
show(test_person)

# don't overwrite TRUE-abbreviation
T <- 3

# c() is a function name
c <- 12

# don't overwrite existing function, create a new one
sum <- function(x) sum(x[!is.na(x)])


## ---- create a confidence interval function ----------------------------------
ci <- function(m, std, n, level = 0.95, verbose = TRUE) {
  
  # t - quantile
  quant <- -qt(p = (1 - level)/2, df = n - 1)
  
  # check std
  if (std < 0) stop("Standard deviation must be > 0.")
  else if (std < .Machine$double.eps)
    warning("Standard deviation very small - correct?")
  
  # calculate interval
  int <- m + (quant * std / sqrt(n)) * c(-1, +1)
  
  # return and print a message
  if (verbose) message("Calculation successful.")
  return(int)
}

# standard call
ci(m = 3, std = 2, n = 10)

# switch off message
ci(m = 3, std = 2, n = 10, verbose = FALSE)

suppressMessages(ci(m = 3, std = 2, n = 10, verbose = TRUE))

ci(m = 3, std = 10^(-20), n = 10)

# do not show warnings
suppressWarnings(ci(m = 3, std = 10^(-20), n = 10))

ci(m = 3, std = -3, n = 10)
