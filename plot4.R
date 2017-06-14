plot4 <- function(){
    
    ## Read power consumption data
    consumption <- read.csv("household_power_consumption.csv", stringsAsFactors = FALSE, sep = ";", col.names = c("Date","Time","Global_Active_Power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    ## subset the data
    s_consumption <- consumption[consumption$Date %in% c("1/2/2007","2/2/2007"), ]
    
    ## convert into class POXIXct
    d <- as.POSIXct(paste(s_consumption$Date, s_consumption$Time), format = "%d/%m/%Y %H:%M:%S")
    
    ## plot figure 2
    png(filename = "plot4.png", width = 480, height = 480)
    par(mfrow = c(2,2))
    plot(d, s_consumption$Global_Active_Power, xlab = '', ylab = "Global Active Power", type = "l")
    plot(d, s_consumption$Voltage, ylab = "Voltage", type = "l", xlab = "datetime")
    plot(d, s_consumption$Sub_metering_1, type = "l", xlab = '', ylab = "Energy sub metering")
    points(d, s_consumption$Sub_metering_2, col = "red", type = "l")
    points(d, s_consumption$Sub_metering_3, col = "blue", type = "l")
    legend("topright", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), pch = 16)
    plot(d, s_consumption$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
    dev.off()
    
}
