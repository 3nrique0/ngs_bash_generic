#!/bin/bash

## PATH TO FASTQC CONTAINING DIRECTORY
path=$1

## STEP NAME, USED FOR OUTDIR
step_name=$2

## String for naming the dataset for multiqc
dataset=$3

mkdir -p steps/${step_name}/{fastqc,multiqc}

## START ENVIRONMENT TO EXECUTE MULTIQC

source ~/envs/david/bin/activate


### MAKE RUN FASTQC ON EACH GROUP

mkdir -p steps/${step_name}/{fastqc,multiqc}

fastqc -t 35 --noextract -o steps/$step_name/fastqc/  ${path}*



## MAKE MULTIQC FOR ALL FILES
#multiqc -f -i $dataset -n $dataset -o steps/$step_name/multiqc  steps/$step_name/fastqc/*

## MAKE MULTIQC EXCLUDING REMOVED READS AFTER DEMULTIPLEXING:

tempdir=$(mktemp -d)

for i in $(ls -I '*rem*' -I '*.html' ${PWD}/steps/$step_name/fastqc/);
do
   # echo $PWD/$i;
   ln -s ${PWD}/steps/$step_name/fastqc/$i $tempdir;
done

multiqc -f -i $dataset -n $dataset -o steps/$step_name/multiqc_no_rem  $tempdir/* 

rm -rf $tempdir

deactivate


# multiqc -f -i $dataset -n $dataset -o steps/$step_name/multiqc  $(ls !(steps/$step_name/fastqc/*rem*) )
