## R code for creating plot2.png by YT

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
## To "POSIXct" "POSIXt" class
DateTime<-as.POSIXct(DateTime)
## Bind to the data frame
final<-cbind(df,DateTime)

## Construct png plot
png("plot2.png",width=480,height=480)
plot(final$DateTime,final$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="n")
lines(final$DateTime,final$Global_active_power,lwd=2)
dev.off()

## Another version
## Copy my plot to a PNG file
## dev.copy(png,file="plot2.png",width=480,height=480)
## Close the PNG device
## dev.off()