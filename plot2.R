##Reading Values
library(dplyr)
bigDataSet <- read.csv2("household_power_consumption.txt", header = T)
bigDataSet$Date <- as.Date(bigDataSet$Date,format = "%d/%m/%Y")
theData <- filter(bigDataSet,Date >= "2007-02-01" & Date <= "2007-02-02")   
theDates <- theData$Date
theTimes <- theData$Time
dataTime <- paste(theDates, theTimes)
dateTime <- strptime(dataTime,format = "%Y-%m-%d %H:%M:%S")
theData$datetime <- dateTime



##converting vlaues of Global_active_variable to numeric Values
Values <-  as.vector(theData$Global_active_power)
theData$Global_active_power <- as.numeric( Values)


##plotting
plot(theData$datetime, theData$Global_active_power,type = 'l', xlab = "", ylab = "Global Active Power (kilowatts)")

##Saving as a PNG file
dev.copy(png,"plot2.png")
dev.off()