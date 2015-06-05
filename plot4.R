## Set WD to the location of file
setwd(dirname(parent.frame(2)$ofile))

source('helpers.R')

pcons <- getData()
par(mfcol = c(2,2))

with(pcons, {
  ## Topleft
  plot(
    pcons$Date, pcons$Global_active_power, type="l",
    xlab = "", ylab = "Global Active Power (kilowatts)"
  )
  ## BottomLeft
  plot(
    pcons$Date, pcons$Sub_metering_1, type="l",
    xlab = "", ylab = "Energy sub metering", col="black"
  )
  ## Sub Metering 2
  lines(x = pcons$Date, y = pcons$Sub_metering_2, type = "l", col = "red")
  
  ## Sub Metering 3
  lines(x = pcons$Date, y = pcons$Sub_metering_3, type = "l", col = "blue")
  
  ## Legend
  legend(
    bty = "n", "topright",  col = c("black", "red", "blue"), 
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    pch = "___",
  )
  
  ## Topright
  plot(
    pcons$Date, pcons$Voltage, type="l",
    xlab = "datetime", ylab = "Voltage", col="black"
  )
  
  ## Bottomright
  plot(
    pcons$Date, pcons$Global_reactive_power, type="l",
    xlab = "datetime", ylab = "Global Reactive Power", col="black"
  )
})


dev.copy(png, file="./plot4.png")
dev.off()
