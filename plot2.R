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

# build and annotate plot
plot(grsub$dt,grsub$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)", type="n")
lines(grsub$dt,grsub$Global_active_power)

# export to png
dev.copy(png,file="plot2.png", width=480,height=480)
dev.off()