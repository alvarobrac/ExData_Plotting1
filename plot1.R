## Loading the data
household <- read.table("household_power_consumption.txt", header=TRUE, sep =";", na.strings ="?")
# Transform
household$Date <- as.Date(household$Date,"%d/%m/%Y")
# Filter
data <- subset(household,Date == "2007-02-01" | Date == "2007-02-02")
# Transform
data$datetime <- strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S")
# Print Plot
png(filename ="plot1.png", width = 480, height = 480)
hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
