## code to prepare `ship_data` dataset goes here

ship_data <- readr::read_csv("data-raw/ships.csv")

ship_data <- ship_data %>%
  dplyr::select(-c(PORT,SHIPTYPE)) %>%
  dplyr::rename_with(.cols = dplyr::everything(),.fn = stringr::str_to_lower)

ship_data <- ship_data %>%
  dplyr::group_by(ship_id) %>%
  dplyr::arrange(datetime) %>%
  dplyr::mutate(diff_time = datetime - dplyr::lag(datetime,n = 1)) %>%
  dplyr::ungroup() %>%
  dplyr::mutate(
    ship_id = as.character(ship_id),
    diff_time = diff_time/360,
    diff_time = as.numeric(diff_time),
    speed_kph = 1.85*speed,
    distance_km = speed_kph * diff_time,
    distance_m = distance_km*1000,
    dplyr::across(
      .cols = c(diff_time,
                diff_time,
                speed_kph,
                distance_km,
                distance_m),
      .fns = ~round(.x,2))
  )

ship_data <- ship_data %>%
  dplyr::group_by(ship_id) %>%
  dplyr::mutate(max_distance = max(distance_m,na.rm = TRUE),
                observations = n()) %>%
  dplyr::ungroup() %>%
  dplyr::filter(max_distance != 0 & observations > 1 )

ship_data <- ship_data %>%
  dplyr::select(-c(speed,heading,course,destination))
gc()

ship_data <- ship_data %>%
  split(.$ship_type) %>%
  purrr::map(~.x %>% split(.$ship_id))

usethis::use_data(ship_data, overwrite = TRUE)
