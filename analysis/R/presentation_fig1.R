library(Cairo)

setwd("/Users/calderatta/Desktop/FISH546_Bioinformatics/project/presentation")
data <- read.csv("presentation_data.csv")

svg("fig-counts-to-sizes.svg",width=5,height=7, bg=NA)

par(mar=c(4,5,0,0), oma=c(1,1,1,1))

plot("n", xlim=c(100,170), ylim=c(0,1.5), xlab = "Average Read Size (bp)", ylab = expression(paste("Total Reads (x10"^"6"*")")), yaxt = "n")
points(x=data$Length.Ave.Ps[data$Step=="Raw"], y=data$Count.Total.Ps[data$Step=="Raw"]/10000000, col="forestgreen", cex=1, pch=20)
points(x=data$Length.Ave.Ps[data$Step=="Trim Galore"], y=data$Count.Total.Ps[data$Step=="Trim Galore"]/10000000, col="darkturquoise", cex=1, pch=20)
points(x=data$Length.Ave.Ps[data$Step=="Rmrep"], y=data$Count.Total.Ps[data$Step=="Rmrep"]/10000000, col="blue1", cex=1, pch=20)
points(x=data$Length.Ave.Ps[data$Step=="Bandp"], y=data$Count.Total.Ps[data$Step=="Bandp"]/10000000, col="purple3", cex=1, pch=20)
axis(side = 2, at = c(seq(0, 1.5, 0.2)))
#legend(x="topleft", legend=c("Raw", "Trim Galore", "Rmrep", "Bandp"), bty="n", pch=20,
#       col=c("forestgreen", "darkturquoise", "blue1", "purple3"))

dev.off()