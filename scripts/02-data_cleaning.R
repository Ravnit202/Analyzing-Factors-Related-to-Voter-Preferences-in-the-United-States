#### Preamble ####
# Purpose: Clean and prepare the dataset for analysis
# Author: Ravnit Lotay
# Date: 13 March 2024
# Contact: ravnit.lotay@mail.utoronto.ca
# Pre-requisites: None


#### Environment Setup ####
library(tidyverse)

#### Clean the data ####
cces2022 <-
  read_csv(
    "data/raw_data/cces2022.csv",
    col_types =
      cols(
        votereg = col_integer(),
        presvote20post = col_integer(),
        gender4 = col_integer(),
        educ = col_integer(),
        birthyr = col_integer() 
      )
  )

cces2022 <-
  cces2022 |>
  filter(votereg == 1, presvote20post %in% c(1, 2)) |>
  mutate(
    voted_for = if_else(presvote20post == 1, "Biden", "Trump"),
    voted_for = as_factor(voted_for),
    gender = case_when(
      gender4 == 1 ~ "Male", 
      gender4 == 2 ~ "Female", 
      gender4 == 3 ~ "Non-binary", 
      gender4 == 4 ~ "Other"
    ),
    education = case_when(
      educ == 1 ~ "No HS",
      educ == 2 ~ "High school graduate",
      educ == 3 ~ "Some college",
      educ == 4 ~ "2-year",
      educ == 5 ~ "4-year",
      educ == 6 ~ "Post-grad"
    ),
    education = factor(
      education,
      levels = c(
        "No HS",
        "High school graduate",
        "Some college",
        "2-year",
        "4-year",
        "Post-grad"
      )
    ),
    age = 2024 - birthyr, 
  ) |>
  select(voted_for, gender, education, age) 

#### Save data ####
write_csv(cces2022, "data/analysis_data/cces_analysis_data.csv")