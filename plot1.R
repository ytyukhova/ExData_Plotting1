## R code for creating plot1.png by YT
 
## Data are in the current directory
## Read all data into R
all_data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

## Check 
## str(all_data)
## head(all_data)

## Convert Date from character to class "Date" using as.Date
date<-as.Date(all_data$Date,"%d/%m/%Y")
## Bind this new column to the new data set
data<-cbind(date,all_data)
## Check
## head(data)

## Subset all data based on two required dates
df<- subset(data, data$date == "2007-02-01" | data$date == "2007-02-02")
 
## Construct png plot
png("plot1.png",width=480,height=480)
## Create plot 1, which is a red histogram with the properly labeled axes and title
hist(df$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red")
dev.off()

## Copy my plot to a PNG file
## dev.copy(png,file="plot1.png",width=480,height=480)
## Close the PNG device
## dev.off()