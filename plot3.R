## load data
source("loadData.R")
data <- loadData()

## make plot
png("plot3.png")
plot(data$datetime, data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, legend = paste("Sub_metering", 1:3, sep = "_"))
dev.off()
