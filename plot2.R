dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subset <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

dateTime <- strptime(paste(subset$Date,subset$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
gap <- as.numeric(subset$Global_active_power)
png("plot2.png", width = 480,height = 480)
plot(dateTime,gap,type = "l", xlab = "",ylab = "Global Active Power (kilowatts)")
dev.off()
