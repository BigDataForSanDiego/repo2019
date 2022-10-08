# Extract lat/lon coordinates of bus stops from public transit data

library(geojsonR) # for reading GeoJson file
library(plyr) # for compact function

# load in publicly available transit data as GeoJson
transit_data <- FROM_GeoJson(url_file_string = "transit_stops_datasd.geojson")

transit_features <- transit_data[['features']]

# strips out just lat/lon values from bus stops
get_coords <- function(feature) {
  if(feature[['properties']][['stop_id']] != "") # trolley stops don't have a stop_id, so this filters those out
    return(c(feature[['properties']][['stop_lat']], feature[['properties']][['stop_lon']]))
}

# apply get_coords and remove nulls from trolley stops
transit_coords <- lapply(transit_features, get_coords) %>%
  compact()
  
  
transit_coords <- data.frame(matrix(unlist(transit_coords), ncol=2, byrow=T))

colnames(transit_coords) <- c('lat', 'lon')

# write.csv(transit_coords, "bus_stop_coords.csv")
