download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile = "power_consumption.zip")
unzip("power_consumption.zip", exdir = "power_consumption")

data <- read.table("./power_consumption/household_power_consumption.txt",
                   sep = ";", header = T)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
subset_data <- data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"),]

png("plot1.png", width = 480, height = 480)
hist(as.numeric(subset_data$Global_active_power), main = "Global Active Power",
     xlab = "Global Active Power (in kilowatts)", col = "red")
dev.off()
