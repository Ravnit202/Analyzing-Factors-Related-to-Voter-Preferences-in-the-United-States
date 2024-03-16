#### Preamble ####
# Purpose: Test and verify correctness in the dataset
# Author: Ravnit Lotay
# Date: 13 March 2024
# Contact: ravnit.lotay@mail.utoronto.ca
# Pre-requisites: None

## voted_for: Either Biden or Trump
## gender: Must be one of ("Male", "Female", "Non-binary", "Other")
## education: Must be one of ("No HS", "High school graduate", "Some college", "2-year", "4-year", "Post-grad")
## age: The voters' age. It MUST be over 18

#### Environment Setup ####
library(tidyverse)

#### Data Verification ####

# Load the dataset prepared for analysis
analysis_data <- read_csv("data/analysis_data/cces_analysis_data.csv")

all(sort(unique(analysis_data$voted_for)) == sort(c("Trump", "Biden")))

is.character(analysis_data$voted_for)

is.character(analysis_data$gender)

all(sort(unique(analysis_data$gender)) == sort(c("Male", "Female", "Non-binary", "Other")))

is.character(analysis_data$education)

all(sort(unique(analysis_data$education)) == sort(c("No HS", "High school graduate", "Some college", "2-year", "4-year", "Post-grad")))

is.numeric(analysis_data$age)

min(analysis_data$age) > 18

