#############################
## Used To Construct Plot4 ##
#############################
setwd("~/R/powerData")
originaldata<-read.table("household_power_consumption.txt",header=TRUE, sep=";", na.strings="?", colClasses=c(rep("character", 2), rep("numeric",7)))
originaldata$DateTime <- paste(originaldata$Date, originaldata$Time)
originaldata$Date<-as.Date(originaldata$Date, format="%d/%m/%Y")

## New Dataset With Converted Date Data..Next Line Only Collects Observations for Two Days
originaldata<-subset(originaldata, Date>="2007-02-01" & Date<="2007-02-02", Date:Sub_metering_3)

## New Dataset With Converted Date Data..Next Line Only Collects Observations for Two Days
originaldata$DateTime <- paste(originaldata$Date, originaldata$Time)
originaldata$DateTime <- strptime(originaldata$DateTime, format = "%Y-%m-%d %H:%M:%S")

## Plot4
png(file = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2), pty="s")

plot(x=originaldata$DateTime, y=originaldata$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(x=originaldata$DateTime, y=originaldata$Voltage, type="l", ylab="Voltage", xlab="datetime")

with(originaldata, {
  plot(x=DateTime, y=Sub_metering_1, type="l", ylab="Energy Sub Metering")
  lines(x=DateTime, y=Sub_metering_2, type="l", ylab="Energy Sub Metering", col="red")
  lines(x=DateTime, y=Sub_metering_3, type="l", ylab="Energy Sub Metering", col="blue")
  legend("topright", legend=c(names(originaldata[7:9])), col=c("black","red","blue"), lty=c(rep(1)), bty="n")
}
)
plot(x=originaldata$DateTime, y=originaldata$Global_reactive_power, type="l", ylab="Global_inactive_power", xlab="datetime")
dev.off()

