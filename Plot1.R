#read the file - unfortunately, it would be quite a problem to optimize it:
#just truncated the input 100k rows manually
data_main<-read.csv("household_power_consumption.txt",nrows = 100000,header = T,sep = ";",na.strings = "?")

#subset the parse the dates  - only point to tackle in data input
data_main<-subset(data_main,Date %in% c('1/2/2007','2/2/2007'))
#parse the dates  - only point to tackle in data input
data_main$DateTime<-strptime(paste(data_main$Date,data_main$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

#Plot 1

#start output to a file
filename = "Plot1.png"
png(filename=filename,width = 480,height = 480,bg = rgb(0,0,0,0))
attach(data_main)
#draw a plot

hist(Global_active_power,
     col="red",#color of the chart
     main = "Global Active Power",#header
     xlab = "Global Active Power (kilowatts)",#label for x Axis
     ylab="Frequency" #label for y Axis
     )

#Say Goodbye!
detach(data_main)
dev.off()
