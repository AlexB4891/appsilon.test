 
###################################
#### CURRENT FILE: DEV SCRIPT #####
###################################

# Engineering

## Dependencies ----
usethis::use_package( "shiny" )
usethis::use_package( "shiny.semantic" )
usethis::use_package( "leaflet" )
usethis::use_package( "dplyr" )
usethis::use_package( "purrr" )
usethis::use_package( "ggplot2" )
usethis::use_package( "tibble" )
usethis::use_package( "tidyr" )
usethis::use_package( "readr" )
usethis::use_package( "forcats" )
usethis::use_package( "stringr" )
usethis::use_package( "lubridate" )
usethis::use_package( "scales" )
usethis::use_package( "shinycssloaders" )
usethis::use_package( "shinyjs" )
usethis::use_package( "shinydashboard" )

## Add modules ----

golem::add_module( name = "mapa" ) # Name of the module
golem::add_module( name = "ship_identification" )
golem::add_module( name = "travel_information" ) 


golem::add_css_file( "style" )

## Add internal datasets ----

usethis::use_data_raw( name = "ship_data", open = FALSE ) 

## Tests ----
## Add one line by test you want to create
usethis::use_test( "app" )

# Documentation

# Github:
usethis::use_github()

# go to dev/03_deploy.R
rstudioapi::navigateToFile("dev/03_deploy.R")

