#Read and store the dataset in a object called data
data<-read.csv("./household_power_consumption.txt",sep=";",header = TRUE)

data$Date<-as.Date(data$Date,format = "%d/%m/%Y")
data$Global_active_power<-as.numeric(data$Global_active_power)

library(dplyr)
subset<-data%>%
        filter(Date=="2007-02-01"|Date=="2007-02-02")

datetime<-strptime(datetime,format="%Y-%m-%d %H:%M:%S")
subset<-subset%>%
        mutate(datetime=datetime)

#save with a width of 480 pixels and a height of 480 pixels
png(file = "plot3.png",width = 480,height = 480)
with(subset,plot(datetime,Sub_metering_1,type="l",ylab = "Energy sub metering",xlab = ""))
lines(subset$datetime,subset$Sub_metering_2,col="red")
lines(subset$datetime,subset$Sub_metering_3,col="blue")
legend("topright",lty = 1, col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()






