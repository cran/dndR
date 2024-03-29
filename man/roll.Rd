% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/roll.R
\name{roll}
\alias{roll}
\title{Roll Any Number of Dice}
\usage{
roll(dice = "d20", show_dice = FALSE)
}
\arguments{
\item{dice}{(character) number and type of dice to roll specified in Dungeons & Dragons shorthand (e.g., "2d4" for two, four-sided dice). Defaults to a single twenty-sided die (e.g, "1d20")}

\item{show_dice}{(logical) whether to print the values of each individual die included in the total. Defaults to FALSE}
}
\value{
(numeric) sum of specified dice outcomes
}
\description{
Rolls the specified number and type of dice. Dice are specified in the shorthand common to Dungeons & Dragons (i.e., number of dice, "d", number of faces of those dice). Includes an argument for whether each die's value should be returned as a message (rather than just the total of all dice in the roll). Rolling two twenty-sided dice (i.e., "2d20") is assumed to be rolling with advantage/disadvantage so both numbers are returned.
}
\examples{
# Roll your desired dice (i.e., randomly sample the specified die)
roll(dice = "4d6")

# Returned as a number so you can add rolls together or integers
roll('1d20') + 5
roll('2d8') + roll('1d4')

}
