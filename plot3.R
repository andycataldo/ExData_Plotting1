## Started by saving data for Course Project 1 to working directory

# read data and store to data frame gr1
# noted that data is delimited by ";", NA values are denoted by "?"
gr1 <- read.table("household_power_consumption.txt",sep=";",header=T,na.strings="?")

# recategorize data in field "Date" as date, from text format dd/mm/yyyy
gr1$Date <- as.Date(gr1$Date, "%d/%m/%Y")

# subset data for specified dates
grsub <- subset(gr1,Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))

# create a new column to store date and time combined in POSIXlt format
grsub$dt <- strptime(paste0(grsub$Date,grsub$Time),"%Y-%m-%d %H:%M:%S")

# build plot with annotations and no plot markers
plot(grsub$dt,grsub$Sub_metering_1,ylab="Energy sub metering",type="n",xlab="")

# add lines to plot
lines(grsub$dt,grsub$Sub_metering_1)
lines(grsub$dt,grsub$Sub_metering_2, col="red")
lines(grsub$dt,grsub$Sub_metering_3, col="blue")

# add legend to plot
legend("topright",lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),cex=0.6)

# export to png
dev.copy(png,file="plot3.png", width=480,height=480)
dev.off()