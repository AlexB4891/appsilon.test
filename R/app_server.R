#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  # Your application server logic 
  # To be copied in the server
  
  ship_information <- mod_ship_identification_server("ship_identification_ui_1")
  
  map_information <- mod_mapa_server(id = "mapa_ui_1",
                                     ship_identification = ship_information$input_ship_ident,
                                     ship_types = ship_information$input_ship_type)
  
  mod_travel_information_server("travel_information_ui_1",
                                total_dstnc = map_information$total_distance,
                                times_prk = map_information$times_parked,
                                mean_spd = map_information$mean_speed,
                                dates_total = map_information$dates_total_distance,
                                max_dstnc = map_information$max_distance,
                                dates_max = map_information$dates_max_distance)
}
