
my.download <- function() {
  fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
  download.file(fileUrl1, dest="data_question3_gdp.csv", method="curl")

  fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
  download.file(fileUrl2, dest="data_question3_edu.csv", method="curl")
}

#my.download()

# Read the data

gdp <- read.csv("data_question3_gdp.csv",header = FALSE, skip=5, stringsAsFactors=FALSE)
edu <- read.csv("data_question3_edu.csv")

# get gdp into better state
library(dplyr)

new.gdp <- gdp %>%
  select(CountryCode=V1, Ranking=V2, Country=V4, GDP=V5) %>%
  subset(CountryCode!="" & Ranking!="")

# try to join the two by CountryCode to see how many ids match
joined.df <- inner_join(new.gdp, edu, by="CountryCode")
nrow(joined.df)

# sort by gdp rank
joined.df$Ranking <- as.numeric(joined.df$Ranking)
joined.df <- arrange(joined.df, desc(Ranking))

print(joined.df[13,"Country"])


# What is the average GDP ranking for the "High income: OECD" and "High income: nonOECD" group?

# group by Income.Group and summarize
joined.df <- group_by(joined.df, Income.Group) 
summary <- summarise(joined.df, AVE=mean(Ranking))
print( subset(summary, subset=Income.Group=="High income: OECD")[["AVE"]]  )
print( subset(summary, subset=Income.Group=="High income: nonOECD")[["AVE"]]  )

# Get quantiles for GDP ranking
quants <- quantile(joined.df$Ranking, probs=seq(0, 1, length.out=6))
joined.df <- mutate(joined.df, Quantiles=cut(Ranking, quants, right=FALSE, include.lowest=TRUE)) %>%
  group_by(Quantiles, add=TRUE) 

summarise(joined.df, count=n())

