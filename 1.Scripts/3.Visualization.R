# Visualization
# 
#   
# 1.Base graphics
# 2.plotly & ggplot2

#1. Base graphics
# scatterplot
plot(rdata$Pulse, rdata$Age)
plot(Age ~ Pulse, rdata)
plot(rdata$Pulse)

# distribution
hist(rdata$Pulse, 10) # histogram
stem(rdata$Pulse) # Stem and leaf plot
plot(density(rdata$Pulse)) # density plot
boxplot(rdata$Pulse) # box plot
boxplot(rdata$Pulse ~ rdata$Sex) # box plot by group

# categorical variables
plot(rdata$Smoke)
plot(prop.table(table(rdata$Smoke)))

# plot co-variation of multiple numeric variables 
pairs( rdata[, c("Wr.Hnd", "Pulse", "Height", "Age") ])






# Graphics options
# Base graphics uses a "painting the page metaphor"

# add options to the main plotting functions
plot(rdata$Pulse, rdata$Age,
     xlab = "Pulse",  # x-axis label
     ylab = "Age",      # y-axis label
     pch = 2,          # plotting character
     las = 1,         # orientation of axis labels
     xlim = c(0, 110), # x axis limits
     ylim = c(0, 80)   # y axis limits
)

# overlay different elements
title("Pulse by Age") # add title to top of plot
abline(h = mean(rdata$Age), lty = 2, col = "red") # add straight line
abline(v= mean(rdata$Pulse), lty = 2, col = "blue")  # add straight line
text(70, 75, "outlier") # add text

# There are various graphic parameters like 
# lty for line type
# col for colour
# For further information, see
# http://www.statmethods.net/advgraphs/parameters.html
?par # built-in help for graphics parameters
?plot.default # built-in help 


# Arrange plots in grids
par(mfrow = c(2, 2)) # create grid of plots with 2 rows and 2 columns
plot(Pulse ~ Age, rdata, main = "Pulse")
plot(Wr.Hnd ~ Age, rdata,  main = "Writing hand")
plot(NW.Hnd ~ Age, rdata, main = "Non-writing hand")
plot(Height ~ Age, rdata, main = "Height")
par(mfrow = c(1, 1)) # return to standard settings



# Let's look at the ais dataset
str(rdata)

# See the Rstudio ggplot2 cheatsheet 
# and the ggplot2 documentation: http://docs.ggplot2.org/current/

# specify the data frame and the mapping of variables to plot attributes

# scatter plot
# 1. supply a data.frame
# 2. add aesthetic mapping between variables in data.frame
#    and 
ggplot(rdata, aes(x = Age, y = Height)) + geom_point()

p <- ggplot(rdata, aes(x = Age, y = Height, colour = Sex)) + 
  geom_point() + 
  geom_smooth() + 
  xlab("Age") +
  ylab("Weight")
ggplotly(p)

ggsave("3.Outputs/height_weight.pdf", width = 5, height = 5) # save last plot

# distribution
p <- ggplot(rdata, aes(x = Height)) 
p + geom_histogram() #histogram
p + geom_density(fill = "blue") # density plot

# Show group differences
p <- ggplot(rdata, aes(x = Smoke, y = Height)) 
p + geom_boxplot()

# Scatterplot matrix
# Something like pairs and pairs.panels
library(GGally)
GGally::ggpairs(rdata[1:4])



