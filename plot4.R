download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile = "power_consumption.zip")
unzip("power_consumption.zip", exdir = "power_consumption")

data <- read.table("./power_consumption/household_power_consumption.txt",
                   sep = ";", header = T)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
subset_data <- data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"),]

date_time <- strptime(paste(subset_data$Date, subset_data$Time, sep = " "),
                      format = "%Y-%m-%d %H:%M:%S")

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(date_time, as.numeric(subset_data$Global_active_power), type = "l", xlab = "",
     ylab = "Global Active Power")
plot(date_time, as.numeric(subset_data$Voltage), type = "l", xlab = "", ylab = "Voltage")
with(subset_data,{
  plot(date_time, as.numeric(subset_data$Sub_metering_1), type = "l", col = "red",
       xlab = "", ylab = "Energy sub metering")
  lines(date_time, as.numeric(subset_data$Sub_metering_2), type = "l", col = "blue")
  lines(date_time, subset_data$Sub_metering_3, type = "l", col = "green")
})
legend("topright", lty = 1, lwd = 3, col = c("red", "blue", "green"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(date_time, as.numeric(subset_data$Global_reactive_power), type = "l", xlab = "",
     ylab = "Global Reactive Power")
dev.off()
