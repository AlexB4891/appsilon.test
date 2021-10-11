#' travel_information UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_travel_information_ui <- function(id){
  ns <- NS(id)
  tagList(
 
    shiny::uiOutput(ns("textos_prueba"))
  )
}
    
#' travel_information Server Functions
#'
#' @noRd 
mod_travel_information_server <- function(id,
                                          total_dstnc,
                                          times_prk,
                                          mean_spd,
                                          dates_total,
                                          max_dstnc,
                                          dates_max){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    output$textos_prueba <- shiny::renderUI({
      # texto_1 <- str_c("The total distance traveled is: ",total_dstnc())
      # texto_2 <- str_c("During the travel, the ship had parked: ",times_prk()," times")
      # texto_3 <- 
      # texto_4 <- str_c("The ship had traveled from: ",)
      
        shiny.semantic::grid(
          grid_template = shiny.semantic::grid_template(
            default = list(
              areas = rbind(
                c("principal","speed","times","traveldist","datesdist")
              ),
              cols_width = c("20%", "20%", "20%", "20%", "20%"),
              rows_height = c("70px", "70px","70px","70px","70px")
            )
          ),
          area_styles = list(
            principal = "padding-right: 5px; padding-left: 5px",
            speed = "padding-right: 5px; padding-left: 5px",
            times = "padding-right: 5px; padding-left: 5px",
            traveldist = "padding-right: 5px; padding-left: 5px",
            datesdist = "padding-right: 5px; padding-left: 5px"),
          principal =  div(class = "ui message success",
                           style = "border-radius: 0; width: 100%; height: 150px; text-align: center;",
                           div(class = "header", 
                               "Maximum distance traveled ",
                               br(),
                               str_c(max_dstnc()," meters"))),
          speed = shiny.semantic::card(
            style = "border-radius: 0; width: 100%; height: 150px; background: #A7EAE4; text-align: center;",
            div(class = "content",
                div(class = "header", 
                    style = "margin-bottom: 10px",
                    "Mean speed",
                    br(),
                    str_c(round(mean_spd()*1000,2)," m/h")))),
          
          times = shiny.semantic::card(
            style = "border-radius: 0; width: 100%; height: 150px; background: #A7EAE4; text-align: center;",
            div(class = "content",
                div(class = "header", 
                    style = "margin-bottom: 20px",
                    "Times parked",
                    br(),
                    str_c(times_prk())))),
          traveldist = shiny.semantic::card(
            style = "border-radius: 0; width: 100%; height: 150px; background: #A7EAE4; text-align: center;",
            div(class = "content",
                div(class = "header", 
                    style = "margin-bottom: 20px",
                    "Total distance",
                    br(),
                    str_c(total_dstnc(), " meters")))),
          datesdist = shiny.semantic::card(
            style = "border-radius: 0; width: 100%; height: 150px; background: #A7EAE4; text-align: center;",
            div(class = "content",
                div(class = "header", 
                    style = "margin-bottom: 10px",
                    "Travel time",
                    br(),
                    dates_total()[1],
                    br(),
                    "to",
                    br(),
                    dates_total()[2])))
        )
      # ,
      #   
      #   h4(texto_1),
      #   h4(texto_2),
      #   h4(texto_3),
      #   h4(texto_4)
      #   # h4(texto_5),
      #   # h4(texto_6)
      # )
      
      
    })
    
  })
}
    
## To be copied in the UI
# mod_travel_information_ui("travel_information_ui_1")
    
## To be copied in the server
# mod_travel_information_server("travel_information_ui_1")
