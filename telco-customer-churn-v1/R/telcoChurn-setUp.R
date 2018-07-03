################################################################
## Title: Telco Customer Churn
## Description: Setting up relevant R packages
## Author: Microsoft
################################################################

####################################################################################################
## Install packages
####################################################################################################
## Install packages for data exploration usage
if (!require("devtools"))
    install.packages("devtools")
devtools::install_github("rstudio/d3heatmap")
install.packages("dplyr")
install.packages("gplots")
install.packages("ggplot2")
install.packages("qcc")
install.packages("Rcpp")
install.packages("d3heatmap")
install.packages("GGally")
install.packages("shiny")
install.packages("leaflet")
install.packages("jsonlite")

## Install packages for model building usage
install.packages("unbalanced")
install.packages("rpart")
install.packages("randomForest")
install.packages("Matrix")
install.packages("xgboost")
install.packages("Ckmeans.1d.dp")
install.packages("DiagrammeR")
install.packages("ROCR")
install.packages("pROC")
install.packages("AUC")





