# reading the text file

data<-read.table("data.txt", header = TRUE, sep = ";", na.strings = "?")

data1 <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

## date and time transformation

data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
data1$Time <- strptime(data1$Time, format="%H:%M:%S")
data1[1:1440,"Time"] <- format(data1[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data1[1441:2880,"Time"] <- format(data1[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

plot(data1$Time,as.numeric(as.character(data1$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

title(main="Global Active Power Vs Time")

dev.copy(png, filename="plot2.png")

dev.off() # second plot saved via copy function