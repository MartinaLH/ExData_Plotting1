## File: Plot4.R
## Household Power Consumption Dataset
## Martina Hoever
## For Coursera course "Exploratory Data Analysis"



## Set the file names
source_filename <- "household_power_consumption.txt"
graph_filename <- "Plot4.png"

## Get the column names of the file
colNames <- names(read.table(source_filename, nrow=1, header=TRUE, sep=";"))

## Find the rownumber where "1/2/2007" first occurs
rw <- grep("^1/2/2007", readLines(source_filename))[1]

## Find the number of rows where "1/2/2007" or "2/2/2007" occurs
n1 <- length(grep("^1/2/2007", readLines(source_filename)))
n2 <- length(grep("^2/2/2007", readLines(source_filename)))

## Read in the data, skipping the rows before 1/2/2007
hpc <- read.table(source_filename, skip = rw-1, nrow = n1+n2, header = FALSE, col.names = colNames,sep=";")

## Save the date and time in correct format
hpc$DateTime <- paste(hpc$Date, hpc$Time)
hpc$DateTime <- strptime(hpc$DateTime, '%d/%m/%Y %H:%M:%S')
Sys.setlocale("LC_TIME", "English")

## Create graph
## png(graph_filename)
title_y <- "Energy Sub Metering"
plot(hpc$DateTime, hpc$Sub_metering_1, type = "l", ylab = title_y, xlab = "" )
lines(hpc$DateTime, hpc$Sub_metering_2, type="l", col="red")
lines(hpc$DateTime, hpc$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex = 1, lty=c(1,1),lwd=c(2,2), col=c("black","blue","red"))
dev.off()

png(graph_filename)
par(mfrow = c(2, 2))
##Create first graph
title_y <- "Global Active Power"
plot(hpc$DateTime, hpc$Global_active_power, type = "l", ylab = title_y, xlab = "" )
##Create second graph
title_y <- "Voltage"
title_x <- "datetime"
plot(hpc$DateTime, hpc$Voltage, type = "l", ylab = title_y, xlab = title_x )
##Create third graph
title_y <- "Energy sub metering"
plot(hpc$DateTime, hpc$Sub_metering_1, type = "l", ylab = title_y, xlab = "" )
lines(hpc$DateTime, hpc$Sub_metering_2, type="l", col="red")
lines(hpc$DateTime, hpc$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex = 1, lty=c(1,1),lwd=c(2,2), col=c("black","red","blue"),bty="n")
##Create fourth graph
title_y <- "Global_reactive_power"
title_x <- "datetime"
plot(hpc$DateTime, hpc$Global_reactive_power, type = "l", ylab = title_y, xlab = title_x  )
dev.off ()

