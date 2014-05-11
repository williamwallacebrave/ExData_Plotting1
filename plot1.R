
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
x_label <- "Global Active Power (kilowatts)"
y_label <- "Frequency"
title <- "Global Active Power"
plot_color <- "#ff2500" # color as on original plot captured using gimp

# plot histogram
hist(
    table_data$Global_active_power, 
    main=title, 
    xlab=x_label,
    ylab=y_label,
    col=plot_color) 

# and save as png
plot_name <- "plot1.png"
dev.copy(png, file=plot_name, width=480, height=480, units = "px") 
dev.off()
