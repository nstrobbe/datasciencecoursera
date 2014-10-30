# find the best hospital in a state for a given outcome
best <- function(state, outcome) {
    source("rankhospital.R")
    rankhospital(state,outcome,1)
}
