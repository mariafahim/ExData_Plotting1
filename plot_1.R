library(tidyr)
library(dplyr)
data <- read.csv("household_power_consumption.txt")
cleaned_data <- separate(data, Date.Time.Global_active_power.
                         Global_reactive_power.Voltage.Global_intensity.
                         Sub_metering_1.Sub_metering_2.Sub_metering_3, 
                         c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                         "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", 
                         "Sub_metering_3"), ";")
cleaned_data2 <- filter(cleaned_data, Date == "1/2/2007" | Date == "2/2/2007")
cleaned_data3 <- as.numeric(cleaned_data2$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(cleaned_data3, breaks = 12, col = "red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()