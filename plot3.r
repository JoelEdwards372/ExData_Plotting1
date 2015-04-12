#############################
## Used To Construct Plot3 ##
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

## Plot3
png(file = "plot3.png", width = 480, height = 480)
with(originaldata, {
  plot(x=DateTime, y=Sub_metering_1, type="l", ylab="Energy Sub Metering")
  lines(x=DateTime, y=Sub_metering_2, type="l", ylab="Energy Sub Metering", col="red")
  lines(x=DateTime, y=Sub_metering_3, type="l", ylab="Energy Sub Metering", col="blue")
  legend("topright", legend=c(names(originaldata[7:9])), border="black", col=c("black","red","blue"), lty=c(rep(1)))
}
)
dev.off()