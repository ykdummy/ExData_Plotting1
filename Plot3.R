#read the file - unfortunately, it would be quite a problem to optimize it:
#just truncated the input 100k rows manually
data_main<-read.csv("household_power_consumption.txt",nrows = 100000,header = T,sep = ";",na.strings = "?")

#subset the parse the dates  - only point to tackle in data input
data_main<-subset(data_main,Date %in% c('1/2/2007','2/2/2007'))
#parse the dates  - only point to tackle in data input
data_main$DateTime<-strptime(paste(data_main$Date,data_main$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

#Plot 3

#start output to a file
filename = "Plot3.png"
png(filename=filename,width = 480,height = 480,bg = rgb(0,0,0,0))
attach(data_main)
#first plot
plot(y=Sub_metering_1,
     x=DateTime,
     type = "l",
     #Visuals & labels
     col="black",
     main = " ",
     xlab = " ", 
     ylab="Energy sub metering")
#add second plot
lines(y=Sub_metering_2,
      x=DateTime,
      type = "l",
      #Visuals & labels
      col="red")
#add third plot
lines(y=Sub_metering_3,
      x=DateTime,
      type = "l",
      #Visuals & labels
      col="blue")
#here goes the legend
legend("topright", 
       c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), # labels
       lty=c(1,1,1), # symbols <- lines
       col=c('black','red','blue')) # setup the colors for the legend

#Say Goodbye!
detach(data_main)
dev.off()
