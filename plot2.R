a <- read.csv ('household_power_consumption.txt',header=TRUE,stringsAsFactors=FALSE, sep =";")
v <- as.Date(a$Date, "%d/%m/%Y")
b <- subset( a,v == "2007-2-1")
c<- subset( a,v== "2007-2-2")
d <- rbind(b,c)

date_time <- strptime(paste(d$Date, d$Time, sep=" "), 
                     "%d/%m/%Y %H:%M:%S") 
date_time
head(date_time,10)
globalActivePower <- as.numeric(d$Global_active_power)
png("plot2.png", width=480, height=480)
plot(date_time, globalActivePower, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()