# Read data set
if(!file.exists("../original_data_set")){dir.create("../original_data_set")}
data_set_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(data_set_url,
              destfile="../original_data_set/household_power_consumption.zip")

# Unzip dataSet
unzip(zipfile="../original_data_set/household_power_consumption.zip",
      exdir="../original_data_set")

# Read table:
the_table <- read.table("../original_data_set/household_power_consumption.txt", 
                        header=TRUE, sep=";", na.strings = "?", 
                        colClasses = c('character','character','numeric',
                                       'numeric','numeric','numeric',
                                       'numeric','numeric','numeric'))

# Convert the Date variable to Type Date
the_table$Date <- as.Date(the_table$Date, "%d/%m/%Y")

# Subset the data from the dates 2007-02-01 and 2007-02-02
the_table <- subset(the_table, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

# Remove incomplete observation
the_table <- the_table[complete.cases(the_table),]

# Combine Date and Time column
date_and_time <- paste(the_table$Date, the_table$Time)

# Set name to the date_and_time vector
date_and_time <- setNames(date_and_time, "DateAndTime")

# Remove Date and Time column
the_table <- the_table[ ,!(names(the_table) %in% c("Date","Time"))]

# Add DateAndTime column to the_table
the_table <- cbind(date_and_time, the_table)

# Convert the DateAndTime variable to Type POSIXct
the_table$date_and_time <- as.POSIXct(date_and_time)
