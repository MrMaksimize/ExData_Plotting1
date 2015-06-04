source('helpers.R')

pcons <- getData()

View(pcons)
plot(
  pcons$Date, 
  pcons$Global_active_power, 
  type="l",
  xlab = "",
  ylab = "Global Active Power (kilowatts)"
)

#dev.copy(png, file="./plot2.png")
#dev.off()
