# plot3.R
# Assumes that the working directory contains the two extracted datasets for the assignment

consumption <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
consumption$datetime <- paste(consumption$Date, consumption$Time)
consumption$datetime <- strptime(consumption$datetime,"%d/%m/%Y %H:%M:%S")
consumption$Date <- as.Date(consumption$Date, "%d/%m/%Y")
consumption$Time <- strptime(consumption$Time,"%H:%M:%S")
consumption$Global_active_power <- as.numeric(consumption$Global_active_power)
consumption$Global_reactive_power <- as.numeric(consumption$Global_reactive_power)
consumption$Voltage <- as.numeric(consumption$Voltage)
consumption$Global_intensity <- as.numeric(consumption$Global_intensity)
consumption$Sub_metering_1 <- as.numeric(consumption$Sub_metering_1)
consumption$Sub_metering_2 <- as.numeric(consumption$Sub_metering_2)
consumption$Sub_metering_3 <- as.numeric(consumption$Sub_metering_3)
data <- subset(consumption, Date == as.Date("01/02/2007", "%d/%m/%Y") | 
	Date == as.Date("02/02/2007", "%d/%m/%Y"))
plot(data$datetime, data$Sub_metering_1, type="l", main = NULL, xlab= "",
	ylab = "Energy sub metering")
points(data$datetime,data$Sub_metering_2, type = "l", col = "red")
points(data$datetime,data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
	legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()