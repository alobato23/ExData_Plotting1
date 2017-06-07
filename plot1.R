consumptiondata<-read.table("household_power_consumption.txt",header=T,sep = ";",na.strings = "?")
consumptiondata$Date<-as.Date(consumptiondata$Date,format="%d/%m/%Y")
powerdata<-subset(consumptiondata,subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(consumptiondata)
datetime<-paste(as.Date(powerdata$Date),powerdata$Time)
powerdata$datetime<-as.POSIXct(datetime)

hist(powerdata$Global_active_power,main = "Global Active Power",xlab = "Global Active Power (kilowatts)",ylab = "Frequency",col = "red")