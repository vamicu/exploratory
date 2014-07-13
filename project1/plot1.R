# plot1.R
# Assumes that the working directory contains the two extracted datasets for the assignment

consumption <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
consumption$Date <- as.Date(consumption$Date, "%d/%m/%Y")
consumption$Time <- strptime(consumption$Time,"%H:%M:%S")
consumption$Global_active_power <- as.double(consumption$Global_active_power)
consumption$Global_reactive_power <- as.double(consumption$Global_reactive_power)
consumption$Voltage <- as.double(consumption$Voltage)
consumption$Global_intensity <- as.double(consumption$Global_intensity)
consumption$Sub_metering_1 <- as.double(consumption$Sub_metering_1)
consumption$Sub_metering_2 <- as.double(consumption$Sub_metering_2)
consumption$Sub_metering_3 <- as.double(consumption$Sub_metering_3)
data <- subset(consumption, Date == as.Date("01/02/2007", "%d/%m/%Y") | 
	Date == as.Date("02/02/2007", "%d/%m/%Y"))
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
	ylab = "Frequency", col="orangered")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()