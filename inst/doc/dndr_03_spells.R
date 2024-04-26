## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----libs, echo = F, message = F----------------------------------------------
# devtools::install_github("njlyon0/dndR", force = TRUE)
library(dndR)

## ----spell_list-v1------------------------------------------------------------
# Find all sorcerer spells that have the word 'bolt' in the name
bolt_df <- dndR::spell_list(name = "bolt", class = "sorcerer")

# Check the structure of that output
str(bolt_df)

## ----spell_list-v2------------------------------------------------------------
# Find all seventh-level necromancy spells in the wizard spell list
necro_df <- dndR::spell_list(school = "necromancy", class = "wizard", level = 7)

# Check the structure
str(necro_df)

## ----spell_text---------------------------------------------------------------
# Get the Chill Touch spell description
dndR::spell_text(name = "chill touch")

