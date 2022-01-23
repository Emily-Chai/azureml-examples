# plumber.R

## Load the model
modellist = readRDS("irismodel.rds")

#* Liveness check
#* @get /live
function() {
  "alive"
}

#* Readiness check
#* @get /ready
function() {
  "ready"
}


## Lets make the predictions
#* @param Sepal.Length
#* @param Sepal.Width
#* @param Petal.Length
#* @param Petal.Width
#* @get /predict
predictions <- function(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width){
  Sepal.Length <- as.numeric(Sepal.Length )
  Sepal.Width <-  as.numeric(Sepal.Width)
  Petal.Length  <- as.numeric(Petal.Length)
  Petal.Width <-  as.numeric(Petal.Width)
  
  X.new <- data.frame(Sepal.Length= Sepal.Length,
                      Sepal.Width = Sepal.Width ,
                      Petal.Length=Petal.Length,
                      Petal.Width = Petal.Width )
  
  #predict based on input
  ##predict(iris_rf, new_data= X.new, type ="class")
  y.pred <- modellist$NewPredictions(model = modellist$modelobject, newdata = X.new)
  return(y.pred)
}