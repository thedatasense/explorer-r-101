# Basic Arithmetic and Logical Operations
# You can use R like a calculator
1 + 1 # addition

10 - 9 # subtraction

10 * 10 # multiplcation

100 / 10 # division

10 ^ 2 # exponentiation

abs(-10) # absolute value

ceiling(3.5) # round up to next integer

floor(3.5) # round down to next integer

sqrt(100) # square roots

exp(2) # exponential

pi # mathematical constant pi

exp(1) # mathematical constant e

log(100) # natural logs (i.e., base e)

log(100, base= 10) # base 10 logs



# Use parentheses to clarify order of operations
(1 + 1 ) * 2
1 + (1 * 2)

# You can test for equality
# TRUE and FALSE are keywords
# T and F are synonyms, but are generally discouraged
TRUE
FALSE
1 == 2 # Equality (Return TRUE if equal)
1 != 2 # Inequality (Return FALSE if unequal)
10 > 9 # Greater than
9 < 10 # Less than
10 <= 10 # Less than or equal
2 %in% c(1, 2 ,3) # is the number in the vector

# TRUE and FALSE coerces to 1 and 0 respectively
as.numeric(TRUE)
as.numeric(FALSE)

# Logical converting to 0, 1 is useful
x <- c(2, 5 ,7 ,10, 15)
x > 5
sum(x > 5)  # sum of a 0-1 variable is a count
mean(x > 5) # mean of a 0-1 variable is a proportion



