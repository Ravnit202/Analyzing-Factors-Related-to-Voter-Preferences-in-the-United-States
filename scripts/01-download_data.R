#### Preamble ####
# Purpose: Downloads and saves the CES2020 data into a csv
# Author: Ravnit Lotay
# Date: 13 March 2024
# Contact: ravnit.lotay@mail.utoronto.ca
# Pre-requisites: none

#### Environment Setup ####

## Uncomment if not installed
# install.packages("tidyverse")
# install.packages("haven")
# install.packages("dplyr")
# install.packages("readr")
# install.packages("dataverse")

library(tidyverse)
library(haven)
library(dplyr)
library(dataverse)
library(readr)

#### Download data ####

ces2022 <-
  get_dataframe_by_name(
    filename = "CCES22_Common_OUTPUT_vv_topost.csv",
    dataset = "10.7910/DVN/PR4L8P",
    server = "dataverse.harvard.edu",
    .f = read_csv
  ) |>
  select(votereg, birthyr, presvote20post, educ, gender4)


#### Save data in a .csv ####
write_csv(cces2022, "data/raw_data/ces2022.csv")


