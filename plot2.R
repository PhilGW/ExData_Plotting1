plot2 <- function() {
     # Locate file in working directory and read data:
     alldata <- read.table(file = "household_power_consumption.txt",sep=";", header=TRUE, na.strings = "?", stringsAsFactors = FALSE, colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric") )
     #Convert 2nd column to full dates
     datelist <- paste(alldata[["Date"]], alldata[["Time"]]) 
     alldata[,2] <- datelist
     names(alldata)[2] <- "fulldate"
     
     #Enter start and end times:
     starttime <- strptime("2007-02-01 00:00:00", "%Y-%m-%d %H:%M:%S")
     endtime <- strptime("2007-02-03 00:00:00", "%Y-%m-%d %H:%M:%S")
     
     #Subset to the data of interest:
     doi <- subset(alldata, ( (strptime(alldata$fulldate, "%d/%m/%Y %H:%M:%S") >= starttime) & (strptime(alldata$fulldate, "%d/%m/%Y %H:%M:%S") <= endtime) ) )

     #Print plot as a .png:
     png(filename = "plot2.png", width=480, height=480)
     
     plot( strptime(doi$fulldate, "%d/%m/%Y %H:%M:%S"), doi$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="n")
     lines( strptime(doi$fulldate, "%d/%m/%Y %H:%M:%S"), doi$Global_active_power)

     dev.off()     
}