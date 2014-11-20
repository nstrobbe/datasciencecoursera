# Download the file if it doesn't exist
if(!file.exists("data_question1.csv")){
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
  download.file(fileUrl, dest="data_question1.csv", method="curl")
}

df <- read.csv("data_question1.csv")

# households on greater than 10 acres who sold more than $10,000 worth of agriculture products
# ACR : lot size; 10 or more acres corresponds to '3'
# AGS : sales of agriculture products: more than 10k sold corresponds to '6'
agricultureLogical <- with(df, ACR==3 & AGS==6)

# Check which rows are TRUE
which(agricultureLogical) 