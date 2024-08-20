get_lakes <- function(bb, out_CRS) {
  
  ## Water (internal)
  water <- opq(bb) %>%
    add_osm_feature(key = 'natural', value = 'water') %>%
    osmdata_sf()
  
  # Grab polygons
  mpols <- water$osm_multipolygons
  pols <- water$osm_polygons[!is.na(water$osm_polygons$natural),]
  onlywaterpols <- pols[pols$natural == 'water',]
  
  # Union and combine
  waterpols <- st_union(st_combine(mpols), st_combine(pols))
  
  # Cut water out of islands
  withPonds <- st_difference(islands, waterpols)
  
  #Project to UTM
  utmislandsPonds <- st_transform(withPonds, utm)

  return(utmislandPonds)
  
}