library(tidyverse)
library(ggmap)
library(maps)

bude <- geocode("Bude, north cornwall england UK")
gc <- as.data.frame(bude)



Budepath <- get_map("Bude North Cornwall Cricket Club,Bude", zoom = 8)
Waterbude<- get_map(location = c(-4.5413, 50.82435), zoom = 14, maptype = "watercolor")
Roadmap <- get_map(location = c(-4.5413, 50.82435), zoom = 13, maptype = "roadmap")
ggmap(Roadmap)
ggmap(Waterbude)

gc1 <- geocode("Summerleaze beach, Bude EX23 8HN, UK")
gc2 <- geocode("S W Coast Path, Bude EX23 8NE, UK")
gc3 <- geocode("Bude North Cornwall Cricket Club,bude")
bar <- geocode("Bar 35,bude")





### road map
roadmap <- get_map(location = c(-4.5413, 50.82435), zoom = 14, maptype = "roadmap")
ggmap(roadmap)

ggmap(roadmap) +
  geom_point(
    aes(x = -4.5513493 , y = 50.8305399),
    color = "blue", size = 3) +
  geom_point(
    aes(x = -4.5543778 , y = 50.8368307),
    color = "blue", size = 3) +
  geom_point(
    aes(x = -4.5528138 , y = 50.8334672),
    color = "yellow", size = 3) +
  geom_point(
    aes(x = -4.5440883 , y = 50.8301612),
    color = "red", size = 3)

### draw the road from pub to cricket
from <- "Bar 35,bude"
to <- "Bude North Cornwall Cricket Club,bude"
route_df <- route(from, to, structure = "route")
ggmap(roadmap) +  
  geom_path(
    aes(x = lon, y = lat), colour = "red", size = 1.5,
    data = route_df, lineend = "round"
  )

### watermap
Waterbude<- get_map(location = c(-4.5413, 50.82435), zoom = 14, maptype = "watercolor")

ggmap(Waterbude) +
  geom_point(
    aes(x = -4.5513493 , y = 50.8305399),
    color = "blue", size = 3) +
  geom_point(
    aes(x = -4.5543778 , y = 50.8368307),
    color = "blue", size = 3) +
  geom_point(
    aes(x = -4.5528138 , y = 50.8334672),
    color = "yellow", size = 3) +
  geom_point(
    aes(x = -4.5440883 , y = 50.8301612),
    color = "red", size = 3)


### watermap from bar 35 to Bude North Cornwall Cricket Club
###Road


from <- "Bar 35,bude"
to <- "Bude North Cornwall Cricket Club,bude"
route_df <- route(from, to, structure = "route")
ggmap(Waterbude) +  
  geom_path(
    aes(x = lon, y = lat), colour = "red", size = 1.5,
    data = route_df, lineend = "round"
  )
    
    

