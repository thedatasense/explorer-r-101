
# Install & Load Packages -------------------------------------------------

install.packages("DataExplorer")
install.packages("tidyverse")
library(DataExplorer)
library(tidyverse)



# dplyr is a grammar of data manipulation, providing a consistent set of verbs that help you solve the most common data manipulation challenges:
#   
# mutate() adds new variables that are functions of existing variables
# select() picks variables based on their names.
# filter() picks cases based on their values.
# summarise() reduces multiple values down to a single summary.
# arrange() changes the ordering of the rows.


# Merge & Clean  the two data sets ----

cars <- auto_raw %>% left_join(auto_prices)

# Convert cylinders and model to factors 
cars$cylinders <- as.factor(cars$cylinders)
cars$model <- as.factor(cars$model)
cars$model <- as.factor(cars$model)
cars$price <- as.integer(cars$price)
cars$origin <- as.factor(cars$origin)
cars$car_name <- as.factor(cars$car_name)
cars$horsepower<- as.numeric(cars$horsepower)
cars$ID<- as.factor(cars$ID)
# Mutate for adding new variables
cars <- cars %>%
  mutate(Region=as.factor(case_when(
    origin ==  1 ~ "American",
    origin ==2 ~ "European",
    TRUE ~ "Japanese"
  ))) %>% 
  mutate(modelyear=as.Date(paste(12,31,paste(19,model,sep=""),sep="-"),format='%m-%d-%Y')) 



# The newly created data set is cars

# Inspect the data set ----

# Data Explorer package is very handy here
# https://cran.r-project.org/web/packages/DataExplorer/vignettes/dataexplorer-intro.html

# To get introduced to your newly created dataset

plot_intro(cars)

introduce(cars)

# Now let's look at missing values
plot_missing(cars)


#A q-q plot is a plot of the quantiles of the first data set 
#against the quantiles of the second data set. 

qqnorm(cars$mpg)

#A more formal way of looking at the normality is by testing whether the kurtosis 
#and skewness are significantly different from zero.


DataExplorer::create_report(cars,output_format = "html_document",output_file = "autodiag-report.html", output_dir = getwd(),y="mpg")

