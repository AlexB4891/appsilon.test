#' Get the ship that share the same ship type
#'
#' @param ship_data Data set with the ship travel information
#' @param type_of_ship Type of the ship we are interested in
#'
#' @return 
#' 
#' `Vector` with the names that are of the selected type
#' 
#' @export
#'
#' @examples
#' 
#' filter_ship_type(ship_data = ship_data,type_of_ship = "Cargo")
#' 



travel_ship_description <- function(ship_subset){
  
  
  ship_subset <- ship_subset %>% 
    tibble::rowid_to_column() 
  
  point_1 <- ship_subset %>%  
    dplyr::slice_max(distance_m) %>% 
    dplyr::arrange(dplyr::desc(datetime)) %>% 
    dplyr::slice(1)
    
  point_2 <- ship_subset %>% 
    dplyr::filter(rowid == (point_1$rowid - 1))
  
  two_points <- dplyr::bind_rows(
    point_1,
    point_2
  )
  
  return(two_points)
}

