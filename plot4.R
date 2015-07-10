plot4 <- function() {
     # Locate file in working directory and read data:
     alldata <- read.table(file = "household_power_consumption.txt",sep=";", header=TRUE, na.strings = "?", stringsAsFactors = FALSE, colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric") )
     # Convert 2nd column to full dates:
     datelist <- paste(alldata[["Date"]], alldata[["Time"]]) 
     alldata[,2] <- datelist
     names(alldata)[2] <- "fulldate"
     
     #Specify start and end times:
     starttime <- strptime("2007-02-01 00:00:00", "%Y-%m-%d %H:%M:%S")
     endtime <- strptime("2007-02-03 00:00:00", "%Y-%m-%d %H:%M:%S")
     
     #Subset to the data of interest:
     doi <- subset(alldata, ( (strptime(alldata$fulldate, "%d/%m/%Y %H:%M:%S") >= starttime) & (strptime(alldata$fulldate, "%d/%m/%Y %H:%M:%S") <= endtime) ) )
     
     #Print plot as a .png:
     png(filename = "plot4.png", width=480, height=480)
     
     par(mfrow = c(2,2), mar = c(7,5,1,1))
     
     plot( strptime(doi$fulldate, "%d/%m/%Y %H:%M:%S"), doi$Global_active_power, ylab="Global Active Power", xlab="", type="n")
     lines( strptime(doi$fulldate, "%d/%m/%Y %H:%M:%S"), doi$Global_active_power, col="black")
     
     plot( strptime(doi$fulldate, "%d/%m/%Y %H:%M:%S"), doi$Voltage, ylab="Voltage", xlab="datetime", type="n")
     lines( strptime(doi$fulldate, "%d/%m/%Y %H:%M:%S"), doi$Voltage, col="black")
     
     plot( strptime(doi$fulldate, "%d/%m/%Y %H:%M:%S"), doi$Sub_metering_1, ylab="Energy sub metering", xlab="", type="n")
     lines( strptime(doi$fulldate, "%d/%m/%Y %H:%M:%S"), doi$Sub_metering_1, col="black")
     lines( strptime(doi$fulldate, "%d/%m/%Y %H:%M:%S"), doi$Sub_metering_2, col="red")
     lines( strptime(doi$fulldate, "%d/%m/%Y %H:%M:%S"), doi$Sub_metering_3, col="blue")
     legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=c(1,1,1), col = c("black","blue","red"), bty="o", box.col="transparent", cex = 0.9)
     
     plot( strptime(doi$fulldate, "%d/%m/%Y %H:%M:%S"), doi$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type = "n")
     lines( strptime(doi$fulldate, "%d/%m/%Y %H:%M:%S"), doi$Global_reactive_power, col="black")

     dev.off()
          
}