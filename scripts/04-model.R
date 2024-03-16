#### Preamble ####
# Purpose: Creates and saves a logistic regression model 
# Author: Ravnit Lotay
# Date: 13 Mar 2024
# Contact: ravnit.lotay@mail.utoronto.ca
# Pre-requisites: None

#### Environment setup ####
library(tidyverse)
library(rstanarm)
sessionInfo()

#### Load cces dataset ####
voter_data <- read_csv("data/analysis_data/cces_analysis_data.csv")

# Preparing to create the model
voter_data <- voter_data |> 
  mutate(vote_for_Trump = as_factor(if_else(voted_for == "Trump", "1", "0")), 
         gender = as_factor(gender),
         education = as_factor(education)) 

# Create the model
voter_preference_model <- 
  stan_glm(
    vote_for_Trump ~ gender + education + age,
    data = voter_data,
    family = binomial(link = "logit"),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    seed = 2022
  )

# Save the model
saveRDS(
  voter_preference_model,
  file = "model/2022_cces_voter_model.rds" 
)