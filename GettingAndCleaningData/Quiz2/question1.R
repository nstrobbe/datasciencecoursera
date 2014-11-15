# load relevant libraries
library(httr)
library(jsonlite)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")
#    Output is: 
#    <oauth_endpoint>
#       authorize: https://github.com/login/oauth/authorize
#       access:    https://github.com/login/oauth/access_token

# 2. Register an application at https://github.com/settings/applications;
#    Use any URL you would like for the homepage URL (http://github.com is fine)
#    and http://localhost:1410 as the callback url
#
#    Insert your client ID and secret below - if secret is omitted, it will
#    look it up in the GITHUB_CONSUMER_SECRET environmental variable.
myapp <- oauth_app("github"
                   ,"237b8a7a458637ff0738"
                   , "10016a164d03c48f29be391a9880cf7d14160a85")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github")
                               , myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)

#stop_for_status(req)

# Make content more readable by putting it in a json format, and then making it into a dataframe
json1 <- content(req)
json2 <- jsonlite::fromJSON(toJSON(json1))

# find the time of creation: 
subset(json2, name=="datasharing")["created_at"]
# or 
json2[json2$name=="datasharing",]["created_at"]

