install.packages("sf")
library(sf)
library(ggplot2)
library(tmap)
library(tmaptools)
library(leaflet)

library(dplyr)

options(scipen = 999)

mydata <- readr::read_csv("median-household-income-county-2017.csv")

#mymap <- st_read("./shp/ne_110m_admin_0_countries.shp", stringAsFactors = FALSE)
mymap <- readOGR(dsn = "./shp/", "ne_110m_admin_0_countries")
str(mymap)


map_and_data <- merge(mymap, mydata, by=NULL)
  
str(map_and_data)

ggplot(mymap)  
  geom_sf(aes(fill = Name))
  
ggplot(map_and_data) + 
  geom_sf(aes(fill = MedianIncome)) +
  scale_fill_gradient(low = "#5681F7", high = "#132843")


