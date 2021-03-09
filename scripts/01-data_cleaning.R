#### Preamble ####
# Purpose: Clean the raw data
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

dfBehav <-
  raw_data %>%
  janitor::clean_names() %>%
  select('id',
         'country',
         'country_2',
         'response') %>%
  ### Remove empty rows
  mutate_all(~ifelse(. %in% c("N/A", "null", ""), NA, .)) %>%
  na.omit()

### Save data 
write_csv(dfBehav, "inputs/data/clean_behavioral-data.csv")




         