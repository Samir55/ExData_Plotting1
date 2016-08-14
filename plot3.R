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
Values <-  as.vector(theData$Sub_metering_1)
theData$Sub_metering_1 <- as.numeric( Values)
Values <-  as.vector(theData$Sub_metering_2)
theData$Sub_metering_2 <- as.numeric( Values)
Values <-  as.vector(theData$Sub_metering_3)
theData$Sub_metering_3 <- as.numeric( Values)

#Plotting
plot(theData$datetime, theData$Sub_metering_1,type = 'n', xlab = "", ylab = "Energy sub metering")
points(theData$datetime, theData$Sub_metering_1, type = 'l')
points(theData$datetime, theData$Sub_metering_2, type = 'l', col = "red")
points(theData$datetime, theData$Sub_metering_3, type = 'l', col = "blue")

##Legend
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black", "red", "blue"),lty =1,text.width = strwidth("Sub_metering_100"))

##Saving
dev.copy(png, "plot3.png")
dev.off()
