setwd("/Users/calderatta/Desktop/FISH546_Bioinformatics/project/presentation")
data <- read.csv("presentation_data.csv")

setwd("/Users/calderatta/Desktop/FISH546_Bioinformatics/project/presentation")
palette(rainbow(14)[6:12])

# TRIMGALORE

svg("fig-compare-trimgalore.svg",width=5,height=5, bg=NA)

par(mar=c(4,5,0,0), oma=c(1,1,1,1))
plot("n", xlim=c(110,150), ylim=c(110,150), xlab = "Kuang et al. 2014 Average Read Size (bp)", ylab = expression(paste("CA Average Read Size (bp)")))
x.eq.y <- data.frame(x=c(0,1000),y=c(0,1000))
abline(lm(x.eq.y$x~x.eq.y$y),col="grey")
points(x=data$Length.Ave.Ps[data$Step=="Trim Galore"], y=data$Length.Ave.Ps[data$Step=="Trim Galore"], col=c(1:7), cex=2, pch=20)

dev.off()

# PREADS-RMREP

svg("fig-compare-rmrep.svg",width=5,height=5, bg=NA)

par(mar=c(4,5,0,0), oma=c(1,1,1,1))
plot("n", xlim=c(0,10000000), ylim=c(0,10000000), xlab = "Kuang et al. 2014 Average Read Count", ylab = expression(paste("CA Average Read Count")))
x.eq.y <- data.frame(x=c(0,1000),y=c(0,1000))
abline(lm(x.eq.y$x~x.eq.y$y),col="grey")
points(x=data$Count.Total.Ps[data$Step=="Rmrep"], y=data$Count.Total.Ps[data$Step=="Rmrep"], col=c(1:7), cex=2, pch=20)

dev.off()

# PREADS-BANDP

svg("fig-compare-bandp.svg",width=5,height=5, bg=NA)

par(mar=c(4,5,0,0), oma=c(1,1,1,1))
plot("n", xlim=c(0,1000000), ylim=c(0,1000000), xlab = "Kuang et al. 2014 Average Read Count", ylab = expression(paste("CA Average Read Count")))
x.eq.y <- data.frame(x=c(0,1000),y=c(0,1000))
abline(lm(x.eq.y$x~x.eq.y$y),col="grey")
points(x=c(485372,263494,636180,483236,317526,404052,306168), y=data$Count.Total.Ps[data$Step=="Bandp"], col=c(1:7), cex=2, pch=20)

dev.off()
