alldata <- read.table("./household_power_consumption.txt", 
                      sep = ";", header = T,
                      na.strings = "?")
alldata[[1]] <- strptime(paste(alldata[[1]],alldata[[2]]), "%d/%m/%Y %H:%M:%S")
names(alldata)[1] <- "Date_time"
alldata <- alldata[-2]
select_by_date <- as.Date(alldata[[1]]) == "2007-02-01" | as.Date(alldata[[1]]) == "2007-02-02"
selected_data <- alldata[select_by_date,]

png("plot3.png")
with(selected_data, {
      plot(Date_time, Sub_metering_1, 
                         type = "n",
                         xlab = "",
                         ylab = "Energy sub metering")
      points(Date_time, Sub_metering_1, 
                           type = "l",
                           col = "black")
      points(Date_time, Sub_metering_2, 
                           type = "l",
                           col = "red")
      points(Date_time, Sub_metering_3, 
                           type = "l",
                           col = "blue")
     })
legend("topright", lty = 1, 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
