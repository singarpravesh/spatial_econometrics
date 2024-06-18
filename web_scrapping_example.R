# references
https://pure.tue.nl/ws/portalfiles/portal/217900608/Lammes_1462830_ABP_Arentze.pdf

https://www.youtube.com/watch?v=Dkm1d4uMp34

# Load the necessary libraries
library(rvest)
library(dplyr)

# Define the URL for the property listings
url <- "https://www.99acres.com"

# Send a GET request to the URL
page <- read_html("https://www.99acres.com/search/property/buy/kolkata?city=25&keyword=kolkata&preference=S&area_unit=1&res_com=R")


 page %>%  
  html_nodes(".tupleNew__priceValWrap")

page %>% 
  html_elements("div") %>% 
  html_elements("section") %>%
  html_elements("div") %>% 
  html_elements("h2") %>% 
  html_elements("span")


page %>% 
  html_elements("div") %>% 
  html_elements("section") %>%
  html_elements("div") %>% 
  html_elements("h2") %>% 
  html_elements("span")

# Extract the property listings


listings <- page %>% 
  html_nodes(".property-listing") %>% 
  html_nodes("a") %>% 
  html_attr("href")

# Extract the property details
details <- page %>% 
  html_nodes(".property-listing") %>% 
  html_nodes("div") %>% 
  html_text()

# Create a data frame from the extracted data
df <- data.frame(
  Property_URL = listings,
  Property_Details = details
)

# Print the data frame
print(df)




sess <- read_html("https://www.forbes.com/top-colleges/")
sess %>% html_elements("TopColleges2023_rank__6vFzI")


sess$view()
rows <- sess %>% html_elements("#__next > div.HorizontalDefaultLayout_contentWrapper__RvzTK > div > div > div.TopColleges2023_tableBlock__2cW2s > div.TopColleges2023_tableWrapper__o3tS1 > div.TopColleges2023_hasLeftRail__9XJgX > div.TopColleges2023_filters__OXZ1_ > div.TopColleges2023_filtersWrapper__wAM3M > div.TopColleges2023_filtersFirstCol__1lerr")
rows %>% html_text2()

sess %>% html_elements("#__next > div.HorizontalDefaultLayout_contentWrapper__RvzTK > div > div > div.TopColleges2023_tableBlock__2cW2s > div.TopColleges2023_tableWrapper__o3tS1 > div.TopColleges2023_table__4hfbE") %>% html_text2()


rows %>% html_element(".TopColleges2023_organizationName__J1lEV") %>% html_text()
rows %>% html_element(".grant-aid") %>% html_text()

web <- read_html("https://theordinary.com/en-de/100-plant-derived-squalane-face-oil-100398.html")
web %>% html_elements("h1.product-name") %>% html_text()


###################################################################################

library(tidyverse) # for data wrangling
library(RSelenium) # activate Selenium server
library(netstat) # find unused port
library(rvest) # web scrape tables
library(data.table) # for the rbindlist function

rs_driver_object <- rsDriver(browser = "chrome",
                                 chromever = "114.0.5735.90",
                                 port = 9515L)
binman::list_versions("chromedriver")
remDr <- rs_driver_object$client
remDr$navigate("https://www.99acres.com/search/property/buy/kolkata?city=25&preference=S&area_unit=1&res_com=R")



