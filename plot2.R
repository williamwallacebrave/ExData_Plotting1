
# ------------------------------
# get filtered data for the plot
# ------------------------------
source("get_data.R")
table_data <- get_data()

# -------------
# plotting part
# -------------
par(mfrow = c(1, 1))
y_label <- "Global Active Power (kilowatts)"

# plot line plot
x <- table_data$Date + table_data$Time
y <- table_data$Global_active_power
plot(x, y, type="n", xlab='', ylab=y_label) 
lines(x, y)

# and save as png
plot_name <- "plot2.png"
dev.copy(png, file=plot_name, width=480, height=480, units = "px") 
dev.off()
