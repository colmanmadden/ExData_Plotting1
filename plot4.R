plot4 <- function(){
  
  v1 <- as.Date("01/02/2007",format="%d/%m/%Y")
  v2 <- as.Date("02/02/2007",format="%d/%m/%Y")
  powerCon <- read.table("./household_power_consumption.txt", sep=";", header=TRUE)
  powerConWork <- subset(powerCon,as.Date(Date, format = "%d/%m/%Y")%in% v1 | as.Date(Date, format = "%d/%m/%Y")%in% v2)
  png(file="./plots/plot4.png",width=480, height=480) 
  par(mfrow=c(2,2))
  plot(as.POSIXct(paste(powerConWork$Date, powerConWork$Time), format="%d/%m/%Y %H:%M:%S"),as.numeric(as.character(powerConWork$Global_active_power)), type="l", ylab="Global Active Power (kilowatts)", xlab="")
  plot(as.POSIXct(paste(powerConWork$Date, powerConWork$Time), format="%d/%m/%Y %H:%M:%S"),as.numeric(as.character(powerConWork$Voltage)), type="l", ylab="Voltage", xlab="datetime")
  plot(as.POSIXct(paste(powerConWork$Date, powerConWork$Time), format="%d/%m/%Y %H:%M:%S"),as.numeric(as.character(powerConWork$Sub_metering_1)), type="l", ylab="Energy Sub Metering", xlab="")
  lines(as.POSIXct(paste(powerConWork$Date, powerConWork$Time), format="%d/%m/%Y %H:%M:%S"),as.numeric(as.character(powerConWork$Sub_metering_2)), col="red")
  lines(as.POSIXct(paste(powerConWork$Date, powerConWork$Time), format="%d/%m/%Y %H:%M:%S"),as.numeric(as.character(powerConWork$Sub_metering_3)), col="blue")
  legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.8,col=c("black","red","blue"),lty=1:1);  
  plot(as.POSIXct(paste(powerConWork$Date, powerConWork$Time), format="%d/%m/%Y %H:%M:%S"),as.numeric(as.character(powerConWork$Global_reactive_power)), type="l", ylab="Global_reactive_power", xlab="datetime")
  dev.off()
  
}