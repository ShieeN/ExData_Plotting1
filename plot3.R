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
plot(date,o$Sub_metering_1,type = "n")
 points(date,o$Sub_metering_1, col="black",type="l")
 points(date,o$Sub_metering_2, col="red",type="l")
 points(date,o$Sub_metering_3, col="blue",type="l")
 legend("top",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))

 
 dev.copy(png,"plot3.png")
 dev.off()