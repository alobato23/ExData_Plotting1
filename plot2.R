consumptiondata<-read.table("household_power_consumption.txt",header=T,sep = ";",na.strings = "?")
consumptiondata$Date<-as.Date(consumptiondata$Date,format="%d/%m/%Y")
powerdata<-subset(consumptiondata,subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(consumptiondata)
datetime<-paste(as.Date(powerdata$Date),powerdata$Time)
powerdata$datetime<-as.POSIXct(datetime)

plot(powerdata$datetime,powerdata$Global_active_power,type="lines",xlab = "",ylab = "Global Active Power (kilowatts)")