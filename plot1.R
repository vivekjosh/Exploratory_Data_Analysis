getwd()
a <- read.csv ('household_power_consumption.txt',header=TRUE,stringsAsFactors=FALSE, sep =";")
v <- as.Date(a$Date, "%d/%m/%Y")
b <- subset( a,v == "2007-2-1")
c<- subset( a,v== "2007-2-2")
d <- rbind(b,c)
q <- as.numeric(d$Global_active_power)
png("plot1.png", width=480, height=480)
hist(q, xlab = " Global Active Power (Kilowatts)",
     main = "Global Active Power",col ='Red')
dev.off()

