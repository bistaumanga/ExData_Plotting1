subset.elec <- read.csv("data/subset_data.csv")
png("plots/plot4.png", height = 480, width = 480, units = "px")
par(mfrow = c(2, 2))

subset.elec$DateTime <- strptime(subset.elec$DateTime,
                                 format = "%Y-%m-%d %T")

### first plot

with(subset.elec, 
     plot(DateTime, Global_active_power, 
          type='l', xlab='', ylab='Global Active Power (kilowatts)'))

### second plot
with(subset.elec, 
     plot(DateTime, Voltage, 
          type='l', xlab='datetime', ylab='Voltage'))

### third plot
yrng = with(subset.elec, 
            range(c(Sub_metering_1, Sub_metering_3, Sub_metering_3)))

with(subset.elec, 
     plot(DateTime, Sub_metering_1,type='l', 
          ylim = yrng, xlab='', ylab='Global Active Power (kilowatts)'))
par(new = T)
with(subset.elec, 
     plot(DateTime, Sub_metering_2, col = "red", ylim = yrng,
          type='l', xlab='', xaxt = "n", yaxt = "n", ylab = ""))
par(new = T)
with(subset.elec, 
     plot(DateTime, Sub_metering_3, col = "blue", ylim = yrng,
          type='l', xlab='', xaxt = "n", yaxt = "n", ylab = ""))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = c(1, 1, 1), cex = .7)

### fourth plot
with(subset.elec, 
     plot(DateTime, Global_reactive_power, 
          type='l', xlab='datetime'))

dev.off()
