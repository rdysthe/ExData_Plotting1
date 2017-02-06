# Plot 1

setwd("~/datasciencecoursera/Month4Week1")

if (!file.exists("household_power_consumption.txt")) {
  dest <- "data.zip"
  download.file(file_name, dest)
  unzip("data.zip")
}

dat <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
dat <- dat[dat$Date %in% c("1/2/2007", "2/2/2007"), ]

png(filename = "plot1.png", width = 480, height = 480)
hist(dat[, 3], col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()