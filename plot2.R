#plot 2
#read data into R, notice that the data is one-minute interval, thus we skip the first 47 days using 47*60*24
#the data strat from 16/12/2006 17:24, thus we need to substract 17*60-23, substract 23 is because there is another colname line(first line)
#finally give col.names to variables
Consumption <- read.table("C:/Users/Administrator/Desktop/household_power_consumption.txt",
                          sep=";",skip = 47*60*24-17*60-23,nrows = 2*60*24,
                          col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#test whether the data contains NA
sum(is.na(Consumption$Date)+is.na(Consumption$Time))


#merge first and second column and convert the merged variable to "DD/MM/YYYY HH:MM:SS" format
#sorry you might see some Chinese characters in the plot that stands for Thu Fri Sat
time<-as.POSIXct(paste(Consumption$Date,Consumption$Time),format="%d/%m/%Y %H:%M:%S")
plot(time,Consumption$Global_active_power,type="l",xlab="",ylab = "Global Active Power (kilowatts)")

#output plot as png.file
png(filename = "plot2.png",width = 480,height = 480)
plot(time,Consumption$Global_active_power,type="l",xlab="",ylab = "Global Active Power (kilowatts)")
dev.off()


