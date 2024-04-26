## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----libs, echo = FALSE, message = FALSE--------------------------------------
# devtools::install_github("njlyon0/dndR", force = TRUE)
library(dndR)

## ----ability_scores-----------------------------------------------------------
# Roll for ability scores using the '4d6 drop lowest' method
dndR::ability_scores(method = "4d6")

## ----pc_creator---------------------------------------------------------------
# Create a half orc barbarian
dndR::pc_creator(class = 'barbarian', race = 'half orc', score_method = "4d6")

## ----pc_creator-helpers-------------------------------------------------------
# Identify supported character races
dndR::dnd_races()

# Identify supported character classes
dndR::dnd_classes()

## ----mod_calc-----------------------------------------------------------------
# What is the roll modifier for an ability score of 15?
dndR::mod_calc(score = 15)

## ----pc_level_calc------------------------------------------------------------
# What level is a player character that earned 8,250 XP?
dndR::pc_level_calc(player_xp = 8250)

## ----npc_creator--------------------------------------------------------------
# Make three NPCs
dndR::npc_creator(npc_count = 3)

