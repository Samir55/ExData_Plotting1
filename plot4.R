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

#setting the graph Parameters to handle 4 plot at the same graphic device
par(mfrow = c(2,2))

#The 1st Plot
  ##converting values of Global_active_variable to numeric Values
Values <-  as.vector(theData$Global_active_power)
theData$Global_active_power <- as.numeric( Values)
  ##plotting
plot(theData$datetime, theData$Global_active_power,type = 'l', xlab = "", ylab = "Global Active Power")

#The 2nd PLot
Values <-  as.vector(theData$Voltage)
theData$Voltage <- as.numeric( Values)
plot(theData$datetime,theData$Voltage,type= 'l',xlab = "datetime", ylab = "Voltage")

#The 3rd Plot
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
  ##Legend, Using text.width parameter and assigning to it the value returned from strwidth to make the legend text appears correctly
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black", "red", "blue"),lty =1, bty = 'n',text.width = strwidth("Sub_metering_100"),y.intersp = 1.2,seg.len = 2)

#The 4th PLot
Values <-  as.vector(theData$Global_reactive_power)
theData$Global_reactive_power <- as.numeric( Values)
plot( theData$datetime, theData$Global_reactive_power, type = 'l', xlab ="datetime", ylab = "Global_reactive_power" )

##Saving
dev.copy(png, "plot4.png")
dev.off()
par(mfrow = c(1,1))