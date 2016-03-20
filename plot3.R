#plot 3
#read data into R, notice that the data is one-minute interval, thus we skip the first 47 days using 47*60*24
#the data strat from 16/12/2006 17:24, thus we need to substract 17*60-23, substract 23 is because there is another colname line(first line)
#finally give col.names to variables
Consumption <- read.table("C:/Users/Administrator/Desktop/household_power_consumption.txt",
                          sep=";",skip = 47*60*24-17*60-23,nrows = 2*60*24,
                          col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#test whether the data contains NA
sum(is.na(Consumption$Sub_metering_1)+is.na(Consumption$Sub_metering_2)+is.na(Consumption$Sub_metering_3))

#merge first and second column and convert the merged variable to "DD/MM/YYYY HH:MM:SS" format

time<-as.POSIXct(paste(Consumption$Date,Consumption$Time),format="%d/%m/%Y %H:%M:%S")

#show plot in Rstudio. The size of legend might looks awkward in Rstudio but is absolutely fine in the output
#sorry you might see some Chinese characters in the plot that stand for Thu Fri Sat
plot(time,Consumption$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(time,Consumption$Sub_metering_2,type="l",col="red")
lines(time,Consumption$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd = c(2.5,2.5,2.5),col=c("black","red","blue"),cex =0.5,bty="o" )

#output plot as png.file
png(filename = "plot3.png",width = 480,height = 480)
plot(time,Consumption$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(time,Consumption$Sub_metering_2,type="l",col="red")
lines(time,Consumption$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd = c(2.5,2.5,2.5),col=c("black","red","blue"),bty="o" )
dev.off()