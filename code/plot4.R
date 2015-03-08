data <- read.csv("C:/Users/Thanasis/Desktop/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";", na.strings="?")

data<-subset(data, Date=="1/2/2007" | Date== "2/2/2007")

data$Global_active_power<-as.numeric(as.matrix(data$Global_active_power))
data$Sub_metering_1<-as.numeric(as.matrix(data$Sub_metering_1))
data$Sub_metering_2<-as.numeric(as.matrix(data$Sub_metering_2))
data$Sub_metering_3<-as.numeric(as.matrix(data$Sub_metering_3))
data$Voltage<-as.numeric(as.matrix(data$Voltage))
data$Global_reactive_power<-as.numeric(as.matrix(data$Global_reactive_power))


data$Date<-paste(data$Date, data$Time)
data$Date<-strptime(data$Date, "%d/%m/%Y %H:%M:%S")

png(file="plot4.png")

par(mfrow=c(2,2))

plot(data$Date, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

plot(data$Date, data$Voltage, type="l", ylab="Voltage", xlab="datetime")

plot(data$Date, data$Sub_metering_1, xlab="", ylab="Energy sub metering", col="black", type="l")
lines(data$Date, data$Sub_metering_2, type="l", col="red")
lines(data$Date, data$Sub_metering_3, type="l", col="blue")
legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering3"))

plot(data$Date, data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

dev.off()





