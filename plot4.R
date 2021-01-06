dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subset <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

dateTime <- strptime(paste(subset$Date,subset$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
gap <- as.numeric(subset$Global_active_power)
subMetering1 <- as.numeric(subset$Sub_metering_1)
subMetering2 <- as.numeric(subset$Sub_metering_2)
subMetering3 <- as.numeric(subset$Sub_metering_3)
voltage <- as.numeric(subset$Voltage)
grp <- as.numeric(subset$Global_reactive_power)

png("plot4.png", width = 480,height = 480)
par(mfrow = c(2,2))
plot(dateTime, gap, type = "l", cex = 0.2, ylab = "Global Active Power", xlab = "")

plot(dateTime, voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(dateTime,subMetering1,type = "l", ylab = "Energy sub metering", xlab = "")
lines(dateTime, subMetering2, type = "l", col = "red")
lines(dateTime, subMetering3, type = "l", col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1 , lwd = 2.5, col = c("black","red","blue"), bty = "o")

plot(dateTime, grp, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
