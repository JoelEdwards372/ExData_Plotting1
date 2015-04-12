#############################
## Used To Construct Plot1 ##
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

## Used To Construct Plot1
hist(originaldata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()