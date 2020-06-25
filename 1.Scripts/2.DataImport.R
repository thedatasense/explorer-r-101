
# Data Import

#1. From CSV/Excel

# Working with data frames
# Let's use the built-in survey data.frame dataset

# https://vincentarelbundock.github.io/Rdatasets/doc/ISLR/Auto.html

rdata <- read_csv("http://faculty.marshall.usc.edu/gareth-james/ISL/Auto.csv")

rdata <- na.omit(rdata) # for simplicity I'll exclude missing data


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


install.packages("tidyverse")

glimpse(rdata)

help("dplyr")



# Getting help
# Use question mark (i.e., ?) followed by command name
# to lookup specific command
?mean 
help(mean) # or use help function




#2. From Database


library(odbc)
sort(unique(odbcListDrivers()[[1]]))
sql_translate_env.JDBCConnection <- dbplyr:::sql_translate_env.Oracle
sql_select.JDBCConnection <- dbplyr:::sql_select.Oracle
sql_subquery.JDBCConnection <- dbplyr:::sql_subquery.Oracle


gch_tbl <- dplyr::tbl(mitg_signia_orc, dbplyr::in_schema('TWX_USER', 'MAT_VW_HANDLE_GCH_SUMMARY_MERGE_CODES'))

gch_tbl <- dbGetQuery(mitg_signia_orc, "SELECT * FROM MAT_VW_HANDLE_GCH_SUMMARY_MERGE_CODES")
