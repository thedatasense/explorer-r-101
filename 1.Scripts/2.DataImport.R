install.packages("tidyverse")

# Data Import

#1. From CSV/Excel

# Working with data frames
# Let's use the built-in survey data.frame dataset

# https://vincentarelbundock.github.io/Rdatasets/doc/ISLR/Auto.html

auto_raw <- read_csv("https://raw.githubusercontent.com/thedatasense/explorer-r-101/master/2.Data/auto.csv")
auto_prices <- read_csv("https://raw.githubusercontent.com/thedatasense/explorer-r-101/master/2.Data/auto_prices.csv")

rdata <- 
  auto_raw %>% 
  left_join(auto_prices)


################################################
# Extracting observations (i.e., rows) and 
# variables (i.e., columns).
# There are similarities to matrices and lists
# Select observations
rdata[1:5, ] # by row number
rdata[c(5,4,3,2,1), ] # re-order
rdata[ rdata$origin == 1, ] # by logical vector
rdata[c("1", "2"), ] # by rownames

# Select variables 
rdata[, c(1,2)] # by position like a matrix
rdata[c(1,2)] # by position like a list
rdata[ ,c("cylinders", "name")] # by name like a matrix
rdata$name # by name to get a single variable



# Examine first few rows
head(rdata) # first 6 rows
head(rdata, n = 10) # first 7 rows
tail(rdata) # last few rows
# View(rdata) # Rstudio function to open data in viewer
# or click on the icon in the Environment pane

# How many rows and columns?
dim(rdata) # rows and column counts
nrow(rdata) # row count
ncol(rdata) # column count

# Examine structure
str(rdata)





# Notice that horsepower is read in as character, where it should be 
# a number
rdata$horsepower <- as.double(rdata$horsepower)
# Notice that horsepower is read in as number, where it should be 
# a factor
rdata$cylinders <- as.factor(rdata$cylinders)

# Notice that model is read in as number, where it should be 
# a factor
rdata$model <- as.factor(rdata$model)


# Examine structure
str(rdata)

# Getting help
# Use question mark (i.e., ?) followed by command name
# to lookup specific command
?mean 
help(mean) # or use help function










