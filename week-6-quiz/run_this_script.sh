#!/bin/bash
    set -e
    set -u
    set -o pipefail

# This script finds the number of sequences in all the download Fastq files.

# First, download the files from http://eagle.fish.washington.edu. It will take 10-20min to download.

curl http://eagle.fish.washington.edu/fish546/calder/week-6-quiz-data/TORN_Pool_4_S4_L006_R1_001.fastq > TORN_Pool_4_S4_L006_R1_001.fastq
curl http://eagle.fish.washington.edu/fish546/calder/week-6-quiz-data/TORN_Pool_4_S4_L008_R1_001.fastq > TORN_Pool_4_S4_L008_R1_001.fastq
curl http://eagle.fish.washington.edu/fish546/calder/week-6-quiz-data/TORN_Pool_5_S5_L006_R1_001.fastq > TORN_Pool_5_S5_L006_R1_001.fastq
curl http://eagle.fish.washington.edu/fish546/calder/week-6-quiz-data/TORN_Pool_5_S5_L008_R1_001.fastq > TORN_Pool_5_S5_L008_R1_001.fastq
curl http://eagle.fish.washington.edu/fish546/calder/week-6-quiz-data/TORN_Pool_6_S6_L006_R1_001.fastq > TORN_Pool_6_S6_L006_R1_001.fastq
curl http://eagle.fish.washington.edu/fish546/calder/week-6-quiz-data/TORN_Pool_6_S6_L008_R1_001.fastq > TORN_Pool_6_S6_L008_R1_001.fastq

# Move the downloaded files into a separate folder.

mkdir data
mv *.fastq data/

# Find the number of sequences for lane 6 (L006) files, then for lane 8 (L008).

find data/TORN_Pool_*_L006_R1_001.fastq | xargs grep -c "@"
find data/TORN_Pool_*_L008_R1_001.fastq | xargs grep -c "@"