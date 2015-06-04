## Set WD to the location of file
setwd(dirname(parent.frame(2)$ofile))

source('helpers.R')

pcons <- getData()

#View(pcons)
plot(
  pcons$Date, 
  pcons$Sub_metering_1, 
  type="l",
  xlab = "",
  ylab = "Energy sub metering",
  col="black"
)

## Sub Metering 2
lines(
  x = pcons$Date, 
  y = pcons$Sub_metering_2, 
  type = "l", 
  col = "red"
)

## Sub Metering 3
lines(
  x = pcons$Date, 
  y = pcons$Sub_metering_3, 
  type = "l", 
  col = "blue"
)

## Legend
legend(
  "topright",  
  col = c("black", "red", "blue"), 
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  pch = "___"
)

dev.copy(png, file="./plot3.png")
dev.off()
