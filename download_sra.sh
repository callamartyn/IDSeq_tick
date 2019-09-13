#!/bin/env bash
project=$1
mkdir -p "data/raw/${project}"

esearch -db sra -query $project | efetch --format runinfo > data/metadata/${project}_runinfo.csv
cat data/metadata/${project}_runinfo.csv | cut -d "," -f 1 > SRR_numbers.txt
echo "$(tail -n +2 SRR_numbers.txt)" > "${project}_SRR_numbers.txt"
cat "${project}_SRR_numbers.txt" | while read line
do
  fastq-dump --split-files --origfmt --gzip --outdir "data/raw/${project}" $line
  done

rm SRR_numbers.txt
