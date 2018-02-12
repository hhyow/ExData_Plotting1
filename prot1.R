# Draw a histgram for Frequency-Global_active_power

windows(height = 6, width = 6)

hist(the_table$Global_active_power, 
     main="Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     col="red")

# Save as a a PNG file with a width of 480 pixels and a height of 480 pixels

dev.copy(png,"plot1.png", width=480, height=480)
dev.off()
