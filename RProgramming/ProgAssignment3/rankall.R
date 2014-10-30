## Get the "num"-ranked hospital for given outcome in each state
rankall <- function(outcome, num = "best") {
    ## Read outcome data
    all.data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
        
    ## Get all states
    source("hospital.R")
    states <- getStates(all.data)
    
    ## Check that outcome is valid
    outcomes <- c("heart attack", "heart failure", "pneumonia")
    outcomes.nr <- c(11,17,23)
    names(outcomes.nr) <- outcomes
    if(!(outcome %in% outcomes)){
        stop("invalid outcome")
    }
    
    ## For each state, find the hospital of the given rank
    rankings <- vapply(states,getRankInState,
                       df=all.data,col.to.use=outcomes.nr[outcome],rank=num,
                       FUN.VALUE="c")
    
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    data.frame(hospital=rankings,state=states)
}
