## To read the data as dataframe
data  <- read.table("data1.txt", header=T, sep=";", nrows=70000, colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings=c("?"))

## To extract only the 2 required days
data1  <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

## To convert date and time into POSIXlt
datetime  <- paste(data1$Date, data1$Time)
data2  <- cbind(data1, datetime)
data2$datetime  <- strptime(data2$datetime, " %d/%m/%Y %H:%M:%S")

## To open the 'png' graphics device 
png(filename="plot1.png", width=480, height=480)

## To plot a histogram of Global active power
with(data2, hist(Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red"))

## To switch off the 'png' graphics device
dev.off()