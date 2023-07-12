## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE,comment = "#>")

## ----install-libraries, echo = F, message = F---------------------------------
# devtools::install_github("njlyon0/dndR", force = TRUE)
library(dplyr); library(ggplot2); library(magrittr); library(tidyr)

## ----library, message = F-----------------------------------------------------
# devtools::install_github("njlyon0/dndR")
library(dndR)

## ----roll_fxn_1---------------------------------------------------------------
dndR::roll('3d6')
dndR::roll('3d8') + dndR::roll('1d4')

## ----roll_fxn_2---------------------------------------------------------------
dndR::roll(dice = '2d20')

## ----prob_plot_fxn, warning = F, error = F, fig.height = 3, fig.width = 6, fig.align = "center"----
dndR::probability_plot(dice = "2d6", roll_num = 499)

## ----pc_creator_fxn-----------------------------------------------------------
dndR::pc_creator(class = 'barbarian', race = 'half orc', score_method = "4d6")

## ----ability_scores_fxn-------------------------------------------------------
dndR::ability_scores(method = "4d6")

## ----pc_level_calc------------------------------------------------------------
dndR::pc_level_calc(player_xp = 4100)

## ----spell_list_fxn-----------------------------------------------------------
dndR::spell_list(name = "bolt", class = "sorcerer", ritual = FALSE)

## ----spell_text_fxn-----------------------------------------------------------
dndR::spell_text(name = "chill touch")

## ----xp_pool_fxn--------------------------------------------------------------
dndR::xp_pool(party_level = 2, party_size = 4, difficulty = "medium")

## ----xp_cost_fxn--------------------------------------------------------------
dndR::xp_cost(monster_xp = 1000, monster_count = 2, party_size = 3)

## ----xp_demonstration_1-------------------------------------------------------
dndR::xp_pool(party_level = 3, party_size = 4, difficulty = 'hard')

## ----xp_demonstration_2-------------------------------------------------------
dndR::xp_cost(monster_xp = 500, monster_count = 2, party_size = 4)

## ----xp_demonstration_3-------------------------------------------------------
dndR::xp_cost(monster_xp = 750, monster_count = 3, party_size = 4)

## ----xp_demonstration_4-------------------------------------------------------
dndR::xp_cost(monster_xp = 600, monster_count = 3, party_size = 4)

## ----party_diagram_1, fig.height = 6, fig.width = 6, fig.align = "center"-----
# Create named list of PCs and their scores
party_list <- list(Vax = list(STR = "10", DEX = "13", CON = "14", 
                              INT = "15", WIS = "16", CHA = "12"),
                   Beldra = list(STR = "20", DEX = "15", CON = "10",
                                 INT = "10", WIS = "11", CHA = "12"),
                   Rook = list(STR = "10", DEX = "10", CON = "18", 
                               INT = "9", WIS = "11", CHA = "16"))

# Create a party diagram using that list (by player)
dndR::party_diagram(by = "player", pc_stats = party_list, quiet = TRUE)

## ----party_diagram_2, fig.height = 6, fig.width = 6, fig.align = "center"-----
dndR::party_diagram(by = "ability", pc_stats = party_list, quiet = TRUE)

## ----npc_creator--------------------------------------------------------------
dndR::npc_creator(npc_count = 2)

## ----monster_stats_fxn1-------------------------------------------------------
dndR::monster_stats(xp = 1000, cr = 4)

## ----monster_stats_fxn2-------------------------------------------------------
dndR::monster_stats(xp = 8000)

## ----monster_creator----------------------------------------------------------
dndR::monster_creator(party_level = 5, party_size = 4)

## ----xp-pool-plot, echo = F, warning = F, error = F, fig.height = 4, fig.width = 4, fig.align = "center"----
xp_df <- data.frame('pc_level' = 1:20,
                    'easy_xp' = c(25, 50, 75, 125, 250, 300, 350, 450, 550, 600, 800, 1000, 1100, 1250, 1400, 1600, 2000, 2100, 2400, 2800)
                    ) %>%
  # For each row...
  dplyr::rowwise() %>%
  # Calculate the XP for that party level using my function
  dplyr::mutate(calc_xp = dndR::xp_pool(party_level = pc_level,
                                        party_size = 1,
                                        difficulty = 'easy')) %>%
  # Rename a column more intuitively
  dplyr::rename(book_xp = easy_xp) %>%
  # Pivot longer for ease of plotting
  tidyr::pivot_longer(cols = -pc_level, 
                      names_to = 'calc_method',
                      values_to = 'xp') %>%
  # Change the entries of the calc_method column
  dplyr::mutate(
    authority = base::ifelse(test = calc_method == "book_xp",
                             yes = "DMG",
                             no = "dndR"))
# Create the plot
ggplot2::ggplot(xp_df, aes(x = pc_level, y = xp, shape = authority))  +
  geom_point(aes(fill = authority), color = 'black', size = 3,
             pch = rep(x = c(21, 24), times = 20),
             position = position_dodge(width = 0.5)) +
  geom_smooth(aes(color = authority), method = 'loess',
              formula = 'y ~ x', se = FALSE) +
  labs(x = "Party Level", y = "Experience Points (XP)") +
  scale_color_manual(values = c("#f46d43", "#74add1")) +
  scale_fill_manual(values = c("#f46d43", "#74add1")) +
  theme_classic() +
  theme(legend.position = c(0.15, 0.9),
        legend.title = element_blank(),
        axis.text.y = element_text(angle = 90, hjust = 0.5),
        axis.text = element_text(size = 14),
        axis.title = element_text(size = 16))

## ----cr-convert-plot, echo = F, warning = F, error = F, fig.height = 4, fig.width = 4, fig.align = "center"----
cr_actual <- data.frame(
  "cr" = c(0, 0.125, 0.25, 0.5, 1:30),
  "dmg_xp" = c(0, 25, 50, 100, 200, 450, 700, 1100, 1800, 2300, 2900,
               3900, 5000, 5900, 7200, 8400, 10000, 11500, 13000, 15000,
               18000, 20000, 22000, 25000, 33000, 41000, 50000, 62000,
               75000, 90000, 105000, 120000, 135000, 155000) ) %>%
  # For each row...
  dplyr::rowwise() %>%
  # Calculate XP for a given CR using `cr_convert`
  dplyr::mutate("calc_xp" = dndR::cr_convert(cr = cr)) %>%
  # Pivot to long format
  tidyr::pivot_longer(cols = dplyr::contains('_xp'),
                      names_to = "authority",
                      values_to = "xp") %>%
  # And clean up the entries of the source column
  dplyr::mutate(source = base::ifelse(test = (authority == "calc_xp"),
                                      yes = "dndR", no = "DMG"))
# Creat the plot comparison
ggplot(cr_actual, aes(x = cr, y = xp, shape = source)) +
  # geom_point(size = 3, pch = rep(x = c(17, 19), times = 34),
  #            position = position_dodge(width = 0.5)) +
  geom_point(aes(fill = source), color = 'black', size = 3,
             pch = rep(x = c(21, 24), times = 34),
             position = position_dodge(width = 0.5)) +
  geom_smooth(aes(color = source), method = 'loess',
              formula = 'y ~ x', se = FALSE) +
  # geom_smooth(formula = 'y ~ x', method = 'loess', se = F) +
  labs(x = "Challenge Rating (CR)", y = "Experience Points (XP)") +
  scale_color_manual(values = c("#c51b7d", "#4d9221")) +
  scale_fill_manual(values = c("#c51b7d", "#4d9221")) +
  theme_classic() +
  theme(legend.position = c(0.2, 0.9),
        legend.title = element_blank(),
        # axis.text.y = element_text(angle = 90, hjust = 0.5, size = 12),
        axis.text.y = element_text(size = 12),
        axis.text.x = element_text(size = 14),
        axis.title = element_text(size = 16))

