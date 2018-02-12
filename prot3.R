# Draw a plot for Date/Time - Sub_metering_1, Sub_metering_2, and Sub_metering_3 with legend

windows(height = 6, width = 6)

with(the_table, {
  plot(Sub_metering_1~date_and_time, 
       type="l",
       ylab="Energy sub metering", 
       xlab="")
  lines(Sub_metering_2~date_and_time,
        col='Red')
  lines(Sub_metering_3~date_and_time,
        col='Blue')
})

legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), 
       lwd=c(1,1,1))

# Save as a a PNG file with a width of 480 pixels and a height of 480 pixels

dev.copy(png,"plot3.png", width=480, height=480)
dev.off()
