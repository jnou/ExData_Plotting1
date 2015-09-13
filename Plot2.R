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
## Plot2

png(file="plot2.png", width = 480, height = 480,
    units = "px", pointsize = 12, bg = "white")

par(bg = "white")
par(mar=c(4,4,2,2))
par(mfrow = c(1, 1)) 


yGApower <- as.numeric(str_trim(myData2$Global_active_power))

plot(X,yGApower, type="l",xlab="", ylab="Global Active Power(kilowatts)", lwd=2) 

dev.off()

## End Plot2
