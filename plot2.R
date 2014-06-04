subset.elec <- read.csv("data/subset_data.csv")
png("plots/plot2.png", height = 480, width = 480, units = "px")
subset.elec$DateTime <- strptime(subset.elec$DateTime,
                                          format = "%Y-%m-%d %T")
with(subset.elec, 
     plot(DateTime, Global_active_power, 
          type='l', xlab='', ylab='Global Active Power (kilowatts)'))
dev.off()
