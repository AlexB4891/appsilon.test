#' ship_identification UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_ship_identification_ui <- function(id){
  ns <- NS(id)
  tagList(
    div(
      h2("Select the type of the vessel:"),
      shiny::uiOutput(ns("dropdown_type")),
      h2("Select the vessel:"),
      shinycssloaders::withSpinner(shiny::uiOutput(ns("dropdown_id")))
    )
    
    
    
  )
}
    
#' ship_identification Server Functions
#'
#' @noRd 
mod_ship_identification_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    output$dropdown_type <- shiny::renderUI({
      
      type_choices <- names(ship_data)
      
      shiny.semantic::dropdown_input(input_id = ns("ship_type"),
                                     choices = type_choices,
                                     value = "Cargo")
      
    })
    
    
    react_type <- shiny::reactive(shiny::req(input$ship_type))
    
    output$dropdown_id <- shiny::renderUI({
      
      # browser()

      ship_choices <- names(ship_data[[react_type()]])
      
      
      shiny.semantic::dropdown_input(input_id = ns("ship_ident"),
                                     choices = ship_choices,
                                     value = ship_choices[1])
      
    })
    
    
    return(
      list(
        input_ship_type = shiny::reactive(shiny::req(input$ship_type)),
        input_ship_ident = shiny::reactive(shiny::req(input$ship_ident))
      )
    )
    
  })
  
}
