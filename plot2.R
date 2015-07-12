#read data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#get the required data
requdData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#get the date time 
tempDate <- paste(requdData$Date, requdData$Time, sep=" ")
date_time <- strptime(tempDate, "%d/%m/%Y %H:%M:%S") 
#get active power
globalPower <- as.numeric(requdData$Global_active_power)

#open png device and plot the power consumption for date_time
png("plot2.png", width=480, height=480)
plot(date_time, globalPower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()