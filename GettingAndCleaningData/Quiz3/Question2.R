fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(fileUrl, dest="question2.jpeg", method="curl")

my.jpeg <- readJPEG("question2.jpeg", native=TRUE)

quantile(my.jpeg, probs = c(0.30,0.80))