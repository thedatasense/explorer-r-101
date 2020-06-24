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
  "reshape2","mnormt","psych"
)


install_or_load_pack(pkgs)

version

