## Get the hospital in state with rank "num" for given outcome
rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    all.data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
    
    ## Check that state is valid
    source("hospital.R")
    states <- getStates(all.data)
    if(!(state %in% states)){
        stop("invalid state")
    }
    
    ## check that outcome is valid
    outcomes <- c("heart attack", "heart failure", "pneumonia")
    outcomes.nr <- c(11,17,23)
    names(outcomes.nr) <- outcomes
    if(!(outcome %in% outcomes)){
        stop("invalid outcome")
    }
    
    ## Return hospital name in state with the given rank for given outcome
    getRankInState(state,all.data,outcomes.nr[outcome],num)
}
