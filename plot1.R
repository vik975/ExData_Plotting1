#read data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#get the required data
requdData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

globalPower <- as.numeric(requdData$Global_active_power)

#open png device and plot the histogram
png("plot1.png", width=480, height=480)
hist(globalPower, col="red", xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()