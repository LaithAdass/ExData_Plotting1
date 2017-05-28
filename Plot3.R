
plot3.function=function(){
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
  
  png(filename='plots/plot3.png',width=480,height=480,units='px')
  
  # plot data
  lncol<-c('black','red','blue')
  lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
  plot(plotsubject$DateTime,plotsubject$SubMetering1,type='l',col=lncol[1],xlab='',ylab='Energy sub metering')
  lines(plotsubject$DateTime,plotsubject$SubMetering2,col=lncol[2])
  lines(plotsubject$DateTime,plotsubject$SubMetering3,col=lncol[3])
  
  # add legend
  legend('topright',legend=lbls,col=lncol,lty='solid')
  
  x<-dev.off()
}




