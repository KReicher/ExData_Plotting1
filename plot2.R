# reading downloaded and unziped data from working directory

data_file <- "./household_power_consumption.txt"
data <- read.table(data_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
my_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(my_data)

#plotting 2 variables

GlobalActivePower <- as.numeric(my_data$Global_active_power)
DateTime <- strptime(paste(my_data$Date, my_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#setting english names for weekdays
Sys.setlocale("LC_TIME", "English")

png("plot2.png", width=480, height=480)
plot(DateTime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()