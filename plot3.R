
# ------------------------------
# get filtered data for the plot
# ------------------------------
# this script uses external script that ships get_data
# functions which fetches data needed for the plot
source("get_data.R")
table_data <- get_data()

# -------------
# plotting part
# -------------
par(mfrow = c(1, 1))
y_label <- "Energy sub metering"

# plot multiline plot
x <- table_data$Date + table_data$Time
plot(x, table_data$Sub_metering_1, type="n", xlab='', ylab=y_label, bg="transparent") 
lines(x, table_data$Sub_metering_1, col="black")
lines(x, table_data$Sub_metering_2, col="red")
lines(x, table_data$Sub_metering_3, col="blue")
legend("topright",  
       lty="solid",
       col=c("black", "red", "blue"), 
       # add extra spaces to fix ubuntu legend bug when saving to png 
       legend=c("Sub_metering_1      ", "Sub_metering_2      ", "Sub_metering_3      "))

# and save as png
plot_name <- "plot3.png"
dev.copy(png, file=plot_name, width=480, height=480, units = "px") 
dev.off() 
