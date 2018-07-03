####################################################################################################
## Title: Telco Customer Churn
## Description: Train the Telco Churn Model with rxDForest
## Author: Microsoft
####################################################################################################

trainModel = function(sqlSettings, trainTable) {
    sqlConnString = sqlSettings$connString

    trainDataSQL <- RxSqlServerData(connectionString = sqlConnString,
                                    table = trainTable,
                                    colInfo = cdrColInfo)

    ## Create training formula
    labelVar = "churn"
    trainVars <- rxGetVarNames(trainDataSQL)
    trainVars <- trainVars[!trainVars %in% c(labelVar)]
    temp <- paste(c(labelVar, paste(trainVars, collapse = "+")), collapse = "~")
    formula <- as.formula(temp)

    ## Train gradient tree boosting with mxFastTree on SQL data source
    library(RevoScaleR)
    rx_forest_model <- rxDForest(formula = formula,
                             data = trainDataSQL,
                             nTree = 8,
                             maxDepth = 16,
                             mTry = 2,
                             minBucket = 1,
                             replace = TRUE,
                             importance = TRUE,
                             seed = 8,
                             parms = list(loss = c(0, 4, 1, 0)))

    return(rx_forest_model)
}