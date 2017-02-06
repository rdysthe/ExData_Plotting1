# Plot 2

setwd("~/datasciencecoursera/Month4Week1")

if (!file.exists("household_power_consumption.txt")) {
  dest <- "data.zip"
  download.file(file_name, dest)
  unzip("data.zip")
}

dat <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
dat <- dat[dat$Date %in% c("1/2/2007", "2/2/2007"), ]

dat[, 10] <- as.POSIXct(strptime(paste(dat[, 1], dat[, 2], sep = " "), format = "%d/%m/%Y %H:%M:%S"))

png(filename = "plot2.png", width = 480, height = 480)
plot(x = dat[, 10], y = dat[, 3], type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()