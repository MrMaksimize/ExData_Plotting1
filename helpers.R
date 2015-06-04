## Set WD to the location of file
setwd(dirname(parent.frame(2)$ofile))

getData <- function() {
  # Auto Install Packages
  list.of.packages <- c("dplyr", "sqldf", "lubridate")
  new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
  if(length(new.packages)) install.packages(new.packages)
  
  ## Bring in the libs.
  library(dplyr)
  library(sqldf)
  library(lubridate)
  
  
  ## Download datasets if needed.
  if (!file.exists('./household_power_consumption.txt')) {
    if (!file.exists('hcp.zip')) {
      fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
      download.file(fileUrl, destfile="./hcp.zip", method="curl")
    }
    unzip("./hcp.zip", exdir = ".", overwrite = TRUE)
  }
  
  if (!exists('pcons')) {
    pcons <- read.csv.sql(
      'household_power_consumption.txt', 
      sql = "SELECT * FROM file WHERE Date = '1/2/2007' OR Date = '2/2/2007'", 
      sep=";"
    )
    ## Do some Data Prep.
    ## Dates
    pcons <- pcons %>%
      mutate(Date = paste(Date, Time)) %>%
      mutate(Date = parse_date_time(Date, "%d/%m/%Y %H:%M:%S"))
  }
  
  
  pcons
}

