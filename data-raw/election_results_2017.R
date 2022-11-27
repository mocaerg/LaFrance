## code to prepare `election_results_2017` dataset

library(tidyverse)
library(readxl)


results <-readxl::read_xls("data-raw/Presidentielle_2017_Resultats_Communes_Tour_1_c.xls", skip = 3) %>%
                          janitor::clean_names() %>%
                          dplyr::select(-starts_with(c("percent","n_panneau","sexe_")))


election_results_2017 <- results %>%
                         dplyr::select(1:10,11,12,13) %>%
                         dplyr::rename(nom = starts_with("nom"),prenom = starts_with("prenom"),voix = starts_with("voix")) %>%
                         dplyr::bind_rows( results %>%
                                           dplyr::select(1:10,14,15,16) %>%
                                           dplyr::rename(nom = dplyr::starts_with("nom"),prenom = dplyr::starts_with("prenom"),voix = dplyr::starts_with("voix"))
                                           ) %>%
                         dplyr::bind_rows( results %>%
                                           dplyr::select(1:10,17,18,19) %>%
                                           dplyr::rename(nom = dplyr::starts_with("nom"),prenom = dplyr::starts_with("prenom"),voix = dplyr::starts_with("voix"))
                                          ) %>%
                         dplyr::bind_rows( results %>%
                                           dplyr::select(1:10,20,21,22) %>%
                                           dplyr::rename(nom = dplyr::starts_with("nom"),prenom = dplyr::starts_with("prenom"),voix = dplyr::starts_with("voix"))
                                          ) %>%
                         dplyr::bind_rows( results %>%
                                           dplyr::select(1:10,23,24,25) %>%
                                           dplyr::rename(nom = dplyr::starts_with("nom"),prenom = dplyr::starts_with("prenom"),voix = dplyr::starts_with("voix"))
                                          ) %>%
                         dplyr::bind_rows( results %>%
                                           dplyr::select(1:10,26,27,28) %>%
                                           dplyr::rename(nom = dplyr::starts_with("nom"),prenom = dplyr::starts_with("prenom"),voix = dplyr::starts_with("voix"))
                                          ) %>%
                         dplyr::bind_rows( results %>%
                                           dplyr::select(1:10,29,30,31) %>%
                                           dplyr::rename(nom = dplyr::starts_with("nom"),prenom = dplyr::starts_with("prenom"),voix = dplyr::starts_with("voix"))
                                          ) %>%
                         dplyr::bind_rows( results %>%
                                           dplyr::select(1:10,32,33,34) %>%
                                           dplyr::rename(nom = dplyr::starts_with("nom"),prenom = dplyr::starts_with("prenom"),voix = dplyr::starts_with("voix"))
                                          ) %>%
                         dplyr::bind_rows( results %>%
                                           dplyr::select(1:10,35,36,37) %>%
                                           dplyr::rename(nom = dplyr::starts_with("nom"),prenom = dplyr::starts_with("prenom"),voix = dplyr::starts_with("voix"))
                                          ) %>%
                         dplyr::bind_rows( results %>%
                                           dplyr::select(1:10,38,39,40) %>%
                                           dplyr::rename(nom = dplyr::starts_with("nom"),prenom = dplyr::starts_with("prenom"),voix = dplyr::starts_with("voix"))
                                          ) %>%
                         dplyr::bind_rows( results %>%
                                          dplyr::select(1:10,41,42,43) %>%
                                          dplyr::rename(nom = dplyr::starts_with("nom"),prenom = dplyr::starts_with("prenom"),voix = dplyr::starts_with("voix"))
                                          )


election_results_2017 %>%  write_csv("data/election_2017.csv")
#election_results_2017 %>% distinct(libelle_du_departement) %>% write_csv("data/departement.csv")

