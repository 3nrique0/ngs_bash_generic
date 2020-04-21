#! /bin/bash

## VARIABLES

# path=/home/enrique/work/Gandon/coevolution/phages/
path=$1
step_name=$2
n_threads=35
# n_threads=$3

## Maybe declaring the place where trimmomatic.jar is stored should vo to a variable



## SCRIPT

mkdir -p steps/$step_name/

trimm_summary=steps/$step_name/summary_trimm

rm -rf ${trimm_summary}
touch ${trimm_summary}


## DO TRIMMING FOR W_SEQUENCES.



for i in ${path}/*_R1_*.fastq.gz
do
    shortname=$(basename -s _L001_R1_001.fastq.gz $i);
    echo $shortname >> ${trimm_summary};
    echo "Working on file " $shortname;
    java -jar /usr/local/src/Trimmomatic-0.38/trimmomatic-0.38.jar \
        PE \
        -threads $n_threads \
        -phred33 \
        -summary /tmp/tmp.trimm_summary \
        -quiet \
        $i \
        ${i/_R1_/_R2_} \
        steps/$step_name/${shortname}_R1.fq.gz \
        steps/$step_name/uniq/U1.fq.gz \
        steps/$step_name/${shortname}_R2.fq.gz \
        steps/$step_name/uniq/U2.fq.gz \
        CROP:98 \
        HEADCROP:13 \
        SLIDINGWINDOW:2:20 \
        MINLEN:85
    cat /tmp/tmp.trimm_summary >> ${trimm_summary};
    rm -rf steps/$step_name/uniq/*;
    echo -e '\n####' >> ${trimm_summary};
done

rm -rf steps/$step_name/uniq/
