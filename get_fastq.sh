#!/bin/bash

# usage:
# chmod +x download.sh
# pbpaste | download.sh
# cat list.txt | get_fastq.sh

#list.txt contains files from sratool with full urls.
#ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR598/001/ERR5981981/ERR5981981_1.fastq.gz
#ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR598/001/ERR5981981/ERR5981981_2.fastq.gz
#ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR598/002/ERR5981982/ERR5981982_1.fastq.gz
#ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR598/002/ERR5981982/ERR5981982_2.fastq.gz

#script
while read -r full_url
do
  echo "downloading ${full_url}"
  curl "$full_url" --output $(basename ${full_url})
done < "${1:-/dev/stdin}"
