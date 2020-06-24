# Visualization
# 
#   
# 1.Base graphics
# 2.plotly & ggplot2
str(rdata)
#1. Base graphics
# scatterplot
plot(rdata$mpg, rdata$weight)
plot(mpg ~ weight, rdata)
plot(rdata$weight)

# distribution
hist(rdata$weight, 10) # histogram
stem(rdata$weight) # Stem and leaf plot
plot(density(rdata$weight)) # density plot
boxplot(rdata$weight) # box plot
boxplot(rdata$weight ~ rdata$cylinders) # box plot by group

# categorical variables
plot(as.factor(rdata$cylinders))
plot(prop.table(table(as.factor(rdata$cylinders))))

# plot co-variation of multiple numeric variables 
pairs( rdata[, c("mpg", "horsepower", "acceleration", "weight") ])






# Graphics options
# Base graphics uses a "painting the page metaphor"

# add options to the main plotting functions
plot(rdata$weight, rdata$mpg,
     xlab = "Weight",  # x-axis label
     ylab = "Miles Per Gallon",      # y-axis label
     pch = 2,          # plotting character
     las = 1      # orientation of axis labels

)

# overlay different elements
title("Weight Vs Miles Per Gallon") # add title to top of plot
abline(h = mean(rdata$mpg), lty = 2, col = "red") # add straight line
abline(v= mean(rdata$weight), lty = 2, col = "blue")  # add straight line
text(2200,45, "bad apple") # add text





# Let's look at the ais dataset
str(rdata)

# See the Rstudio ggplot2 cheatsheet 
# and the ggplot2 documentation: http://docs.ggplot2.org/current/

# specify the data frame and the mapping of variables to plot attributes

# scatter plot
# 1. supply a data.frame
# 2. add aesthetic mapping between variables in data.frame
#    and 
ggplot(rdata, aes(x = weight, y = mpg)) + geom_point()

p <- ggplot(rdata, aes(x = weight, y = mpg, colour = as.factor(origin))) + 
  geom_point() + 
  geom_smooth() + 
  xlab("Weight") +
  ylab("Mpg")
ggplotly(p)

ggsave("3.Outputs/height_weight.pdf", width = 5, height = 5) # save last plot

# distribution
p <- ggplot(rdata, aes(x = Height)) 
p + geom_histogram() #histogram
p + geom_density(fill = "blue") # density plot

# Show group differences
p <- ggplot(rdata, aes(x = Smoke, y = Height)) 
p + geom_boxplot()

str(rdata)

correlations = cor(rdata[, c("mpg", "horsepower", "acceleration", "weight")])
corrplot(correlations)
