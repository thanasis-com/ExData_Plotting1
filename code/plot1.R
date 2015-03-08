data <- read.csv("C:/Users/Thanasis/Desktop/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";")

data<-subset(data, Date=="1/2/2007" | Date== "2/2/2007")

Global_active_power<-as.numeric(as.matrix(data$Global_active_power))

png(file="plot1.png")

hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()