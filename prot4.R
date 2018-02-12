# Draw mult plots for followings:
# 1) Date/Time - Global_active_power
# 2) Date/Time - Voltage
# 3) Date/Time - Sub_metering_1, Sub_metering_2, and Sub_metering_3
# 4) Date/Time - Global_reactive_power

windows(height = 6, width = 6)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(the_table, {
  
  
  plot(Global_active_power~date_and_time, 
       type="l", 
       ylab="Global Active Power (kilowatts)", 
       xlab="")
  
  plot(Voltage~date_and_time, 
       type="l", 
       ylab="Voltage", 
       xlab="datetime")
  
  plot(Sub_metering_1~date_and_time, 
       type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~date_and_time,col='Red')
  lines(Sub_metering_3~date_and_time,col='Blue')
  legend("topright", 
         col=c("black", "red", "blue"), 
         #lty=1, lwd=2, bty="n",
         lty=1,
         lwd=c(1,1,1),
         bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(Global_reactive_power~date_and_time, 
       type="l", 
       ylab="Global_reactive_power",
       xlab="datetime")
})

# Save as a a PNG file with a width of 480 pixels and a height of 480 pixels

dev.copy(png,"plot4.png", width=480, height=480)
dev.off()