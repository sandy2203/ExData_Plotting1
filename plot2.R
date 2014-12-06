plot2 <- function()
{
    ## Read Household data
    hhdata <- data.table(read.csv("./household_power_consumption.txt",sep=";",
                                  colClasses = "character"))
    hhdata$Date <- as.Date(hhdata$Date, format="%d/%m/%Y")
    
    plotdata <- hhdata[hhdata$Date=="2007-02-01"|hhdata$Date=="2007-02-02"]
    
    plotdata$Global_active_power <- as.numeric(plotdata$Global_active_power)
    
    plotdata$DateTime <- as.POSIXct(strptime(paste(plotdata$Date,plotdata$Time), 
                                             format="%Y-%m-%d %H:%M:%S"))
    
    plot(plotdata$DateTime, plotdata$Global_active_power, type="l", 
                                ylab="Global Active Power(Kilowatts)",xlab="")
    
    dev.copy(png,file="plot2.png",width = 480, height = 480)
    dev.off()
    
}