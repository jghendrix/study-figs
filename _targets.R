#Targets workflow

# Source ------------------------------------------------------------------
targets::tar_source('R')



# Options -----------------------------------------------------------------
#tar_option_set(format = 'qs')

# Defining study area
tar_list <- c(
  tar_target(
  bb,
  c(xmin = -54.3533,
          ymin = 49.5194,
          xmax = -53.954220,
          ymax = 49.763834)),
  
  tar_target(
    utm,
    st_crs('+proj=utm +zone=21 ellps=WGS84')
  ),

# Get data from cloud

tar_target(
  land,
  get_coastline(bb, utm)),

tar_target(
  lakes,
  get_lakes(bb, utm)
),

tar_target(
  roads,
  get_roads(bb, utm)
)#,

#tar_target(
#  map,
#  plot_spatial(land, lakes, roads, plot_theme, palette)
)




