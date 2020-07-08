
#the file name is a little different from the origin
data <- read.table("household.txt",sep=";")
#transform the first column to date type
data[,1]<- as.Date(data[,1],"%d/%m/%Y") 
#get our target data set
o<-subset(data, Date>='2007-02-01'& Date<='2007-02-02') 
#transform columns to numeric type
o[,3:9]<-sapply(o[,3:9], as.numeric)
with(o,hist(Global_active_power,col="red",main="Global Active Power")) 
dev.copy(png,"plot1.png")
dev.off()
