#' randoMForestModel
#' @title Random Forest Model
#' @description Build Random Forest Model.
#' @param eqn formula
#' @param df data.frame
#' @importFrom randomForest randomForest
#' randomForestModel( Species ~ .,  iris)
randomForestModel <- function(eqn, df){
  randomForest::randomForest(eqn, data = df, importance = TRUE)
}
