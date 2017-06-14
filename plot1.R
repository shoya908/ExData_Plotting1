plot1 <- function(){
    
    ## Read power consumption data
    consumption <- read.csv("household_power_consumption.csv", stringsAsFactors = FALSE, sep = ";", col.names = c("Date","Time","Global_Active_Power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    ## subset the data
    s_consumption <- consumption[consumption$Date %in% c("1/2/2007","2/2/2007"), ]
    
    ## plot figure 1
    png(filename = "plot1.png", width = 480, height = 480)
    hist(as.numeric(s_consumption$Global_Active_Power), xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")
    dev.off()
    
}
