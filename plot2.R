
#the file name is a little different from the origin
data <- read.table("household.txt",sep=";")
#transform the first column to date type
data[,1]<- as.Date(data[,1],"%d/%m/%Y") 
#get our target data set
o<-subset(data, Date>='2007-02-01'& Date<='2007-02-02') 
#transform columns to numeric type
o[,3:9]<-sapply(o[,3:9], as.numeric)
date<-as.POSIXct(paste(x$date, x$time), format="%Y-%m-%d %H:%M:%S")
with(o,plot(date,Global_active_power, type="l", xlab=""))

dev.copy(png,"plot2.png")
dev.off()