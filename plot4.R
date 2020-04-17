## R code for creating plot4.png by YT

## Data are in the current directory
## Read all data into R
all_data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

## Convert Date from character to class "Date" using as.Date 
date<-as.Date(all_data$Date,"%d/%m/%Y")
## Bind this new column to the new data set
data<-cbind(date,all_data)

## Subset all data based on two required dates
df<-subset(data, data$date == "2007-02-01" | data$date == "2007-02-02")

## Combine date and time into one variable (class character)
DateTime<-paste(df$date,df$Time)
DateTime<-as.POSIXct(DateTime)
final<-cbind(df,DateTime)

## Construct png plot
png("plot4.png",width=480,height=480)
par(mfcol=c(2,2))
## Plot 1 top left
plot(final$DateTime,final$Global_active_power,xlab="",ylab="Global Active Power",type="n")
lines(final$DateTime,final$Global_active_power,lwd=2)
## Plot 2 bottom left
plot(final$DateTime,final$Sub_metering_1,xlab="",ylab="Enegy sub metering",type="n")
lines(final$DateTime,final$Sub_metering_1,lwd=1)
lines(final$DateTime,final$Sub_metering_2,lwd=1,col="red")
lines(final$DateTime,final$Sub_metering_3,lwd=1,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
## Plot 3 top right
plot(final$DateTime,final$Voltage,xlab="datetime",ylab="Voltage",type="n")
lines(final$DateTime,final$Voltage,lwd=1)
## Plot 4 bottom right
plot(final$DateTime,final$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="n")
lines(final$DateTime,final$Global_reactive_power,lwd=1)
dev.off()
