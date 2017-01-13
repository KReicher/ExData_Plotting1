# reading downloaded and unziped data from working directory

data_file <- "./household_power_consumption.txt"
data <- read.table(data_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
my_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(my_data)

#plotting 4 variables

DateTime <- strptime(paste(my_data$Date, my_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
SubMetering1 <- as.numeric(my_data$Sub_metering_1)
SubMetering2 <- as.numeric(my_data$Sub_metering_2)
SubMetering3 <- as.numeric(my_data$Sub_metering_3)

#setting english names for weekdays
Sys.setlocale("LC_TIME", "English")

png("plot3.png", width=480, height=480)
plot(DateTime, SubMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(DateTime, SubMetering2, type="l", col="red")
lines(DateTime, SubMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()