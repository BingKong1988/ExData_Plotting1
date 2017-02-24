alldata <- read.table("./household_power_consumption.txt", 
                      sep = ";", header = T,
                      na.strings = "?")
alldata[[1]] <- strptime(paste(alldata[[1]],alldata[[2]]), "%d/%m/%Y %H:%M:%S")
names(alldata)[1] <- "Date_time"
alldata <- alldata[-2]
select_by_date <- as.Date(alldata[[1]]) == "2007-02-01" | as.Date(alldata[[1]]) == "2007-02-02"
selected_data <- alldata[select_by_date,]

png("plot2.png")
with(selected_data, plot(Date_time, Global_active_power, 
                         type = "l",
                         col = "black",
                         xlab = "",
                         ylab = "Global Active Power (kilowatts)"))
dev.off()
