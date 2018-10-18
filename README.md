# Exon-capture to Phylogeny
Last Update: 2018-10-18

### Description
In this project I will be developing scripts to generate a phylogenetic tree using exon-capture data. I have test .fastq files of goby (Gobiidae) sequences from Kuang et al. 2018 and will use methods from the same publication as a framework for developing reproducible scripts which I can then apply to my own flatfish (Pleuronectidae) sequences when they arrive.

###### Workflow from Kuang et al. 2018 is as follows:
1. Raw reads from Illumina sequencer
2. BCL to fastq format demultiplex
3. Remove adapter sequences and low quality score reads
4. Remove the duplicates from PCR, parse the reads to each locus
5. Assemble the filtered reads into contigs
6. Merge the loci containing more than one contigs
7. Retrieve orthology by pairwise alignment to corresponding baits sequence
8. Identify orthology by comparing the retrieved sequence to the genome of O. nilotics (bait source)
9. Multiple sequences alignment
10. Downstream analysis

### Objectives
1. Create reproducible scripts which I can apply to other exon-capture datasets.
2. Get as far into the Kuang et al. 2018 workflow as I can. (Reaching Step 6 sounds reasonable given the timeframe of the course.)
3. Apply scripts to flatfish dataset.
4. Become more familiar with tools and techniques commonly used for processing bioinformatics datasets.

### Timeline
- Week 1: Get oriented in Bash, Jupyter, GitHub
- Week 2: Obtain raw data
- Week 3: Quality check data and install required programs
- Week 4 (planned): Trim adapters and filter low quality sequences (Step 4)
- Week 5 (planned): Start assembling filtered reads into contigs (Step 5)

### Details

Project Directory Location:

    Local  - /Users/calderatta/Desktop/FISH\ 546\ -\ Bioinformatics/project/
    GitHub - /Users/calderatta/Documents/GitHub/calder-exon-capture/

Contents:

    analysis/
    2018-10-18 (Empty)

    calder-exon-capture.ipynb
    2018-10-18 Jupyter project associated with the project.

    kuang-et-al-2018/ (Not on GitHub)
    2018-10-18 Contains publication and associated supplamentary material.

    README.md
    2018-10-18 You Are Here! Contains details about project, organization, and history.

    scripts/
    2018-10-18 (Empty)

    data/
    2018-10-18 Contains source .fastq files (Empty on GitHub)
