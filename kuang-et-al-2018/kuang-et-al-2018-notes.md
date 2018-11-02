# Kuang et al. 2018 Notes

***
## Citation:
Kuang T, Tornabene L, Li J, Jiang J, Chakrabarty P, Sparks JS, Naylor GJP, Li C. Phylogenomic analysis on the exceptionally diverse fish clade Gobioidei (Actinopterygii: Gobiiformes) and data-filtering based on molecular clocklikeness. Molecular Phylogenetics and Evolution. 2018; 128: 192-202. https://doi.org/10.1016/j.ympev.2018.07.018.


## Description
In this project I will be developing scripts to generate a phylogenetic tree using exon-capture data. I have test .fastq files of goby (Gobiidae) sequences from Kuang et al. 2018 and will use methods from the same publication as a framework for developing reproducible scripts which I can then apply to my own flatfish (Pleuronectidae) sequences when they arrive.
##### Workflow from Kuang et al. 2018 is as follows:
1. Raw reads from Illumina sequencer
2. BCL to fastq format demultiplex (Illumina bcl2fastq package)
3. Remove adapter sequences and low quality score reads (Cutadapt 1.1 Trim_golare v0.2.8)
4. Remove the duplicates from PCR, parse the reads to each locus (A custom perl script: preads (supplementary))
5. Assemble the filtered reads into contigs (Trinity v20140717)
6. Merge the loci containing more than one contigs (Geneious v7.1.5)
7. Retrieve orthology by pairwise alignment to corresponding baits sequence (A custom Perl script: Smith-Waterman algorithm)
8. Identify orthology by comparing the retrieved sequence to the genome of O. nilotics (bait source) (Blast v2.2.27)
9. Multiple sequences alignment (Clustal Omega v1.1.1)
10. Downstream analysis

## Notes

- Samples and Genes
	- Sampled 43 species
	- 1 mt markers (COI)
	- 17817 nu markers (120bp baits)
		- target region <120bp was padded with T to 120bp
- Filtering
	- only used sequences found in all species and <5% missing data -> 570 markers
	- parameters for evaluating usefulness (calculated for all markers)
		1. Average pairwise difference (p-dist)
		2. Molecular clocklikeness (MCL)
