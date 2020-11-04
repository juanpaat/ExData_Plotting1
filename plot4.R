
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
png(file = "plot4.png",width = 480,height = 480)
par(mfcol=c(2,2))
#plot1
plot(subset$datetime,subset$Global_active_power,
     type = "l", ylab="Global Active Power (Kilowatts)",xlab="")
#plot2
with(subset,plot(datetime,Sub_metering_1,type="l",ylab = "Energy sub metering",xlab = ""))
lines(subset$datetime,subset$Sub_metering_2,col="red")
lines(subset$datetime,subset$Sub_metering_3,col="blue")
legend("topright",lty = 1, col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#plot3
with(subset,plot(datetime,Voltage,type="l"))
#plot4
with(subset,plot(datetime,Global_reactive_power,type = "l"))
dev.off()
