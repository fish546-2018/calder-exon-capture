# To Run Preads on MOX

***
## Objective:
Parse reads into corresponding genes

## Requirements:
Make sure `blastn` is installed to the PATH environmental variable.

## Instructions:
To initiate this job, run `main.sh` in Bash.

## Species file code:
- Species 9 = `9-S9`
- Species 10 = `10-S10`

## Input Files (Downloaded):
- `bandp.pl`
- `data.pm`
- `rename.sh`
- `rmrep.pl`
- `MudSkipper_Kit_Plus_Opsins.fas`
- `TORN_Pool_{insert species file code}_R1.fq`
- `TORN_Pool_{insert species file code}_R2.fq`
- `TORN_Pool_{insert species file code}_rmrep_R1.fq`
- `TORN_Pool_{insert species file code}_rmrep_R1.index`
- `TORN_Pool_{insert species file code}_rmrep_R2.fq`
- `TORN_Pool_{insert species file code}_rmrep_R2.index`
- `TORN_Pool_{insert species file code}.fas`
- `TORN_Pool_{insert species file code}.index`
- `TORN_Pool_{insert species file code}.nhr`
- `TORN_Pool_{insert species file code}.nin`
- `TORN_Pool_{insert species file code}.nsq`

## Output Files (Species Input Files Removed):
- `preads.1.log`
- `MudSkipper_Kit_Plus_Opsins.{insert species file code}.blast`
- `{insert species file code}_results/` Directory containing parsed sequecnes.
