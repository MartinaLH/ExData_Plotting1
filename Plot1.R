## File: Plot1.R
## Household Power Consumption Dataset
## Martina Hoever
## For Coursera course "Exploratory Data Analysis"


## Set the file names
source_filename <- "household_power_consumption.txt"
graph_filename <- "Plot1.png"

## Get the column names of the file
colNames <- names(read.table(source_filename, nrow=1, header=TRUE, sep=";"))

## Find the rownumber where "1/2/2007" first occurs
rw <- grep("^1/2/2007", readLines(source_filename))[1]

## Find the number of rows where "1/2/2007" or "2/2/2007" occurs
n1 <- length(grep("^1/2/2007", readLines(source_filename)))
n2 <- length(grep("^2/2/2007", readLines(source_filename)))

## Read in the data, skipping the rows before 1/2/2007
hpc <- read.table(source_filename, skip = rw-1, nrow = n1+n2, header = FALSE, col.names = colNames,sep=";")

## Create graph
png(graph_filename)
title <- "Global Active Power"
title_x <- "Global Active Power (kilowatts)"
hist(hpc$Global_active_power, col = "red", main = title, xlab = title_x)
dev.off ()