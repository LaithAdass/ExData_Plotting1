
plot4.function=function(){
  ## creating folder for plots
  if (!file.exists('plots')) {
    message("Creating plots directory")
    dir.create('plots')
  }
  
  ## to download and tidy data for plotting 
  
  source("/Tidy_Clean_Data.R")
  
  powerCon<- tidy.clean.data()
  plotsubject<- read.table('Data/tidy_power_consumption.txt', sep='|', header=TRUE)
  
  ## open device, plot and close device 
  
  png(filename='plots/plot4.png',width=480,height=480,units='px')
  
  # make 4 plots
  par(mfrow=c(2,2))
  
  # plot data on top left (1,1)
  plot(plotsubject$DateTime,plotsubject$GlobalActivePower,ylab='Global Active Power',xlab='',type='l')
  
  # plot data on top right (1,2)
  plot(plotsubject$DateTime,plotsubject$Voltage,xlab='datetime',ylab='Voltage',type='l')
  
  # plot data on bottom left (2,1)
  lncol<-c('black','red','blue')
  lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
  plot(plotsubject$DateTime,plotsubject$SubMetering1,type='l',col=lncol[1],xlab='',ylab='Energy sub metering')
  lines(plotsubject$DateTime,plotsubject$SubMetering2,col=lncol[2])
  lines(plotsubject$DateTime,plotsubject$SubMetering3,col=lncol[3])
  
  # plot data on bottom right (2,2)
  plot(plotsubject$DateTime,plotsubject$GlobalReactivePower,xlab='datetime',ylab='Global_reactive_power',type='l')
  
  
  x<-dev.off()
}




