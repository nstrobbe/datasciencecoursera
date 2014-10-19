complete <- function(directory, id = 1:332) {
  read_one <- function(id1){
    read.csv(paste(directory,"/",sprintf("%03d",id1),".csv",sep=""))
  }
  list_files <- lapply(id,read_one)

  # check for each file how many complete cases there are
  n_complete_cases <- vapply(list_files, function(x) sum(complete.cases(x)),FUN.VALUE=1)
  data.frame("id"=id, nobs=n_complete_cases)
}