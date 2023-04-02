#!/bin/bash

# Create a sub-directory for ShortBRED output
mkdir shortbred_output


time parallel -j 10 \
"python shortbred/shortbred_quantify.py \
--markers cyl_markers.faa \
--wgs {1} {2} \
--results shortbred_output/{1/.}.tsv \
--tmp shortbred_output/{1/.}_dir \
--usearch ./shortbread/usearch" \
::: shotgun_files/*_1.fastq.gz :::+ fastqfiles/*_2.fastq.gz