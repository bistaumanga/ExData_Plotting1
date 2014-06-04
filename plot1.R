subset.elec <- read.csv("data/subset_data.csv")
png("plots/plot1.png", height = 480, width = 480, units = "px")
with(subset.elec, hist(Global_active_power, breaks = 12, 
                       col = "red", main = "Global Active Power", 
                       xlab = "Global Active Power (kilowatts)"))
dev.off()