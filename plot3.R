a <- read.csv ('household_power_consumption.txt',header=TRUE,stringsAsFactors=FALSE, sep =";")
v <- as.Date(a$Date, "%d/%m/%Y")
b <- subset( a,v == "2007-2-1")
c<- subset( a,v== "2007-2-2")
d <- rbind(b,c)

date_time <- strptime(paste(d$Date, d$Time, sep=" "), 
                      "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(d$Global_active_power)
subMetering1 <- as.numeric(d$Sub_metering_1)
subMetering2 <- as.numeric(d$Sub_metering_2)
subMetering3 <- as.numeric(d$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(date_time, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, subMetering2, type="l", col="red")
lines(date_time, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, 
       lwd=2.5, col=c("black", "red", "blue"))
dev.off()
