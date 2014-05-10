library(chron)

data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",dec=".",fill=TRUE,stringsAsFactors=FALSE)
data <- data[ which(data$Date=='1/2/2007' | data$Date=='2/2/2007'), ]
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$Time<-chron(times=data$Time)
data$DateTime<-as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

data[c(3:9)] <- sapply(data[c(3:9)],as.numeric)
png(filename = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.off()