# Draw a plot for Date/Time - Global_active_power

windows(height = 6, width = 6)

plot(the_table$Global_active_power~the_table$date_and_time, 
     type="l", 
     ylab="Global Active Power (kilowatts)", 
     xlab="")

# Save as a a PNG file with a width of 480 pixels and a height of 480 pixels

dev.copy(png,"plot2.png", width=480, height=480)
dev.off()