## code to prepare `ship_data` dataset goes here

ship_data <- readr::read_csv("data-raw/ships.csv")

ship_data <- ship_data %>% 
  dplyr::select(-PORT) %>% 
  dplyr::rename_with(.cols = dplyr::everything(),.fn = stringr::str_to_lower)


ship_data <- ship_data %>% 
  dplyr::group_by(ship_id) %>% 
  dplyr::summarise(dplyr::across(.cols = c(datetime,lon,lat),
                                 .fns =  list(min,max),na.rm = T))

usethis::use_data(ship_data, overwrite = TRUE)
