#####
# A script that  reads the data, performs preprocessing on date and time
# and filters out only required subset of data


setwd("/Volumes/umb/Exploratory Data Analysis/ExData_Plotting1/")
elec <- read.table("data/household_power_consumption.txt", sep = ";", header = T)
elec$Date <- as.Date(elec$Date, "%d/%m/%Y")
subset.elec <- subset(elec, Date >= "2007-02-01" & Date <= "2007-02-02")
subset.elec <- within(subset.elec, DateTime <- strptime(paste(Date, Time),
                                            format = "%Y-%m-%d %T"))
elec$Date <- as.Date(elec$Date, "%d/%m/%Y")
subset.elec <- subset(elec, Date >= "2007-02-01" & Date <= "2007-02-02")

write.csv(subset.elec, "data/subset_data.csv", col.names = TRUE)