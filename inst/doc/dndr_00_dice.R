## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----libs, echo = FALSE, message = FALSE--------------------------------------
# devtools::install_github("njlyon0/dndR", force = TRUE)
library(dndR)

## ----roll-v1------------------------------------------------------------------
# Roll three six-sided dice
dndR::roll(dice = "3d6")

## ----roll-v2------------------------------------------------------------------
# Roll four four-sided dice and show the per-dice results
dndR::roll(dice = "4d4", show_dice = TRUE)

## ----roll-v3------------------------------------------------------------------
# Re-roll low values (if any)
dndR::roll(dice = "10d10", re_roll = TRUE)

## ----roll-v4------------------------------------------------------------------
# Roll 1d10 and 2d8
dndR::roll(dice = "1d10") + dndR::roll(dice = "2d8")

## ----d20-helper---------------------------------------------------------------
# Roll one twenty-sided die
dndR::d20()

## ----coin-helper--------------------------------------------------------------
# Flip a coin
dndR::coin()

