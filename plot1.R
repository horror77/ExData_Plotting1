#setwd("C:/Users/André/OneDrive/coursera/Exploratory Data Analysis")

#set filepath
file <- "./data/household_power_consumption.txt"
#read data
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#subset data
subset_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#convert to numeric
Global_active_power <- as.numeric(subset_data$Global_active_power)
#create png
png("plot1.png", width=480, height=480)
#create histogramm
hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()