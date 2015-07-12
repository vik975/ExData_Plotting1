#read data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#get the required data
requdData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#get the date time 
tempDate <- paste(requdData$Date, requdData$Time, sep=" ")
date_time <- strptime(tempDate, "%d/%m/%Y %H:%M:%S")
#get meters for subsetted data
subMeter1 <- as.numeric(subSetData$Sub_metering_1)
subMeter2 <- as.numeric(subSetData$Sub_metering_2)
subMeter3 <- as.numeric(subSetData$Sub_metering_3)
#get active power
globalPower <- as.numeric(requdData$Global_active_power)
#get reactive power
globalPowerReactive <- as.numeric(requdData$Global_reactive_power)
voltage <- as.numeric(requdData$Voltage)

#open png device and plot the power consumption for diferent parameters
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(date_time, globalPower, type="l", xlab="", ylab="Global Active Power (kilowatts)", cex=0.2)
plot(date_time, voltage, type="l", xlab="date and time", ylab="Voltage")
plot(date_time, subMeter1, type="l",  xlab="",ylab="Energy Sub metering")

lines(date_time, subMeter2, type="l", col="red")
lines(date_time, subMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
plot(date_time, globalPowerReactive, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()