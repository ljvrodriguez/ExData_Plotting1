## To read the data as dataframe
data  <- read.table("data1.txt", header=T, sep=";", nrows=70000, colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings=c("?"))

## To extract only the 2 required days
data1  <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

## To convert date and time into POSIXlt
datetime  <- paste(data1$Date, data1$Time)
data2  <- cbind(data1, datetime)
data2$datetime  <- strptime(data2$datetime, " %d/%m/%Y %H:%M:%S")

## To open the 'png' graphics device 
png(filename="plot3.png", width=480, height=480)

## To plot Energy sub metering versus time
with(data2, plot(datetime, Sub_metering_1, type="n", ylab="Energy sub metering", xlab=""))
with(data2, lines(datetime, Sub_metering_1))
with(data2, lines(datetime, Sub_metering_2, col="red"))
with(data2, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

## To switch off the 'png' graphics device
dev.off()
