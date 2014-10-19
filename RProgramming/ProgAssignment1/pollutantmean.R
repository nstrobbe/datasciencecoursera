pollutantmean <- function(directory, pollutant, id = 1:332) {
  # Start by reading in the required files for given id list
  filelist <- paste0(directory, "/", sprintf("%03d",id), ".csv")
  list_files <- lapply(filelist, read.csv)
  
  # now get info on pollutant in these files
  # first get all information
  info_poll <- lapply(list_files,"[[",pollutant)

  # put everything in one big vector as we want the mean of everything
  info_poll_vec <- unlist(info_poll)
  
  # compute mean, ignore NA values 
  mean(info_poll_vec,na.rm=TRUE)
}