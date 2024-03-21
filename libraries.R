# #######################################
# Load all necessary packages
#########################################
# Add new required packages here


if (!"shiny" %in% rownames(installed.packages())){install.packages("shiny")} 
if (!"shinythemes" %in% rownames(installed.packages())){install.packages("shinythemes")} 
if (!"shinydashboard" %in% rownames(installed.packages())){install.packages("shinydashboard")} 
if (!"shinyjs" %in% rownames(installed.packages())){install.packages("shinyjs")}    
if (!"shinyWidgets" %in% rownames(installed.packages())){install.packages("shinyWidgets")} 
if (!"matrixStats" %in% rownames(installed.packages())){install.packages("matrixStats")} 
if (!"rstudioapi" %in% rownames(installed.packages())){install.packages("rstudioapi")} 
if (!"xtable" %in% rownames(installed.packages())){install.packages("xtable")} 
if (!"Hmisc" %in% rownames(installed.packages())){install.packages("Hmisc")}    
if (!"tidyverse" %in% rownames(installed.packages())){install.packages("tidyverse")}  
if (!"openxlsx" %in% rownames(installed.packages())){install.packages("openxlsx")}  
if (!"readxl" %in% rownames(installed.packages())){install.packages("readxl")}  
if (!"data.table" %in% rownames(installed.packages())){install.packages("data.table")}
if (!"readstata13" %in% rownames(installed.packages())){install.packages("readstata13")}
if (!"V8" %in% rownames(installed.packages())){install.packages("V8")}
if (!"ggplot2" %in% rownames(installed.packages())){install.packages("ggplot2")}  
if (!"knitr" %in% rownames(installed.packages())){install.packages("knitr")}  
if (!"RColorBrewer" %in% rownames(installed.packages())){install.packages("RColorBrewer")}  
if (!"scales" %in% rownames(installed.packages())){install.packages("scales")}
if (!"tidyr" %in% rownames(installed.packages())){install.packages("tidyr")}
if (!"grid" %in% rownames(installed.packages())){install.packages("grid")}
if (!"rmarkdown" %in% rownames(installed.packages())){install.packages("rmarkdown")}
if (!"reshape2" %in% rownames(installed.packages())){install.packages("reshape2")}
if (!"plyr" %in% rownames(installed.packages())){install.packages("plyr")}
if (!"dplyr" %in% rownames(installed.packages())){install.packages("dplyr")}
if (!"data.table" %in% rownames(installed.packages())){install.packages("data.table")}
if (!"shinyBS" %in% rownames(installed.packages())){install.packages("shinyBS")}
if (!"plotly" %in% rownames(installed.packages())){install.packages("plotly")}
if (!"BH" %in% rownames(installed.packages())){install.packages("BH")}
if (!"shinyWidgets" %in% rownames(installed.packages())){install.packages("shinyWidgets")}
if (!"reticulate" %in% rownames(installed.packages())){install.packages("reticulate")}
if (!"shinycssloaders" %in% rownames(installed.packages())){install.packages("shinycssloaders")}
if (!"rjson" %in% rownames(installed.packages())){install.packages("rjson")}
if (!"yaml" %in% rownames(installed.packages())){install.packages("yaml")}
#if (!"urbnmapr" %in% rownames(installed.packages())){install.packages("urbnmapr")}
#note: this library needs to be downloaded from github
#devtools::install_github("UrbanInstitute/urbnmapr", force = TRUE)
if (!"rstudioapi" %in% rownames(installed.packages())){install.packages("rstudioapi")}
if (!"pivottabler" %in% rownames(installed.packages())){install.packages("pivottabler")}
if (!"ggiraph" %in% rownames(installed.packages())){install.packages("ggiraph")}
if (!"here" %in% rownames(installed.packages())){install.packages("here")}

library(shiny)
library(shinythemes)
library(shinydashboard)
library(shinyjs)
library(shinyWidgets)
library(matrixStats)
library(rstudioapi)
library(xtable)
library(Hmisc)
library(tidyverse)
library(openxlsx)
library(readxl)
library(data.table)
library(readstata13)
library(V8)
library(ggplot2)
library(knitr)
library(RColorBrewer)
library(scales)
library(tidyr)
library(grid)
library(rmarkdown)
library(reshape2)
library(data.table)
library(shinyBS)
library(plotly)
library(BH)
library(shinyWidgets)
library(reticulate)
library(shinycssloaders)
library(rjson)
library(yaml)
#library(urbnmapr)
library(rstudioapi)
library(pivottabler)
library(ggiraph)
library(here)

# !!! IMPORTANT !!!
# Load dplyr and plyr in the right order (to avoid functions override)
if("dplyr" %in% (.packages())){
  detach("package:dplyr", unload=TRUE) 
} 
if("plyr" %in% (.packages())){
  detach("package:plyr", unload=TRUE) 
} 

library(plyr)
library(dplyr)

