#' mapa UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_mapa_ui <- function(id){
  ns <- NS(id)
  tagList(
    shinycssloaders::withSpinner(leaflet::leafletOutput(ns("mymap"),
                                                        height = "79vh"))
  )
}
    
#' mapa Server Functions
#'
#' @noRd 
mod_mapa_server <- function(id,
                            ship_identification,
                            ship_types){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    
    # mod_ship_identification_server("ship_identification_ui_1")
    
    
    filter_ship_type <- shiny::reactive({
      ship_data[[shiny::req(ship_types())]]
    })
    
    
    ship_subset <- shiny::reactive({
      
      filter_ship_type()[[shiny::req(ship_identification())]]
      
    })
    
    
    total_distance <- reactive({
      
      ship_subset() %>% 
        dplyr::pull(distance_m) %>% 
        sum(.,na.rm = T)
      
    })
    
    times_parked <- reactive({
      
      ship_subset() %>% 
        dplyr::pull(is_parked) %>% 
        sum(.,na.rm = T)
      
    })
    
    mean_speed <- reactive({
      
      ship_subset() %>% 
        dplyr::pull(speed_kph) %>% 
        mean(.,na.rm = T)
      
    })
    
    dates_total_distance <- reactive({
      
      ship_subset() %>% 
        dplyr::pull(datetime) %>% 
        purrr::invoke_map(.f = list(min,max),
                          x = .,
                          na.rm = T)
      
    })
    
    
    filter_ship_data <- shiny::reactive({
      ship_subset() %>% 
        travel_ship_description()
    })
    
    
    max_distance <- reactive({
      
      filter_ship_data() %>% 
        dplyr::slice_max(rowid) %>% 
        dplyr::pull(distance_m) 
      
    })
    
    
    dates_max_distance <- reactive({
      
      filter_ship_data() %>% 
        dplyr::pull(datetime) 
      
    })
    
    output$mymap <- leaflet::renderLeaflet({
      
        filter_ship_data() %>% 
          dplyr::select(ship_id,lng = lon,lat = lat) %>% 
          leaflet::leaflet() %>% 
          leaflet::addTiles() %>%
          leaflet::addMarkers(icon = icon("fas fa-ship"))
    })
    
    
    
    return(
      list(
        total_distance = total_distance,
        times_parked = times_parked,
        mean_speed = mean_speed,
        dates_total_distance = dates_total_distance,
        max_distance = max_distance,
        dates_max_distance = dates_max_distance
      )
    )
  })
}
    
