data <- read.csv("C:/Users/Thanasis/Desktop/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";")

data<-subset(data, Date=="1/2/2007" | Date== "2/2/2007")

data$Global_active_power<-as.numeric(as.matrix(data$Global_active_power))

data$Date<-paste(data$Date, data$Time)
data$Date<-strptime(data$Date, "%d/%m/%Y %H:%M:%S")

png(file="plot2.png")

plot(data$Date, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.off()