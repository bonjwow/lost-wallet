#### Preamble ####
# Purpose: Clean the raw data for OLS model
# Authors: Bongju and Najma
# Contacts: bongju.yoo@mail.utoronto.ca and naj.osman@mail.utoronto.ca
# Date: 8 March 2021
# Pre-requisites: None

### Workspace setup
library(haven)
library(tidyverse)
library(janitor)

### Read in the raw data. 
raw_data <- readr::read_csv("inputs/data/behavioral-data.csv")

dfBehavModel <-
  raw_data %>%
  janitor::clean_names() %>%
  select('id',
         'country',
         'country_2',
         'city',
         'institution',
         'cond',
         'response',
         'age',
         'above40',
         'male',
         'computer',
         'other_bystanders') %>%
  ### Remove empty rows
  mutate_all(~ifelse(. %in% c("N/A", "null", ""), NA, .)) %>%
  na.omit()

### Save data 
write_csv(dfBehavModel, "inputs/data/clean_behavioral-data_model.csv")




         