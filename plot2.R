#setwd("C:/Users/André/OneDrive/coursera/Exploratory Data Analysis")

#set filepath
file <- "./data/household_power_consumption.txt"
#read data
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#subset data
subset_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#date-time conversion
date_time <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#convert to numeric
Global_active_power <- as.numeric(subset_data$Global_active_power)
#create png
png("plot2.png", width=480, height=480)
#create plot
plot(date_time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()