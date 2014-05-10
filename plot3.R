library(chron)

data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",dec=".",fill=TRUE,stringsAsFactors=FALSE)
data <- data[ which(data$Date=='1/2/2007' | data$Date=='2/2/2007'), ]
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$Time<-chron(times=data$Time)
data$DateTime<-as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

data[c(3:9)] <- sapply(data[c(3:9)],as.numeric)

png(filename = "plot3.png", width = 480, height = 480)

plot(data$DateTime,data$Sub_metering_1, type="n",ylab="Energy sub metering",xlab="")
lines(data$DateTime,data$Sub_metering_1)
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=c(1,1),col=c("black","red","blue"))

dev.off()