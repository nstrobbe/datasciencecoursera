pollutantmean <- function(directory, pollutant, id = 1:332) {
  # Start by reading in the required files for given id list
  # make small function to read in one file to be passed to lapply
  read_one <- function(id){
    read.csv(paste(directory,"/",sprintf("%03d",id),".csv",sep=""))
  }
  list_files <- lapply(id,read_one)
  # now get info on pollutant in these files
  # first get all information combined, before calculating mean
  info_poll <- lapply(list_files,"[[",pollutant)
  # put everything in one big vector
  info_poll_vec <- unlist(info_poll)
  # compute mean, ignore NA values and output in specified precision 
  #sprintf("%.3f",mean(info_poll_vec,na.rm=TRUE))
  mean(info_poll_vec,na.rm=TRUE)
}