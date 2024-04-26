## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----libs, echo = F, message = F----------------------------------------------
# devtools::install_github("njlyon0/dndR", force = TRUE)
library(dndR)

## ----creature_list------------------------------------------------------------
# Find all small creatures with 'goblin' in their name
gobbo_df <- dndR::creature_list(name = "goblin", size = "small")

# Check the structure of that output
str(gobbo_df)

## ----creature_text------------------------------------------------------------
# Get the information for a hunter shark
shark_df <- dndR::creature_text(name = "hunter shark")

# Check that out
head(shark_df, n = 7)

## ----cr_convert---------------------------------------------------------------
# Convert a CR of 5 into equivalent XP
dndR::cr_convert(cr = 5)

## ----monster_stats------------------------------------------------------------
# Find the statistics of a single creature worth 8,000 XP
dndR::monster_stats(xp = 8000)

## ----monster_creator----------------------------------------------------------
# Make a monster for a 4-person party of level 5
dndR::monster_creator(party_level = 5, party_size = 4)

