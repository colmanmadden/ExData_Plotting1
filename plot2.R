plot2 <- function(){
  
  v1 <- as.Date("01/02/2007",format="%d/%m/%Y")
  v2 <- as.Date("02/02/2007",format="%d/%m/%Y")
  powerCon <- read.table("./household_power_consumption.txt", sep=";", header=TRUE)
  powerConWork <- subset(powerCon,as.Date(Date, format = "%d/%m/%Y")%in% v1 | as.Date(Date, format = "%d/%m/%Y")%in% v2)
  png(file="./plots/plot2.png",width=480, height=480) 
  plot(as.POSIXct(paste(powerConWork$Date, powerConWork$Time), format="%d/%m/%Y %H:%M:%S"),as.numeric(as.character(powerConWork$Global_active_power)), type="l", ylab="Global Active Power (kilowatts)", xlab="")
  dev.off()
  
}