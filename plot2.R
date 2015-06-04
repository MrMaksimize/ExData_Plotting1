## Set WD to the location of file
setwd(dirname(parent.frame(2)$ofile))

source('helpers.R')

pcons <- getData()

plot(
  pcons$Date, 
  pcons$Global_active_power, 
  type="l",
  xlab = "",
  ylab = "Global Active Power (kilowatts)"
)

dev.copy(png, file="./plot2.png")
dev.off()
