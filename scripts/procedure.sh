#! /bin/bash

## Variables:


##################################################

### Quality check raw reads
## 1    PATH TO FASTQC CONTAINING DIRECTORY
## 2    STEP NAME, USED FOR OUTDIR
## 3    String for naming the dataset for multiqc
bash scripts/quality_check qc_raw_reads data/raw/reads

##################################################
## DEMULTIPLEXING
### As each pair of reads uses a different index,
### the whole process is hard written in this script
### It takes ~40min per process. You could parallelize up to 2,
### beyond that problems will arise for disk access
bash scripts/01_demultiplex.sh

