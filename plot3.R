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
Sub_metering_1 <- as.numeric(subset_data$Sub_metering_1)
Sub_metering_2 <- as.numeric(subset_data$Sub_metering_2)
Sub_metering_3 <- as.numeric(subset_data$Sub_metering_3)
#create png
png("plot3.png", width=480, height=480)
#plot data
plot(date_time, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(date_time, Sub_metering_2, type="l", col="red")
lines(date_time, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()