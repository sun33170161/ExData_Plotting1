## load data
source("loadData.R")
data <- loadData()

## make plot
png("plot4.png")

par.old <- par()
par(mfrow = c(2, 2))
with(data, {
  plot(datetime, Global_active_power, xlab = "", ylab = "Global Active Power(kilowatts)", type = "l")
  
  plot(datetime, Voltage, type = "l")
  
  plot(datetime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
  lines(datetime, Sub_metering_2, col = "red")
  lines(datetime, Sub_metering_3, col = "blue")
  legend("topright", col = c("black", "red", "blue"), lty = 1, bty = "n", legend = paste("Sub_metering", 1:3, sep = "_"))
  
  plot(datetime, Global_reactive_power, type = "l")
})

par(par.old)

dev.off()