#the file name is a little different from the origin
data <- read.table("household.txt",sep=";")
#transform the first column to date type
data[,1]<- as.Date(data[,1],"%d/%m/%Y") 
#get our target data set
o<-subset(r, Date>='2007-02-01'& Date<='2007-02-02') 
#transform columns to numeric type
o[,3:9]<-sapply(o[,3:9], as.numeric)
#paste Date and Time  together
date<-as.POSIXct(paste(x$date, x$time), format="%Y-%m-%d %H:%M:%S")

par(mfrow=c(2,2))
# row 1, col 1
with(o,plot(date,Global_active_power, type="l", xlab=""))
# row 1, col 2
plot(date,o$Voltage,type="l", ylab = "Voltage",xlab = "datetime")
# row 2, col 1
plot(date,o$Sub_metering_1,type = "n",xlab="")
points(date,o$Sub_metering_1, col="black",type="l")
points(date,o$Sub_metering_2, col="red",type="l")
points(date,o$Sub_metering_3, col="blue",type="l")
legend("top",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1),box.lty=0)

#row 2, col 2
plot(date,o$Global_reactive_power,type="l", xlab = "datetime",ylab = "Global_reactive_power")

dev.copy(png,"plot4.png")
dev.off()