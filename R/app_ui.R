
my_layout <- shiny.semantic::grid_template(default = list(
  areas = rbind(
    c("title", "map"),
    c("info", "map")
  )
))

#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic 
    shiny.semantic::semanticPage(
      shinyjs::useShinyjs(),
      shiny.semantic::grid(
        shiny.semantic::grid_template(
          default = list(
            areas = rbind(
              c("title", "map"),
              c("info", "map"),
              c("info_2", "info_2")
            ),
            cols_width = c("400px", "1fr"),
            rows_height = c("20%", "60%","20%")
          ),
          mobile = list(
            areas = rbind(
              "title",
              "map",
              "info",
              "info_2"
            ),
            rows_height = c("auto", "auto", "auto"),
            cols_width = c("100%")
          )
        ),
        area_styles = list(title = "margin: 20px;", 
                           info = "margin: 20px;", 
                           user = "margin: 20px;",
                           map = "height: 100vh"),
        title = h2(class = "ui header", icon("fas fa-ship"), div(class = "content", "Ship travel")),
        info = mod_ship_identification_ui("ship_identification_ui_1"),
        info_2 = mod_travel_information_ui("travel_information_ui_1"),
        map =  mod_mapa_ui("mapa_ui_1")    
        
      )
      
    )
  )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
 
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'appsilon.test'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}
