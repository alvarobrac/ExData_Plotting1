# Download and unzip the data
fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./household_power_consumption.zip",mode="wb")
unzip("household_power_consumption.zip")

# Loading the data
household <- read.table("household_power_consumption.txt", header=TRUE, sep =";", na.strings ="?")
# Transform
household$Date <- as.Date(household$Date,"%d/%m/%Y")
# Filter
data <- subset(household,Date == "2007-02-01" | Date == "2007-02-02")
# Transform
data$datetime <- strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S")
# Print Plots
png(filename ="plot4.png", width = 480, height = 480)
par(mfcol=c(2,2))
## Plot 1
with(data,plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
## Plot 2
# No plotting
with(data,plot(datetime,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
# Points for Sub_metering_1
with(data,points(datetime,Sub_metering_1,type="l",col="black"))
# Points for Sub_metering_2
with(data,points(datetime,Sub_metering_2,type="l",col="red"))
# Points for Sub_metering_3
with(data,points(datetime,Sub_metering_3,type="l",col="blue"))
# Legend 
legend("topright", lty = 1, bty="n", col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
## Plot 3
with(data,plot(datetime,Voltage,type="l"))
## Plot 4
with(data,plot(datetime,Global_reactive_power,type="l"))
dev.off()
