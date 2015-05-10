loadData <- function() {
  data.file <- "data/household_power_consumption.txt"
  if(!file.exists(data.file))
    unzip("data/exdata-data-household_power_consumption.zip", exdir = "data")
  # check data properties
  readLines(data.file, 5)
  
  # check memory requirement
  memory.require <- 2075259 * 9 * 8 / 1024 / 1024
  memory.free <- as.integer(strsplit(system("free -m", intern = T)[2], " +")[[1]][4])
  if(memory.free < memory.require)
    stop("no enough memory")
  
  # read data
  data.head5 <- read.csv(data.file, sep = ";", na.strings = "?", nrow = 5)
  data.colClasses <- sapply(data.head5, class)
  data <- read.csv(data.file, sep = ";", na.strings = "?", colClasses = data.colClasses)
  file.remove(data.file)
  
  # transform Date column
  data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
  
  # extract data
  subset(data, datetime >= as.POSIXlt("2007-02-01") & datetime < as.POSIXlt("2007-02-03"))
}