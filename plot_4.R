library(tidyr)
library(dplyr)
data <- read.csv("household_power_consumption.txt")
cleaned_data <- separate(data, Date.Time.Global_active_power.
                         Global_reactive_power.Voltage.Global_intensity.Sub_metering_1.
                         Sub_metering_2.Sub_metering_3, 
                         c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                           "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", 
                           "Sub_metering_3"), ";")
cleaned_data2 <- filter(cleaned_data, Date == "1/2/2007" | Date == "2/2/2007")
cleaned_data3 <- as.numeric(cleaned_data2$Global_active_power)
cleaned_data4 <- as.numeric(cleaned_data2$Voltage)
three_1 <- as.numeric(cleaned_data2$Sub_metering_1)
three_2 <- as.numeric(cleaned_data2$Sub_metering_2)
three_3 <- as.numeric(cleaned_data2$Sub_metering_3)
cleaned_data5 <- as.numeric(cleaned_data2$Global_reactive_power)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(cleaned_data3, type = "l", xlab = " ", ylab = "Global Active Power", xaxt = "n")
axis(1, at = c(0, 1500, 2900), labels = c("Thu", "Fri", "Sat"))
plot(cleaned_data4, type = "l", xlab = "datetime", ylab = "Voltage", xaxt = "n")
axis(1, at = c(0, 1500, 2900), labels = c("Thu", "Fri", "Sat"))
plot(three_1, type = "l", xlab = " ", ylab = "Energy sub metering", xaxt = "n")
lines(three_2, col = "red")
lines(three_3, col = "blue")
axis(1, at = c(0, 1500, 2900), labels = c("Thu", "Fri", "Sat"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", 
                   "Sub_metering_3"), col= c("black", "red", "blue"), lty = 1)
plot(cleaned_data5, type = "l", xlab = "datetime", ylab = "Global_reactive_power", xaxt = "n")
axis(1, at = c(0, 1500, 2900), labels = c("Thu", "Fri", "Sat"))
dev.off()