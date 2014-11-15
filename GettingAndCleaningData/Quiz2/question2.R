# Download the input if it is not in the working directory
url.name <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
if(!file.exists("quiz2_question2.csv")){ 
    download.file(url.name
                  , destfile = "quiz2_question2.csv"
                  , method = "curl")
}

# Read in the data
acs <- read.csv("quiz2_question2.csv")

# Question to answer: 
# Which of the following commands will select only the data for the probability weights pwgtp1 with ages less than 50?

# Do it the 'R' way first
Rway <- acs[acs$AGEP < 50,]["pwgtp1"]
rownames( Rway ) <- seq_len( nrow( Rway ) ) # needed to make identical work, otherwise rownames are not the same. 

# Now try the SQL command
SQLway <- sqldf("select pwgtp1 from acs where AGEP < 50")

# check that both are indeed identical
identical(Rway, SQLway)


# Question 3: equivalent function to unique(acs$AGEP)

sqldf("select distinct AGEP from acs")

