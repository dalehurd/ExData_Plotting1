#Read the file
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")

#add extra date/time column
date_extra <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data <- cbind(data, date_extra)



#sort by the dates given for the assignment
subset_data <- subset(data,power$Date=="1/2/2007" | data$Date =="2/2/2007")


#set the data types as appropriate
subset_data$Date <- as.Date(subset_data$Date, format="%d/%m/%Y")
subset_data$Time <- format(subset_data$Time, format="%H:%M:%S")
subset_data$Global_active_power <- as.numeric(subset_data$Global_active_power)
subset_data$Global_reactive_power <- as.numeric(subset_data$Global_reactive_power)
subset_data$Voltage <- as.numeric(subset_data$Voltage)
subset_data$Global_intensity <- as.numeric(subset_data$Global_intensity)
subset_data$Sub_metering_1 <- as.numeric(subset_data$Sub_metering_1)
subset_data$Sub_metering_2 <- as.numeric(subset_data$Sub_metering_2)
subset_data$Sub_metering_3 <- as.numeric(subset_data$Sub_metering_3)


#create plot 3
png("plot3.png", width=480, height=480)
with(subset_data, plot(date_extra, Sub_metering_1, type="l", xlab="Day", ylab="Energy sub metering"))
lines(subset_data$date_extra, subset_data$Sub_metering_2,type="l", col= "red")
lines(subset_data$date_extra, subset_data$Sub_metering_3,type="l", col= "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
dev.off()