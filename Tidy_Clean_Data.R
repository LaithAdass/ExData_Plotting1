# required packages
library(data.table)
library(lubridate)

tidy.clean.data=function(){
  download.data()
  tidy.data()
}

download.data = function() {
  ##the following function creates a folder Data after checking if it exists of not
  if (!file.exists("Data")) {
    message("Creating data directory")
    dir.create("Data")
  }
  ##the following function checkes if there is a tidy and clean data set for work and if not it downloads it
  if (!file.exists("Data/power_consumption.txt")) {
    fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    message("Downloading data")
    download.file(fileURL, destfile="Data/power_consumption.zip", method="libcurl")
    unzip("./Data/power_consumption.zip", exdir="./Data", overwrite = TRUE)
  }
  list.files(path="Data")
}

tidy.data= function(){
  # read the raw table and limit to 2 days
  variable.class<-c(rep('character',2),rep('numeric',7))
  power.consumption<-read.table('Data/household_power_consumption.txt',header=TRUE,
                                sep=';',na.strings='?',colClasses=variable.class)
  power.consumption<-power.consumption[power.consumption$Date=='1/2/2007' | power.consumption$Date=='2/2/2007',]
  
  # clean up the variable names and convert date/time fields
  cols<-c('Date','Time','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity',
          'SubMetering1','SubMetering2','SubMetering3')
  colnames(power.consumption)<-cols
  power.consumption$DateTime<-dmy(power.consumption$Date)+hms(power.consumption$Time)
  power.consumption<-power.consumption[,c(10,3:9)]
  
  # write a clean data set to the directory
  write.table(power.consumption,file='Data/tidy_power_consumption.txt',sep='|',row.names=FALSE)

  power.consumption<-read.table('Data/tidy_power_consumption.txt',header=TRUE,sep='|')
  power.consumption$DateTime<-as.POSIXlt(power.consumption$DateTime)
  

# View Result
  list.files(path="Data")
  
}