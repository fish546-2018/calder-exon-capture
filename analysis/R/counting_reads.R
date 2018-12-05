library(ShortRead)

#===== Find number of reads in file and average length of those reads. =====#

# Set Sample Names

samples <- c("TORN_Pool_4_S4",
             "TORN_Pool_5_S5",
             "TORN_Pool_6_S6",
             "TORN_Pool_7_S7",
             "TORN_Pool_8_S8",
             "TORN_Pool_9_S9",
             "TORN_Pool_10_S10")
lanes <- c("L006","L008")
directions <- c("R1","R2")

##### RAW DATA

setwd("/Users/calderatta/Desktop/FISH546_Bioinformatics/project/data")

# Create list of files in data/

data <- c()
for (sample in samples){
  for (lane in lanes){
    for (direction in directions){
      file <- paste(sample,"_",lane,"_",direction,"_001.fastq",sep="")
      data <- c(data,file)
    }
  }
}
data

# Test output for one file

file <- "TORN_Pool_4_S4_L006_R1_001.fastq"
reads <- readFastq(file)
sread(reads)[1:10]
length(reads)        # Number of reads
table(width(reads))  # Distribution of read lengths
mean(width(reads))   # Average read length
sd(width(reads))     # Standard deviation of read lengths

# Get output for all files

lengths <- c()
means <- c()
sds <- c()
for (file in data){
  print(file)
  reads <- readFastq(file)
  lengths <- c(lengths,length(reads))   # Number of reads
  means <- c(means,mean(width(reads)))  # Average read length
  sds <- c(sds,sd(width(reads)))        # Standard deviation of read lengths
}
(report <- data.frame(data, lengths, means, sds))

##### MERGEd DATA

setwd("/Users/calderatta/Desktop/FISH546_Bioinformatics/project/analysis/merge")

data <- c()
for (sample in samples){
  for (direction in directions){
    file <- paste(sample,"_",direction,".fastq",sep="")
    data <- c(data,file)
  }
}
data

lengths <- c()
means <- c()
sds <- c()
for (file in data){
  print(file)
  reads <- readFastq(file)
  lengths <- c(lengths,length(reads))   # Number of reads
  means <- c(means,mean(width(reads)))  # Average read length
  sds <- c(sds,sd(width(reads)))        # Standard deviation of read lengths
}
(report <- data.frame(data, lengths, means, sds))

##### TRIM-GALORE

setwd("/Users/calderatta/Desktop/FISH546_Bioinformatics/project/analysis/trimgalore")

data <- c()
for (sample in samples){
  for (direction in directions){
    file <- paste(sample,"_",direction,".fq",sep="")
    data <- c(data,file)
  }
}
data

lengths <- c()
means <- c()
sds <- c()
for (file in data){
  print(file)
  reads <- readFastq(file)
  lengths <- c(lengths,length(reads))   # Number of reads
  means <- c(means,mean(width(reads)))  # Average read length
  sds <- c(sds,sd(width(reads)))        # Standard deviation of read lengths
}
(report <- data.frame(data, lengths, means, sds))

##### PREADS-RMREP

setwd("/Users/calderatta/Desktop/FISH546_Bioinformatics/project/analysis/preads-rmrep")

data <- c()
for (sample in samples){
  for (direction in directions){
    file <- paste(sample,"_rmrep_",direction,".fq",sep="")
    data <- c(data,file)
  }
}
data

lengths <- c()
means <- c()
sds <- c()
for (file in data){
  print(file)
  reads <- readFastq(file)
  lengths <- c(lengths,length(reads))   # Number of reads
  means <- c(means,mean(width(reads)))  # Average read length
  sds <- c(sds,sd(width(reads)))        # Standard deviation of read lengths
}
(report <- data.frame(data, lengths, means, sds))

##### PREADS-RMREP

setwd("/Users/calderatta/Desktop/FISH546_Bioinformatics/project/analysis/preads-bandp/")

data <- c()
for (sample in samples){
    file <- paste(sample,"_results",sep="")
    data <- c(data,file)
}
data

files <- c()
length.means <- c()
length.sds <- c()
means <- c()
sds <- c()
widths.all <- c()
for (output in data){
  print(output)
  setwd(paste("/Users/calderatta/Desktop/FISH546_Bioinformatics/project/analysis/preads-bandp-torn/",output,sep=""))
  lengths <- c()
  widths <- c()
  for (file in list.files(pattern = "\\.fq$")) {
    reads <- readFastq(file)
    lengths <- c(lengths,length(reads))   # Number of reads
    widths <- c(widths, width(reads))
  }
  files <- c(files, length(list.files(pattern = "\\.fq$")))      # Number of files
  length.means <- c(length.means, mean(lengths))  # Number of read counts
  length.sds <- c(length.sds, sd(lengths))        # Standard deviation of read counts
  means <- c(means, mean(widths))                 # Average read length
  sds <- c(sds,sd(widths))                        # Standard deviation of read lengths
  widths.all <- c(widths.all, length(widths))     # Total read counts
}
(report <- data.frame(data, length.means, length.sds, means, sds, widths.all))

# To run by individual samples use this

output <- data[7]
print(output)
setwd(paste("/Users/calderatta/Desktop/FISH546_Bioinformatics/project/analysis/preads-bandp/",output,sep=""))
lengths <- c()
widths <- c()
for (file in list.files(pattern = "\\.fq$")) {
  reads <- readFastq(file)
  lengths <- c(lengths,length(reads))   # Number of reads
  widths <- c(widths, width(reads))
}
length(list.files(pattern = "\\.fq$"))      # Number of files
mean(lengths)                               # Number of read counts
sd(lengths)                                 # Standard deviation of read counts
mean(widths)                                # Average read length
sd(widths)                                  # Standard deviation of read lengths
