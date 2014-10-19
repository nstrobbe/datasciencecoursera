complete <- function(directory, id = 1:332) {
  # Make list of files
  filelist <- paste0(directory, "/", sprintf("%03d",id), ".csv")
  list_files <- lapply(filelist, read.csv)
  
  # check for each file how many complete cases there are
  n_complete_cases <- vapply(list_files, function(x) sum(complete.cases(x)),FUN.VALUE=1)
  data.frame("id"=id, nobs=n_complete_cases)
}