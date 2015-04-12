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
Global_reactive_power <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
Sub_metering_1 <- as.numeric(subSetData$Sub_metering_1)
Sub_metering_2 <- as.numeric(subSetData$Sub_metering_2)
Sub_metering_3 <- as.numeric(subSetData$Sub_metering_3)


#create png
png("plot4.png", width=480, height=480)
#create 2 rows, 2 columns
par(mfrow = c(2, 2)) 
#create plots
plot(date_time, Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(date_time, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(date_time, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(date_time, Sub_metering_2, type="l", col="red")
lines(date_time, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(date_time, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()