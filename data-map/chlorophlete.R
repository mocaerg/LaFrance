## code to prepare carte dataset

library(tidyverse)
library(sf)


france <- st_read("data-map/FRA_adm5.shp") %>% st_centroid()

ggplot() +
  geom_sf(data = france) +
  theme_void()

carte <- data.frame()

for (i in seq(1,36612,1)) {
  region <- as.list(france$geometry[i])
  
  # for(j in seq(1,length(region[[1]]),1)) {
  #   nb = length(region[[1]][[j]][[1]][,1])
  #   name_region = rep(france$NAME_5[i],nb)
  #   carte <-  carte %>% 
  #     bind_rows(data.frame(name=name_region,
  #                         x= region[[1]][[j]][[1]][,1],
  #                         y= region[[1]][[j]][[1]][,2]
  #                         )
  #             )
  #             
  # }
  
  name_region = rep(france$NAME_5[i],1)
  carte <-  carte %>% 
      bind_rows(data.frame(name=name_region,
                         x= region[[1]][[1]],
                         y= region[[1]][[2]]
                         )
             )
  
}


carte %>% distinct() %>% write_csv("data/carte.csv")
