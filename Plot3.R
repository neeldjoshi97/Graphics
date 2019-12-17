# reading the text file

data<-read.table("data.txt", header = TRUE, sep = ";", na.strings = "?")

data1 <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

## date and time transformation

data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
data1$Time <- strptime(data1$Time, format="%H:%M:%S")
data1[1:1440,"Time"] <- format(data1[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data1[1441:2880,"Time"] <- format(data1[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# the third plot

plot(data1$Time,data1$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(data1,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(data1,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(data1,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

title(main="Energy sub-metering")

# copying the plot via png image function


dev.copy(png, filename="plot3.png")
dev.off()
