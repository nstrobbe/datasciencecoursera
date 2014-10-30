# Make a bunch of utility functions that will be called by the different scripts

# Get the list of states out of the dataframe
# Sort alphabetically
getStates <- function(df){
    all.states <- df[,"State"]
    sort(unique(all.states))
}

# Basic ranking functionality
# Takes a data frame and a column it will use to sort
# Returns an ordered list of Hospital.Name (by default)
getRanking <- function(df, col.to.use, col.to.return="Hospital.Name"){
    # put the col.to.use to be numeric
    df[,col.to.use] <- as.numeric(df[,col.to.use])
    
    # get the correct order, ignore NA's
    right.order <- order(df[,col.to.use], df[,"Hospital.Name"], na.last=NA)
    
    # get the hospital names in the correct order
    df[right.order,col.to.return]
}

# Get the hospital in given state, with rank 'rank' for given outcome
getRankInState <- function(state, df, col.to.use, rank){
    # Get the info on this state
    df.state = df[df[["State"]]==state,]

    # Get the full ranking for that state and outcome
    full.ranking <- getRanking(df.state,col.to.use)
    
    # Return the right rank
    if (rank == "best") {
        full.ranking[1]
    } else if (rank == "worst") {
        full.ranking[length(full.ranking)]
    } else if (rank > length(full.ranking)){
        as.character(NA)
    } else {
        full.ranking[rank]
    }    
}
