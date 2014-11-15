# Open a url connection the html page
url.con <- url("http://biostat.jhsph.edu/~jleek/contact.html")

# read the page
htmlcode <- readLines(url.con)

# always close the connection when no longer needed
close(url.con)

# Print the number of characters on the 10th, 20th, 30th and 100th line
print( nchar(htmlcode[c(10,20,30,100)]) )

