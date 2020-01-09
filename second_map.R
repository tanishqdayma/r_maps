library(rgdal)
library(ggplot2)
library(ggmap)

shapefile <- readOGR(dsn = "./shp/", "ne_110m_admin_0_countries")

shapefile_df <- fortify(shapefile)

map <- ggplot() +
geom_path(data = shapefile_df,
  aes(x=long, y=lat, group=group),
  color = 'gray', fill = 'white', size = .2)

print(map)
