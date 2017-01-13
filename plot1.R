# reading downloaded and unziped data from working directory

data_file <- "./household_power_consumption.txt"
data <- read.table(data_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
my_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(my_data)

#histogram of Global_active_power variable

x <- as.numeric(my_data$Global_active_power)

png("plot1.png", width=480, height=480)
hist(x, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()