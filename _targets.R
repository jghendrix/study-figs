#Targets workflow

# Source ------------------------------------------------------------------
targets::tar_source('R')



# Options -----------------------------------------------------------------
tar_option_set(workspace_on_error = TRUE)

# Defining study area
tar_list <- c(
  tar_target(
    bb,
    c(
      xmin = -54.3533,
      ymin = 49.5194,
      xmax = -53.954220,
      ymax = 49.763834
    )
  ),
  
  tar_target(utm,
             st_crs(32621)),
  
  # Get data from cloud
  
  tar_target(land,
             get_coastline(bb, utm)),
  
  tar_target(lakes,
             get_lakes(bb, utm)),
  
  tar_target(roads,
             get_roads(bb, utm)),
  
  tar_target(map,
             plot_map(
               land = land,
               lakes = lakes,
               roads = roads
             ))
  ,
  
  tar_file(map_file,
           ggsave('graphics/map_file.png',
                  map)),
  
  tar_file_read(fake_data,
                'input/data.csv',
                fread(!!.x))
)
