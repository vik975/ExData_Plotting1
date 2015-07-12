#read data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#get the required data
requdData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#get the date time 
tempDate <- paste(requdData$Date, requdData$Time, sep=" ")
date_time <- strptime(tempDate, "%d/%m/%Y %H:%M:%S")
#get meters from the subsetted data
subMeter1 <- as.numeric(subSetData$Sub_metering_1)
subMeter2 <- as.numeric(subSetData$Sub_metering_2)
subMeter3 <- as.numeric(subSetData$Sub_metering_3)
#get active power
globalPower <- as.numeric(requdData$Global_active_power)

#open png device and plot the power consumption for diferent meters
png("plot3.png", width=480, height=480)
#plot(date_time, globalPower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(date_time, subMeter1, type="l",  xlab="",ylab="Energy Submetering")
lines(date_time, subMeter2, type="l", col="red")
lines(date_time, subMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
dev.off()