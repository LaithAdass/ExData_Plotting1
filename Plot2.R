
plot2.function=function(){
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
  png(filename='plots/plot2.png',width=480,height=480,units='px')
  
  # plot data
  plot(plotsubject$DateTime,plotsubject$GlobalActivePower,ylab='Global Active Power (kilowatts)', xlab='', type='l')
  
  x<-dev.off()
}


