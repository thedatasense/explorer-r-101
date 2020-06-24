
for (i in 1:5000) {
  if(i == 1) {
    rdata_d <- rdata
  }
  rdata_d <- union_all(rdata_d,rdata)
}



auto_tbl <- copy_to(sc, rdata_d,overwrite = TRUE)

ptm <- proc.time()
auto_tbl %>%
  group_by(cylinders) %>%
  summarise(count = n(), mpg_mean = mean(mpg), weight_mean = mean(weight)) %>%
  filter(mpg_mean > 20) %>%
  collect
proc.time() - ptm

ptm <- proc.time()
rdata_d %>%
  group_by(cylinders) %>%
  summarise(count = n(), mpg_mean = mean(mpg), weight_mean = mean(weight)) %>%
  filter(mpg_mean > 20) %>%
  collect
proc.time() - ptm


kmeans_model <- auto_tbl %>%
  ml_kmeans(formula= ~ weight + mpg, k = 3)

library(sparklyr)
# Transform the data with Spark SQL, feature transformers, and DataFrame functions.
# 
# Use Spark SQL to remove all cars with horsepower less than 100
# Use Spark feature transformers to bucket cars into two groups based on cylinders
# Use Spark DataFrame functions to partition the data into test and training
# Then fit a linear model using spark ML. Model MPG as a function of weight and cylinders.
sparklyr::s
# transform our data set, and then partition into 'training', 'test'
partitions <- auto_tbl %>%
  filter(horsepower >= 100) %>%
  sdf_mutate(cyl8 = ft_bucketizer(cylinders, c(0,8,12))) %>%
  sdf_partition(training = 0.5, test = 0.5, seed = 888)

# fit a linear mdoel to the training dataset
fit <- partitions$training %>%
  ml_linear_regression(mpg ~ wt + cyl)


sdf_

