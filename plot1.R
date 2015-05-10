## load data
source("loadData.R")
data <- loadData()

## make plot
png("plot1.png")
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power(kilowatts)", col = "red")
dev.off()