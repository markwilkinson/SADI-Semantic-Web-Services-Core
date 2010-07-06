library(gplots)

args = commandArgs(trailingOnly=TRUE)
args
data = read.table(args[1])

plotData = t( data[ 1:nrow(data), 2:ncol(data) ] )
shadingAngles = c(45, 45, -45, -45)
shadingDensities = c(10, 20, 10, 20)

legendLabels = c(
	'base time forward', 
	'time per input forward', 
	'base time reverse', 
	'time per input reverse')

barLabels = t( data[ , 1] )

png(args[3])

# las = 3 means draw all axis labels vertically
par(las=3)
# mar(bottom, left, top, right) sets margins (measured in lines of text)
par(mar=c(10, 4, 4, 2))

barplot2(
	plotData, 
	col=rgb(0.0, 0.0, 0.0), 
	ylim=c(0, 4000),
	ylab='Time (Milliseconds)',
	angle=shadingAngles, 
	density=shadingDensities, 
	main=args[2], 
	legend.text=legendLabels, 
	names.arg=barLabels, 
	beside=TRUE)

dev.off()