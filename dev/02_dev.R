# Building a Prod-Ready, Robust Shiny Application.
# 
# README: each step of the dev files is optional, and you don't have to 
# fill every dev scripts before getting started. 
# 01_start.R should be filled at start. 
# 02_dev.R should be used to keep track of your development during the project.
# 03_deploy.R should be used once you need to deploy your app.
# 
# 
###################################
#### CURRENT FILE: DEV SCRIPT #####
###################################

# Engineering

## Dependencies ----
## Add one line by package you want to add as dependency
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
## Create a module infrastructure in R/
golem::add_module( name = "mapa" ) # Name of the module
golem::add_module( name = "ship_identification" )
golem::add_module( name = "travel_information" ) 


golem::add_css_file( "style" )

## Add internal datasets ----
## If you have data in your package
usethis::use_data_raw( name = "ship_data", open = FALSE ) 

## Tests ----
## Add one line by test you want to create
usethis::use_test( "app" )

# Documentation

## Vignette 
usethis::use_vignette("appsilon_test")

devtools::build_vignettes()

# Github:
usethis::use_github()

# go to dev/03_deploy.R
rstudioapi::navigateToFile("dev/03_deploy.R")

