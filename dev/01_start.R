
########################################
#### CURRENT FILE: ON START SCRIPT #####
########################################

## DESCRIPTION ----

golem::fill_desc(
  pkg_name = "appsilon.test", # The Name of the package containing the App 
  pkg_title = "app.pkg", # The Title of the package containing the App 
  pkg_description = "This package contains the code for the app I develope for my Appsilon app", # The Description of the package containing the App 
  author_first_name = "Alex", # Your First Name
  author_last_name = "Bajaña", # Your Last Name
  author_email = "alexb.inf.4891@gmail.com", # Your Email
  repo_url = "https://github.com/AlexB4891/appsilon.test.git" # The URL of the GitHub Repo (optional) 
)     

## Set {golem} options ----
golem::set_golem_options()

## Create Common Files ----

usethis::use_mit_license( "Golem User" )  # You can set another license here
usethis::use_readme_rmd( open = FALSE )
usethis::use_code_of_conduct()
usethis::use_lifecycle_badge( "Experimental" )
usethis::use_news_md( open = FALSE )

## Use git ----
usethis::use_git()

## Init Testing Infrastructure ----
## Create a template for tests
golem::use_recommended_tests()

## Use Recommended Packages ----
golem::use_recommended_deps()

## Favicon ----
# If you want to change the favicon (default is golem's one)
golem::use_favicon() # path = "path/to/ico". Can be an online file. 
golem::remove_favicon()

## Add helper functions ----
golem::use_utils_ui()
golem::use_utils_server()

# go to dev/02_dev.R
rstudioapi::navigateToFile( "dev/02_dev.R" )

