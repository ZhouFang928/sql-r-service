--Set DB
use telcoedw
go

-- Show the serialized model
select * from cdr_models

------------------------------------------------------------------------------------------
-- rxDForest
------------------------------------------------------------------------------------------
-- Step 1 - Train the customer churn model
-- After successful execution, this will create a binary representation of the model
exec generate_cdr_rx_forest;

-- Step 2 - Evaluate the model
-- This uses test data to evaluate the performance of the model.
exec model_evaluate

-- Step 3 - Score the model- In this step, you will invoke the stored procedure predict_cdr_churn_rx_forest
-- The stored procedure uses the rxPredict function to predict the customers that are likely to churn
-- Results are returned as an output dataset
-- Execute scoring procedure
exec predict_cdr_churn_rx_forest 'rxDForest';
go




