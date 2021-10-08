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
    leaflet::leafletOutput("mymap")
  )
}
    
#' mapa Server Functions
#'
#' @noRd 
mod_mapa_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    output$mymap <- leaflet::renderLeaflet({
      ship_data %>% 
        dplyr::select(ship_id,lng = lon_1,lat = lat_1) %>% 
        leaflet::leaflet() %>% 
        leaflet::addTiles() %>%
        leaflet::addCircles()
    })
    
    
  })
}
    
## To be copied in the UI
# mod_mapa_ui("mapa_ui_1")
    
## To be copied in the server
# mod_mapa_server("mapa_ui_1")
