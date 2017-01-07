#read the file - unfortunately, it would be quite a problem to optimize it:
#just truncated the input 100k rows manually
data_main<-read.csv("household_power_consumption.txt",nrows = 100000,header = T,sep = ";",na.strings = "?")

#subset the parse the dates  - only point to tackle in data input
data_main<-subset(data_main,Date %in% c('1/2/2007','2/2/2007'))
#parse the dates  - only point to tackle in data input
data_main$DateTime<-strptime(paste(data_main$Date,data_main$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

#Plot 4

#start output to a file
filename = "Plot4.png"
png(filename=filename,width = 480,height = 480,bg = rgb(0,0,0,0))
attach(data_main)
#draw a plot

#set the facets
par(mfrow=c(2,2),# 2 x 2
    cex.lab=1,cex=1.0 #these are for fonts: default values do not play nicely with the charts
    #oma = c(2,2,0,0) + 1.7,
    #mar = c(0,0,0,0) + 1.7
    )

#Top left plot
plot(y=Global_active_power,
     x=DateTime,
     type = "l",
     main = " ",
     xlab = " ", 
     ylab="Global Active Power")

#Top right plot
plot(y=Voltage,
     x=DateTime,
     type = "l",
     main = " ",
     xlab = "datetime", 
     ylab="Voltage")
#Bottom left plot
plot(y=Sub_metering_1,
     x=DateTime,
     type = "l",
     main = " ",
     xlab = " ", 
     ylab="Energy sub metering")
#       add a second line chart
lines(y=Sub_metering_2,
      x=DateTime,
      type = "l",
      col="red")
#       add a third line chart
lines(y=Sub_metering_3,
      x=DateTime,
      type = "l",
      col="blue")
#       draw a legend
legend("topright", 
       c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), # legends titles' set
      box.lwd = "n",
       lty=c(1,1,1),y.intersp = 0.8, x.intersp = 0.5,# gives the legend appropriate symbols (lines)
       pt.cex=0.3,cex=0.7,pch=25,col=c('black','red','blue')) # gives the legend lines the correct color and font sizes

#Bottom right plot
plot(y=Global_reactive_power,
     x=DateTime,
     type = "l",
     main = " ",
     xlab = "datetime", 
     ylab="Global_reactive_power")

#Say Goodbye!
detach(data_main)
dev.off()
