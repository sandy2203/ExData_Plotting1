plot1 <- function()
{
    ## Read Household data
    hhdata <- data.table(read.csv("./household_power_consumption.txt",sep=";",
                                                    colClasses = "character"))
    hhdata$Date <- as.Date(hhdata$Date, format="%d/%m/%Y")
    plotdata <- hhdata[hhdata$Date=="2007-02-01"|hhdata$Date=="2007-02-02"]
    nrow(plotdata)
    plotdata$Global_active_power <- as.numeric(plotdata$Global_active_power)
    hist(plotdata$Global_active_power, col=c("red"), freq=TRUE, 
         main= "Global Active Power",xlab="Global Active Power(Kilowatts)")
    dev.copy(png,file="plot1.png",width = 480, height = 480)
    dev.off()
    
}