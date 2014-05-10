library(chron)

data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",dec=".",fill=TRUE,stringsAsFactors=FALSE)
data <- data[ which(data$Date=='1/2/2007' | data$Date=='2/2/2007'), ]
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$Time<-chron(times=data$Time)
data$DateTime<-as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

data[c(3:9)] <- sapply(data[c(3:9)],as.numeric)

png(filename = "plot2.png", width = 480, height = 480)

plot(data$DateTime,data$Global_active_power, type="n",ylab="Global Active Power (kilowatts)",xlab="")
lines(data$DateTime,data$Global_active_power)

dev.off()