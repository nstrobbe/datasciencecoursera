# reading fixed width files
# for this we use read.fwf

# dataset to use
location <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"

# download the file if it doesn't exist in the working directory yet
if(!file.exists("quiz2_question5.for")){ 
  download.file(location
                , destfile = "quiz2_question5.for"
                , method = "curl")
}

# Read as fixed width file
# Skip the header (4 lines)
data <- read.fwf("quiz2_question5.for"
                 , header = FALSE
                 , skip = 4
                 , widths = c(15, 4, 4, 9, 4, 9, 4, 9, 4))

# Calculate the sum of the 4th column
sum(data[4])