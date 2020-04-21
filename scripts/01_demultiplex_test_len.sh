#! /bin/bash


#mkdir -p $outdir

outdir=steps/01_demultiplex_test_len/as03_90/idx1/
mkdir -p $outdir


## Adapters:
a1=ACACTCTTTCCCTACACGACGCTCTTCCGATCT
a2=AATTAGATCGGAAGAGCGAGAACAA


## AS03
indir=data/raw_data/GenoScreen/AS03/
as0=as03

time process_radtags -1 ${indir}Idx1_S1_L001_R1_001.fastq.gz  -2 ${indir}Idx1_S1_L001_R2_001.fastq.gz  -P  -e pstI  -r  -c  -q  -t 90  --adapter_1 $a1  --adapter_2 $a2  --adapter_mm 2  -o ${outdir}  -b data/barcodes/${as0}_Idx1.csv 

scripts/quality_check.sh  $outdir  qc_demultiplex_test_len/len90/  as03_idx1_90

outdir=steps/01_demultiplex_test_len/as03_95/idx1/
mkdir -p $outdir

time process_radtags -1 ${indir}Idx1_S1_L001_R1_001.fastq.gz  -2 ${indir}Idx1_S1_L001_R2_001.fastq.gz  -P  -e pstI  -r  -c  -q  -t 95  --adapter_1 $a1  --adapter_2 $a2  --adapter_mm 2  -o ${outdir}  -b data/barcodes/${as0}_Idx1.csv 

scripts/quality_check.sh  $outdir  qc_demultiplex_test_len/len95/  as03_idx1_95
