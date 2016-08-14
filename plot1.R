##Reading Values
library(dplyr)
bigDataSet <- read.csv2("household_power_consumption.txt", header = T)
bigDataSet$Date <- as.Date(bigDataSet$Date,format = "%d/%m/%Y")
theData <- filter(bigDataSet,Date >= "2007-02-01" & Date <= "2007-02-02")   
theDates <- theData$Date
theTimes <- theData$Time
dataTime <- paste(theDates, theTimes)
dateTime <- strptime(dataTime,format = "%Y-%m-%d %H:%M:%S")
theData$datatime <- dateTime




##converting vlaues of Global_active_variable to numeric Values
Values <-  as.vector(theData$Global_active_power)
theData$Global_active_power <- as.numeric( Values)



##Plotting

hist(theData$Global_active_power,xlab ="Global Active Power (kilowatts)", ylab = "Frequency",col = "red" ,main = "Global Active Power")


##Saving as a PNG file
dev.copy(png, "plot1.png")
dev.off()