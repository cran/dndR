## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----libs, echo = FALSE, message = FALSE--------------------------------------
# devtools::install_github("njlyon0/dndR", force = TRUE)
library(dndR)

## ----probability_plot, warning = F, error = F, fig.height = 3, fig.width = 6, fig.align = "center"----
# Make a probability plot for two, six-sided dice
dndR::probability_plot(dice = "2d6", roll_num = 499)

## ----party_diagram-v1, fig.height = 6, fig.width = 6, fig.align = "center"----
# Create named list of PCs and their scores
party_list <- list(Vax = list(STR = "10", DEX = "13", CON = "14", 
                              INT = "15", WIS = "16", CHA = "12"),
                   Beldra = list(STR = "20", DEX = "15", CON = "10",
                                 INT = "10", WIS = "11", CHA = "12"),
                   Rook = list(STR = "10", DEX = "10", CON = "18", 
                               INT = "9", WIS = "11", CHA = "16"))

# Create a party diagram using that list (by player)
dndR::party_diagram(by = "player", pc_stats = party_list, quiet = TRUE)

## ----party_diagram-v2, fig.height = 6, fig.width = 6, fig.align = "center"----
# Party diagram grouped by ability score
dndR::party_diagram(by = "ability", pc_stats = party_list, quiet = TRUE)

