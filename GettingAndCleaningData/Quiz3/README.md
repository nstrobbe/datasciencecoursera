## Quiz 3 


### Question 1

The American Community Survey distributes downloadable data about United States 
communities. Download the 2006 microdata survey about housing for the state of 
Idaho using download.file() from here: 

https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv 

and load the data into R. The code book, describing the variable names is here: 

https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf 

Create a logical vector that identifies the households on greater than 10 acres who sold more than $10,000 worth of agriculture products. Assign that logical vector to the variable agricultureLogical. Apply the which() function like this to identify the rows of the data frame where the logical vector is TRUE. which(agricultureLogical) What are the first 3 values that result?

--> Answer: 125 238 262

--------------------------------------------------------

### Question 2

Using the jpeg package read in the following picture of your instructor into R 

https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg 

Use the parameter native=TRUE. What are the 30th and 80th quantiles of the resulting data? (some Linux systems may produce an answer 638 different for the 30th quantile)

```
install.packages("jpeg")
```

--> Answer: -15259150 -10575416

--------------------------------------------------------

### Question 3

Load the Gross Domestic Product data for the 190 ranked countries in this data set: 

https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv 

Load the educational data from this data set: 

https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv 

Match the data based on the country shortcode. How many of the IDs match? 
Sort the data frame in descending order by GDP rank (so United States is last). 
What is the 13th country in the resulting data frame? 

Original data sources: 
http://data.worldbank.org/data-catalog/GDP-ranking-table 
http://data.worldbank.org/data-catalog/ed-stats

--> Answer: 189, "St. Kitts and Nevis"

--------------------------------------------------------

### Question 4

What is the average GDP ranking for the "High income: OECD" and "High income: nonOECD" group?

--> Answer: 32.96667, 91.91304

--------------------------------------------------------

### Question 5

Cut the GDP ranking into 5 separate quantile groups.
Make a table versus Income.Group. 
How many countries are Lower middle income but among the 38 nations with highest GDP?

Answer --> 5

--------------------------------------------------------

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r}
summary(cars)
```

You can also embed plots, for example:

```{r, echo=FALSE}
plot(cars)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
