
# ------------------------------
# get filtered data for the plot
# ------------------------------
source("get_data.R")
table_data <- get_data()

# -------------
# plotting part
# -------------
par(mfrow = c(2, 2))
x <- table_data$Date + table_data$Time

# line plot for Global Active Power
y_label <- "Global Active Power"
plot(x, table_data$Global_active_power, type="n", xlab='', ylab=y_label) 
lines(x, table_data$Global_active_power)

# line plot for Voltage
y_label <- "Voltage"
x_label <- "datetime"
plot(x, table_data$Voltage, type="n", xlab=x_label, ylab=y_label) 
lines(x, table_data$Voltage)


# plot multiline plot
y_label <- "Energy sub metering"
plot(x, table_data$Sub_metering_1, type="n", xlab='', ylab=y_label) 
lines(x, table_data$Sub_metering_1, col="black")
lines(x, table_data$Sub_metering_2, col="red")
lines(x, table_data$Sub_metering_3, col="blue")
legend("topright",  
       lty="solid",
       col=c("black", "red", "blue"),
       # add extra spaces to fix ubuntu legend bug when saving to png 
       legend=c("Sub_metering_1    ", "Sub_metering_2    ", "Sub_metering_3    "),
       bty="n")

# line plot for Global_reactive_power
y_label <- "Global_reactive_power"
x_label <- "datetime"
plot(x, table_data$Global_reactive_power, type="n", xlab=x_label, ylab=y_label) 
lines(x, table_data$Global_reactive_power)

# and save as png
plot_name <- "plot4.png"
dev.copy(png, file=plot_name, width=480, height=480, units = "px") 
dev.off() 
