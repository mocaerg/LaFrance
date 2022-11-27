

## code to make link betwwen carte and election data

library(tidyverse)


carte <- read_csv("data/carte.csv")

election_2017 <- read_csv("data/election_2017.csv") 
                  mutate(abstention = abstentions/inscrits*100,name = libelle_de_la_commune) %>%
                  select(name,abstention)


carte <- carte %>% 
          left_join(election_2017) %>% 
          mutate(abstention = if_else(is.na(abstention),0,abstention)) %>% 
          distinct()


carte %>% write_csv("data/carte.csv")
