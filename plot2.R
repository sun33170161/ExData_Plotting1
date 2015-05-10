## load data
source("loadData.R")
data <- loadData()

## make plot
png("plot2.png")
plot(data$datetime, data$Global_active_power, xlab = "", ylab = "Global Active Power(kilowatts)", type = "l")
dev.off()
