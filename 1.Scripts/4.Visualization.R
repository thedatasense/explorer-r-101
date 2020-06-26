# Install & Load Packages -------------------------------------------------

install.packages("DataExplorer")
install.packages("tidyverse")
install.packages("plotly")
install.packages("corrplot")
library(DataExplorer)
library(tidyverse)
library(plotly)
library(corrplot)

# Visualization
# 1.Base graphics
# 2.plotly & ggplot2


# 1. Visual Inspection of Statistical Summary

summary(cars %>% select_if(is.numeric))


# distribution
hist(cars$mpg, 10, main = "Histogram of Miles per Gallon") # histogram
hist(cars$mpg, main = "Histogram of Miles Per Gallon", xlab = "Miles Per Gallon")

plot(density(cars$mpg)) # density plot


plot(
  cars$mpg,
  cars$horsepower,
  main = "Miles Per Gallon Vs Horse Power",
  xlab = "Miles Per Gallon",
  ylab = "Horse Power"
)
abline(v = mean(cars$mpg),
       lty = 2,
       col = "red") # add straight line
text(34, 120, "bad apple", col = "red") # add text



boxplot(cars$mpg, main = "Box Plot of MPG", xlab = "Miles Per Gallon") # box plot


# See the Rstudio ggplot2 cheatsheet
# and the ggplot2 documentation: http://docs.ggplot2.org/current/

# specify the data frame and the mapping of variables to plot attributes


## Univariate analysis

## Let's look at the distribution of MPG Spread

ggplot(cars, aes(mpg)) +
  geom_histogram(
    binwidth = 5,
    fill = "#004B87",
    color = "#e9ecef",
    alpha = 0.9
  ) +
  labs(title = "Histogram of MPG", y = "Count", x = "Miles Per Gallon") +
  theme_bw()


mdtcolors <-
  c("#001E46",
    "#004B87",
    "#00A9E0",
    "#E35205",
    "#B0008E",
    "#77BC1F")



## Let's look at Dataset by Country

p <- ggplot(cars, aes(Region)) +
  geom_bar(fill = "#B0008E", color = "#e9ecef") +
  labs(title = "Where is the data from?", y = "Count") +
  scale_fill_manual(values = mdtcolors) +
  theme_minimal()


## Let's look at the Density of Miles Per Gallon by Region

p <- ggplot(data    = cars,
            mapping = aes(x = mpg, fill = Region)) +
  labs(title = "Density of MPG By Region", y = "Density", x = "Miles Per Gallon") +
  geom_density(alpha = 0.8) +
  scale_fill_manual(values = mdtcolors) +
  theme_bw()

ggplotly(p)


## Let's look at the Distribution of Number of Cylinders

ggplot(cars, aes(cylinders)) +
  geom_bar(fill = "#004B87", color = "#e9ecef") +
  labs(title = "Distribution of Number of Cylinders", y = "Count") +
  scale_fill_manual(values = mdtcolors) +
  theme_minimal()

# For cylinders we can see that 4 cylinders is 2 times more often than 8 cylinders

# Let's look at the Horse Power

p <- ggplot(cars, aes(Region, horsepower, fill = Region)) +
  geom_boxplot() +
  labs(title = "Box Plot of Horse Power", y = "Horse Power") +
  scale_fill_manual(values = mdtcolors) +
  theme_minimal()

ggplotly(p)


# Let's look at the Displacement

p <- ggplot(cars, aes(Region, displacement, fill = Region)) +
  geom_boxplot() +
  labs(title = "Box Plot of Displacement", y = "Displacement") +
  scale_fill_manual(values = mdtcolors) +
  theme_minimal()

ggplotly(p)


# Let's look at the Weight

p <- ggplot(cars, aes(Region, weight, fill = Region)) +
  geom_boxplot() +
  labs(title = "Box Plot of Weight", y = "Weight") +
  scale_fill_manual(values = mdtcolors) +
  theme_minimal()

ggplotly(p)


# Let's look at the Acceration

p <- ggplot(cars, aes(Region, acceleration, fill = Region)) +
  geom_boxplot() +
  labs(title = "Box Plot of Acceleration", y = "Acceration") +
  scale_fill_manual(values = mdtcolors) +
  theme_minimal()

ggplotly(p)



# Let's look at the Price

p <- ggplot(cars, aes(Region, price, fill = Region)) +
  geom_boxplot() +
  labs(title = "Box Plot of Price", y = "Price($)") +
  scale_fill_manual(values = mdtcolors) +
  theme_minimal()

ggplotly(p)


# With little bit of reshaping, we can plot it all together. 

carlong <-  cars %>% 
  select(Region,mpg,displacement,horsepower,weight,price) %>% 
  gather(key="variable",value = "value",mpg,displacement,horsepower,weight,price) 

p <- ggplot(carlong, aes(Region, value, fill = Region)) +
  geom_boxplot() +
  labs(title = "Box Plot of Price", y = "Price($)") +
  scale_fill_manual(values = mdtcolors) +
  facet_wrap( ~ variable, ncol=2) +
  theme_minimal()

ggplotly(p)


# Multivariate Analysis

correlations = cor(cars[, c("mpg", "horsepower", "acceleration", "weight")])
corrplot(correlations)

# Look at the positive correlation between mpg,acceleration

p <- ggplot(cars, aes(mpg,acceleration,color=Region)) + 
  geom_jitter() + 
  theme_minimal() +
  labs(title = "Miles Per Gallon Vs Acceleration", y = "Acceleration",x="Miles Per Gallon") + 
  geom_smooth(method = "lm", se = FALSE) + 
  scale_colour_manual(values = mdtcolors)

ggplotly(p)


# Look at the negative correlation between mpg,weight


p <- ggplot(cars, aes(mpg,weight,color=Region)) + 
  geom_jitter() + 
  theme_minimal() +
  labs(title = "Miles Per Gallon Vs Weight", y = "Weight(lb)",x="Miles Per Gallon") + 
  geom_smooth(method = "lm", se = FALSE) + 
  scale_colour_manual(values = mdtcolors)

ggplotly(p)



## Time for some time series analysis

yearlytrend <- cars %>% 
  group_by(Region,modelyear) %>% 
  summarise(medmpg = max(mpg)) %>% 
  ungroup()

fig <-plot_ly(yearlytrend, mode = 'lines',x = ~modelyear, y =~medmpg,color =~Region)
 fig <- fig %>% layout(
   title = "Miles Per Galon Trend Over Years",
     xaxis = list(title = "Year of Make"),
     yaxis = list(title = "MPG"),
   )

