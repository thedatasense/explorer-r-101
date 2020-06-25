#######################################################
# Basic data types
# The most common basic vector types are
x <- c(FALSE, TRUE) # logical vector
y <- c("a", "b", "cat", "dog") # character vector
z1 <- c(100, 1, 2, 3) # numeric integer vector
z2 <- c(100.2, 0.4, 0.9) # numeric real/double vector
typeof(x)
typeof(y)
typeof(z1)
typeof(z2)

# http://applied-r.com/data-modes-and-classes/ 

# Checking type of object
# there are a range of "is." functions for that return TRUE
# if object is of corresponding type
# apropos("^is\\.")
is.logical(c(TRUE, TRUE))
is.numeric(c("a", "b"))
is.character(c(1, 2, 3))

#############################################################
# Conversion of Types:
# R has functions that explicitly convert data types
# apropos("^as\\.")
as.character(c(1, 2, 3, 4))
as.numeric(c("1", "2a", "3", "four"))
as.numeric(c(FALSE, FALSE, TRUE, TRUE))

# R often performs conversions implicitly
sum(c(FALSE, TRUE, TRUE)) # converts logical to 0, 1 numeric
paste0("v", c(1, 2, 3)) # converts numeric vector to character

# Basic data structures: Vectors, Matrices, Lists, Data.frames
###########################################################
# Vectors:
# In R, a single value (scalar) is a vector.
x <- 1 # I.e., x is a vector of length 1


# In addition to importing data,
# R has various functions for creating vectors.
c(1, 2, 3, 4) # c stands for combine
1:10 # create an integer sequence 1 to 10
seq(1, 10) # alternative way of creating a sequence 
seq(1, 10, by = 2) # The function has additional options
rep(1, 5) # repeat a value a certain number of times
rep(c(1,2,3), 5) # repeat a value a certain number of times

# as well as many simulation functions which we'll cover later
# Initial examples:
# Sample 10 items with replacement from 
sample(x = c("happy", "funny", "silly"), size = 10, replace = TRUE)

# Sample 20 values from a normal distribution
y <- rnorm(n = 20, mean = 0, sd = 1) 
hist(y) # show values in histogram


# Vectors can have names
x <- c(1,2,3,4,5)
names(x) <- c("a", "b", "c", "d", "e")
x

# Extracting vectors
x[c(1,2)] # by numeric position
x[x < 3] # by logical vector
x[c("b", "c")] # by name




###########################################################
# Matrices:
# All data must be of same type (e.g., numeric, character, logical)
y <- matrix(c(1, 2, 
              4, 5, 
              7, 8 ),
            byrow = TRUE, ncol = 2)
y

class(y)

# number of rows and columns
dim(y)  # Number of rows and columns
nrow(y) # Number of rows
ncol(y) # Number of columns

# Rows and columns can be given names
rownames(y) <- c("a", "b", "c")
colnames(y) <- c("col1", "col2")

# Rows and columns can be indexed
y["a", ] # By rowname
y[, "col1"] # By column name 
y["a", "col1"] # By both

y[c(1,2), ] # By row position
y[,1] # By column position
y[c(2,3), 2] # By column position

###########################################################
# Lists
# Store arbitrary structures of one or more named elements.
# Elements can be of different lengths
# Lists can contain lists can be nested to create tree like structures
# Lists are commonly used for representing results of analyses

w <- list(apple = c("a", "b", "c"), 
          banana = c(1,2), 
          carrot = FALSE,
          animals = list(dog = c("dog1", "dog2"), 
                         cat = c(TRUE, FALSE)))

class(w)

# Accessing one element of list
w$apple # using dollar notation
w[[1]] # by position
w[["apple"]] # by name (double brackets)

# Accessing subset of list
w[c(1, 2)]  # by position (single bracket)
w[c("apple", "banana")] # by name
w[c(FALSE, FALSE, TRUE, TRUE)] # by logical vector

# Quick illustration of a list object returned by
# a statistical function

# We'll simulate some data for two hypothetical groups x and y
# and perform an independent samples t-test.
x <- rnorm(10, mean = 0, sd = 1) 
y <- rnorm(10, mean = 1, sd = 1)
fit <- t.test(x, y)  

# The function 
class(fit) # class does not say list, but it is a list
mode(fit)
str(fit) # show structure of object
names(fit) # show names of elements
# we can view particular elements
fit$statistic 
fit$parameter
fit$p.value
# or extract subsets of the list
fit[c("statistic", "parameter", "p.value")]


###########################################################
# Data Frames:
# Data frames are the standard data strucure used for storing
# data. If you have used other software (e.g., SPSS, Excel, etc.), 
# this is what you may think of as a "dataset".
# Columns can be of different data types (e.g., character, numeric, logical, etc.)
z <- data.frame(var1 = 1:9, var2 = letters[1:9])
z

# Tip: Some functions work with matrices, 
#   some work with data.frames, 
#   and some work with both.
# * If you are wanting to store data like you might store in 
#   a database, then you'll generaly want a data.frame.
# * If you are dealing with a mathematical object that you
#   you want to perform a mathematical operation on, then you generally
#   want a matrix (e.g., correlation matrix, covariance matrix, 
#   distance matrix in MDS, matrices used for matrix algebra).








