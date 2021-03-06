mydata = read.table("household_power_consumption.txt", header=T, sep=";")
mydata$Date2 <- as.Date(as.character(mydata$Date), "%d/%m/%Y")
date1 <- as.Date(c("2007-02-01"))
date2 <- as.Date(c("2007-02-02"))
mydataCut <- subset(mydata, Date2 %in% c(date1, date2))
png(filename="plot1.png")
hist(as.numeric(mydataCut$Global_active_power)/500, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylim=c(0, 1200))
dev.off()
