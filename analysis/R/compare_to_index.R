library(ShortRead)

setwd("/Users/calderatta/Desktop/FISH546_Bioinformatics/project/markers")
file <- "MudSkipper_Kit_Plus_Opsins.fas"
reads <- readFasta(file)
sread(reads)[1:10]
length(reads)        # Number of reads             = 18400
table(width(reads))  # Distribution of read sizes
mean(width(reads))   # Average read sizes          = 179.4997
sd(width(reads))     # Standard dev of read sizes  = 158.3789
min(width(reads))    # Smallest read size          = 38
max(width(reads))    # Largest read size           = 5051
sum(width(reads))    # Number of bases             = 3302187

setwd("/Users/calderatta/Desktop/FISH546_Bioinformatics/project/presentation")

# Plot Histogram of Markers Size

svg("fig-marker-size.svg",width=10,height=3, bg=NA)
hist(width(reads),breaks=seq(0,5100,5),main=NULL,xlab="Gene Size (bp)",yaxt="n",ylab=NULL)
dev.off()

# Plot Percent of Markers Mapped to Each Sample

samples <- c("TORN_Pool_4_S4","TORN_Pool_5_S5","TORN_Pool_6_S6","TORN_Pool_7_S7",
            "TORN_Pool_8_S8","TORN_Pool_9_S9","TORN_Pool_10_S10")
data <- c(7997,9664,8595,10218,10760,9946,7834)
percents <- data*100/18400

palette(rainbow(14)[6:12])

setwd("/Users/calderatta/Desktop/FISH546_Bioinformatics/project/presentation")

svg("fig-perc-markers.svg",width=6,height=6, bg=NA)

par(mar=c(10,5,0.5,4.5))
barplot(height=percents, names.arg=samples, las=2,
        ylim=c(0,100), yaxt="n", col=c(1:7))
axis(side=2, at=c(seq(0, 100, 10)), labels=paste(seq(0, 100, 10),"%",sep=""), las=2)
axis(side=4, at=c(0, 5000, 10000, 15000, 18400)*100/18400, labels=c(0, 5000, 10000, 15000, 18400), las=2)
mtext(side = 1, line = 8.5, 'Samples')
mtext(side = 2, line = 3, 'Percent of Reads')
mtext(side = 4, line = 3.5, 'No. of Markers')

dev.off()
