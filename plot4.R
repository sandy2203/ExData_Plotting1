plot4 <- function()
{
    ## Read Household data
    hhdata <- data.table(read.csv("./household_power_consumption.txt",sep=";",
                                  colClasses = "character"))
    hhdata$Date <- as.Date(hhdata$Date, format="%d/%m/%Y")
    plotdata <- hhdata[hhdata$Date=="2007-02-01"|hhdata$Date=="2007-02-02"]
    plotdata$Global_active_power <- as.numeric(plotdata$Global_active_power)
    plotdata$DateTime <- as.POSIXct(strptime(paste(plotdata$Date,plotdata$Time), 
                                             format="%Y-%m-%d %H:%M:%S"))
    
    png("plot4.png", width=480, height=480)
    par(mfrow=c(2,2))
    
    #Plot 1
    plot(plotdata$DateTime, plotdata$Global_active_power, type="l",
                                            ylab="Global Active Power",xlab="")
    
    #Plot 2
    plot(plotdata$DateTime, plotdata$Voltage, type="l",ylab="Voltage",
                                                                xlab="datetime")
    
    #Plot 3
    with(plotdata, plot(plotdata$DateTime, plotdata$Sub_metering_1, type = "l",
                               ylab="Energy sub metering",col="black",xlab=""))
    
    with(plotdata, points(plotdata$DateTime, plotdata$Sub_metering_2, type = "l"
                                                                  , col="red"))
    with(plotdata, points(plotdata$DateTime, plotdata$Sub_metering_3, type = "l"
                                                               , col="blue"))
    legend("topright", lty = 1, col = c("black","red","blue"),bty="n", legend = 
                         c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
    #plot 4
    plot(plotdata$DateTime, plotdata$Global_reactive_power, type="l",
         ylab="Global_reactive_power",xlab="datetime")
    
    
    dev.off()
    
    
}