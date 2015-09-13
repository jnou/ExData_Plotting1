## set environnement

Sys.setenv(LANG ="en")
library(dplyr)
library(sqldf)
library(stringr)

## Get data from file

myFile <- "./data/household_power_consumption.txt"
myData <- read.csv(myFile, header = TRUE, sep = ";"  ,dec = ".")

## Filter data for only Date=='1/2/2007' |  Date=='2/2/2007'

myData2 <- filter(myData, Date=='1/2/2007' |  Date=='2/2/2007')

##
## concat Column date time 
##

date_time <- paste(myData2$Date, myData2$Time)
dtime <- strptime(date_time, format="%d/%m/%Y %H:%M:%S")
X <- dtime

## END Of Geting data
## End Plot3

## plot 4
## ======

## par("mar") donne les marges

png(file="plot4.png", width = 480, height = 480,
    units = "px", pointsize = 12, bg = "white")

par(bg = "white")
par(mar=c(4,4,2,2))
par(mfrow = c(2, 2)) 

dtime <- strptime(date_time, format="%d/%m/%Y %H:%M:%S")
X <- dtime

# 1---

yGApower <- as.numeric(str_trim(myData2$Global_active_power))
plot(X,yGApower, type="l",xlab="", ylab="Global Active Power(kilowatts)", lwd=1) 


# 2---
Yvoltage <-  as.numeric(str_trim(myData2$Voltage))
plot(X,Yvoltage, type="l", xlab="datetime", ylab="voltage",  col="black", lwd=1)

# 3---

yEnSub1 <- as.numeric(str_trim(myData2$Sub_metering_1))
yEnSub2  <- as.numeric(str_trim(myData2$Sub_metering_2))
yEnSub3 <- as.numeric(str_trim(myData2$Sub_metering_3))

plot(X,yEnSub1, type="l", ylab="Energy sub metering", col="black", ,xlab="", lwd=1)
lines(X,yEnSub2, col="red", lwd=1)
lines(X,yEnSub3, col="blue", lwd=1)
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1,1), lwd=1)



# 4 ---

yRpower <- as.numeric(str_trim(myData2$Global_reactive_power))
plot(X,yRpower, type="l", xlab="datetime", ylab="Global_reactive_powery",  col="black", lwd=1)

dev.off()

## End Plot4
