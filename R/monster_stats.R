#' @title Quickly Identify Monster Statistics
#'
#' @description Quickly identify the vital statistics of a single creature worth the provided experience points (XP) or Challenge Rating (CR). Uses the table provided in p. 274-275 of the Dungeon Master's Guide. Accepts Challenge Ratings of 0, '1/8', '1/4, and '1/2' in addition to numbers between 1 and 30. CR is *not necessary* to provide **if** XP is provided.
#'
#' @param xp (numeric) experience point (XP) value of the monster
#' @param cr (numeric) challenge rating (CR) of the monster. Note that this is NOT necessary if XP is provided
#'
#' @return (dataframe) two columns and eight rows
#' @importFrom magrittr %>%
#'
#' @export
#'
monster_stats <- function(xp = NULL, cr = NULL){
  # Squelch visible bindings note
  DMG_XP <- NULL

  # Error out if neither XP nor CR is specified
  if(base::is.null(cr) & base::is.null(xp))
    stop("Either XP or CR must be provided")

  # Print warning if both are specified and they don't match
  if(!base::is.null(cr) & !base::is.null(xp)){
    message("CR and XP both specified, proceeding with CR")
    xp_actual <- dndR::cr_convert(cr = cr) }

  # If CR is provided and XP isn't, calculate XP
  if(!base::is.null(cr) & base::is.null(xp)){
    xp_actual <- dndR::cr_convert(cr = cr) }

  # If only XP is provided just rename the object
  if(base::is.null(cr) & !base::is.null(xp)){
    xp_actual <- xp }

  # Load in the DMG's monster table
  monsters <- dndR::monster_table

  # Identify the relevant row using the provided arguments
  relevant_monster <- monsters %>%
    dplyr::filter(DMG_XP <= xp_actual) %>%
    dplyr::slice_tail() %>%
    # Turn all columns to characters
    dplyr::mutate(dplyr::across(dplyr::everything(), base::as.character)) %>%
    # Pivot to long format to make it easier to visualize
    tidyr::pivot_longer(cols = dplyr::everything(),
                        names_to = "statistic",
                        values_to = "values")

  # Return that row
  return(relevant_monster) }
