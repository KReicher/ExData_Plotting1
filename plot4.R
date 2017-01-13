# reading downloaded and unziped data from working directory

data_file <- "./household_power_consumption.txt"
data <- read.table(data_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
my_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(my_data)

#multiple graphs in one plot

DateTime <- strptime(paste(my_data$Date, my_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(my_data$Global_active_power)
GlobalReactivePower <- as.numeric(my_data$Global_reactive_power)
Voltage <- as.numeric(my_data$Voltage)
SubMetering1 <- as.numeric(my_data$Sub_metering_1)
SubMetering2 <- as.numeric(my_data$Sub_metering_2)
SubMetering3 <- as.numeric(my_data$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))  

# upper left
plot(DateTime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

# upper right
plot(DateTime, Voltage, type="l", xlab="datetime", ylab="Voltage")

# lower left
plot(DateTime, SubMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(DateTime, SubMetering2, type="l", col="red")
lines(DateTime, SubMetering3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

# lower right
plot(DateTime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()