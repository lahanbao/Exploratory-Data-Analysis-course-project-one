#plot 4
#read data into R, notice that the data is one-minute interval, thus we skip the first 47 days using 47*60*24
#the data strat from 16/12/2006 17:24, thus we need to substract 17*60-23, substract 23 is because there is another colname line(first line)
#finally give col.names to variables
Consumption <- read.table("C:/Users/Administrator/Desktop/household_power_consumption.txt",
                          sep=";",skip = 47*60*24-17*60-23,nrows = 2*60*24,
                          col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#test whether the data contains NA
sum(is.na(Consumption$Voltage)+is.na(Consumption$Global_reactive_power))

#merge plots into one pic
#sorry you might see some Chinese characters in the plot that stands for Thu Fri Sat
attach(mtcars)
par(mfrow=c(2,2))

#first plot
time2<-as.POSIXct(paste(Consumption$Date,Consumption$Time),format="%d/%m/%Y %H:%M:%S")
plot(time2,Consumption$Global_active_power,type="l",xlab="",ylab = "Global Active Power (kilowatts)")

#second plot(topright)
time4<-as.POSIXct(paste(Consumption$Date,Consumption$Time),format="%d/%m/%Y %H:%M:%S")
plot(time4,Consumption$Voltage,type="l",xlab="datetime",ylab = "Voltage")

#third plot(bottomleft)
time3<-as.POSIXct(paste(Consumption$Date,Consumption$Time),format="%d/%m/%Y %H:%M:%S")
plot(time3,Consumption$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(time3,Consumption$Sub_metering_2,type="l",col="red")
lines(time3,Consumption$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1),lwd = c(2.5,2.5,2.5),col=c("black","red","blue"),cex =0.5,bty = "n")

#fourth plot
plot(time4,Consumption$Global_reactive_power,type="l",xlab="datetime",ylab  = "Global reactive power")

#output plot
png(filename = "plot4.png",width = 480,height = 480)

attach(mtcars)
par(mfrow=c(2,2))
time2<-as.POSIXct(paste(Consumption$Date,Consumption$Time),format="%d/%m/%Y %H:%M:%S")
plot(time2,Consumption$Global_active_power,type="l",xlab="",ylab = "Global Active Power (kilowatts)")

time4<-as.POSIXct(paste(Consumption$Date,Consumption$Time),format="%d/%m/%Y %H:%M:%S")
plot(time4,Consumption$Voltage,type="l",xlab="datetime",ylab = "Voltage")

time3<-as.POSIXct(paste(Consumption$Date,Consumption$Time),format="%d/%m/%Y %H:%M:%S")
plot(time3,Consumption$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(time3,Consumption$Sub_metering_2,type="l",col="red")
lines(time3,Consumption$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1),lwd = c(2.5,2.5,2.5),col=c("black","red","blue"),bty = "n")

plot(time4,Consumption$Global_reactive_power,type="l",xlab="datetime",ylab  = "Global reactive power")

dev.off()