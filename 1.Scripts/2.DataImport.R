
# Data Import

#1. From CSV/Excel

rdata <- read.csv("http://faculty.marshall.usc.edu/gareth-james/ISL/Auto.csv")




#2. From Database


library(odbc)
sort(unique(odbcListDrivers()[[1]]))
sql_translate_env.JDBCConnection <- dbplyr:::sql_translate_env.Oracle
sql_select.JDBCConnection <- dbplyr:::sql_select.Oracle
sql_subquery.JDBCConnection <- dbplyr:::sql_subquery.Oracle


gch_tbl <- dplyr::tbl(mitg_signia_orc, dbplyr::in_schema('TWX_USER', 'MAT_VW_HANDLE_GCH_SUMMARY_MERGE_CODES'))

gch_tbl <- dbGetQuery(mitg_signia_orc, "SELECT * FROM MAT_VW_HANDLE_GCH_SUMMARY_MERGE_CODES")
