#### First look at the structure of the data
str(rdata)

# Notice that horsepower is read in as character, where it should be 
# a number
rdata$horsepower <- as.double(rdata$horsepower)
# Notice that horsepower is read in as number, where it should be 
# a factor
rdata$cylinders <- as.factor(rdata$cylinders)

#A q-q plot is a plot of the quantiles of the first data set 
#against the quantiles of the second data set. 
hist(rdata$mpg)


qqnorm(rdata$mpg)

#A more formal way of looking at the normality is by testing whether the kurtosis 
#and skewness are significantly different from zero.

install.packages("DataExplorer")
library(DataExplorer)
DataExplorer::plot_intro(rdata)
plot_bar(rdata,with="mpg")



plot_qq(diamonds)

glimpse(rdata,)

DataExplorer::create_report(rdata,output_format = "html_document",output_file = "autodiag-report.html", output_dir = getwd(),y="mpg")


# dplyr is a grammar of data manipulation, providing a consistent set of verbs that help you solve the most common data manipulation challenges:
#   
# mutate() adds new variables that are functions of existing variables
# select() picks variables based on their names.
# filter() picks cases based on their values.
# summarise() reduces multiple values down to a single summary.
# arrange() changes the ordering of the rows.


# Mutate for adding new variables
rdata %>%
  mutate(orglabel=case_when(
    origin ==  1 ~ "American",
    origin ==2 ~ "European",
    TRUE ~ "Japanese"
      )) %>% 
  View()



# Select to select variables from the df.

rdata %>%
  filter(origin==1) %>%
  select(name,mpg) %>%
  arrange(desc(mpg))





