corr <- function(directory, threshold = 0){
  # Read in all files in the directory
  filelist <- list.files(directory, pattern="*.csv")
  read_one <- function(id1){
    read.csv(paste(directory,"/",id1,sep=""))
  }
  list_files <- lapply(filelist,read_one)
  
  # find out how many complete cases there are for each file
  n_complete_cases <- vapply(list_files, function(x) sum(complete.cases(x)),FUN.VALUE=1)

  # make a subset of files which meet the threshold requirement
  complete_cases <- list_files[n_complete_cases>threshold]
  
  # For those files, calculate correlation between sulfate and nitrate
  getcor <- function(frame){
    cor(frame[,"sulfate"],frame[,"nitrate"],use="complete.obs")
  }
  vapply(complete_cases,getcor,FUN.VALUE=1)
}