autoModel = lm(mpg ~ cylinders + horsepower + weight + displacement + year + acceleration, data = rdata)
summary(autoModel)

# Overall, autoModel is predictive, with an adjusted r squared of 80.8% and a low p value for the model. 
# This is interpreted to mean that 80.8% of the variance in mpg is explained by the predictors in the model. 
# The small p value of the overall model indicates that R squared is significantly different from zero.
# Weight and Year are the only two significant variables at the 5% level (both are predictive at a less than .01% level).
# We can also plot the coefficients to see a visual representation of the confidence intervals for the coefficients


