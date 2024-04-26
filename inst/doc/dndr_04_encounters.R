## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----libs, echo = F, message = F----------------------------------------------
# devtools::install_github("njlyon0/dndR", force = TRUE)
library(dndR)

## ----encounter_creator--------------------------------------------------------
# Pick a hard set of creatures for a four-person party of 3rd level characters
dndR::encounter_creator(party_level = 3, party_size = 4, difficulty = "hard")

## ----xp_pool------------------------------------------------------------------
# How much XP is available for a hard encounter for the four-person, 3rd level party?
dndR::xp_pool(party_level = 3, party_size = 4, difficulty = "hard")

## ----xp_cost------------------------------------------------------------------
# Identify 'realized' XP of two monsters worth a total of 1,000 XP versus our party
dndR::xp_cost(monster_xp = 1000, monster_count = 2, party_size = 4)

