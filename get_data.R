
library(lubridate)

# Assumptions:
# it's assumed that from current working directory the script
# has access to the data directory which contains data file.

get_data <- function () {
    file <- "./data/household_power_consumption.txt"
    min_date <- dmy("01/02/2007")
    max_date <- dmy("02/02/2007")
    colClasses <- c("character", "character", rep("numeric", 7))
    table_data <- read.table(
        file, header=TRUE, sep=";", colClasses=colClasses, na.strings = "?")
    table_data$Date <- dmy(table_data$Date)
    table_data$Time <- hms(table_data$Time)
    table_data <- subset(table_data, min_date <= Date & Date <= max_date)
    
    table_data
}
