## Setup and Load required libraries
install_or_load_pack <- function(pack) {
  create.pkg <- pack[!(pack %in% installed.packages()[, "Package"])]
  if (length(create.pkg))
    install.packages(create.pkg, dependencies = TRUE)
  sapply(pack, require, character.only = TRUE)
}



pkgs <- c (
  "dlookr",
  "skimr",
  "GGally",
  "tidyverse",
  "plotly",
  "reshape2","sparklyr","psych", "corrplot","h2o"
)


install_or_load_pack(pkgs)

library(sparklyr)
spark_install("2.3")

library(sparklyr)
sc <- spark_connect(master = "local", version = "2.3")
