#!/usr/bin/bash

# Require: GNU-parallel, sra-tools, parallel-fastq-dump
# Permision: chmod 777 get_fastq_from_SRA.sh
# Usage: ./get_SRR_sratool.sh list_sraid.txt threads

# sra_acc_list=$1 # in .txt file
# threads=$2

sort -u $sra_acc_list | parallel -j $threads "prefetch {} --max-size u"

#if not using prefix, don't use above code

file="list_sraid.txt"
lines=$(cat $file)

for line in $lines; do
	echo $line
        parallel-fastq-dump -s $line -t 8 -O fastq_out/ --split-files --gzip;
done
