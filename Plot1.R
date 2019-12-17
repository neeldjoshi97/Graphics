# reading the text file

data<-read.table("data.txt", header = TRUE, sep = ";", na.strings = "?")

# plotting the first histogram and printing it to png format

png(file="png1.png")
hist(data$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power")
dev.off()
