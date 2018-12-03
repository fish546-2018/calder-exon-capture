#!/bin/bash
## Job Name
#SBATCH --job-name=calder_blast
## Allocation Definition 
#SBATCH --account=srlab
#SBATCH --partition=srlab
## Resources
## Nodes (We only get 1, so this is fixed)
#SBATCH --nodes=1
## Walltime (days-hours:minutes:seconds format)
#SBATCH --time=30-0:00:10
## Memory per node
#SBATCH --mem=120
##turn on e-mail notification
#SBATCH --mail-type=ALL
#SBATCH --mail-user=samwhite@uw.edu
## Specify the working directory for this job
#SBATCH --workdir=/gscratch/srlab/calder_exon_capture

# Add BLAST to system PATH
export PATH=$PATH:/gscratch/srlab/programs/ncbi-blast-2.6.0+/bin

# Run Calder's script (modified - removed curl and unzip commands from original version)
bash main.sh
