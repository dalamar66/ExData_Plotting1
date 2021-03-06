mydata = read.table("household_power_consumption.txt", header=T, sep=";")
mydata$Date2 <- as.Date(as.character(mydata$Date), "%d/%m/%Y")
date1 <- as.Date(c("2007-02-01"))
date2 <- as.Date(c("2007-02-02"))
mydataCut <- subset(mydata, Date2 %in% c(date1, date2))
png(filename="plot2.png", width = 480, height = 480, units = "px")
mydataCut$dateTime <- strptime(paste(mydataCut$Date, mydataCut$Time, sep=","), format="%d/%m/%Y,%H:%M:%S")
mydataCut$DateTimeAsDate <- as.POSIXlt(mydataCut$dateTime)
plot(mydataCut$DateTimeAsDate, as.numeric(mydataCut$Global_active_power)/500, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
