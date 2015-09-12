plot1 <- function(){  
  
  v1 <- as.Date("01/02/2007",format="%d/%m/%Y")
  v2 <- as.Date("02/02/2007",format="%d/%m/%Y")
  powerCon <- read.table("./household_power_consumption.txt", sep=";", header=TRUE)
  View(powerCon)
  powerConWork <- subset(powerCon,as.Date(Date, format = "%d/%m/%Y")%in% v1 | as.Date(Date, format = "%d/%m/%Y")%in% v2)
  png(file="./plots/plot1.png",width=480, height=480) 
  hist(as.numeric(as.character(powerConWork$Global_active_power)),main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")     
  dev.off()

}