#!/bin/env bash
dataset=$1
reads=$2
mkdir -p ./out/${dataset}
mkdir -p ./data/raw/${dataset}/sub
# for sample1 in $(find ./data/raw/${dataset} -maxdepth 1 -name "*_1.fastq.gz")
# do
#   BASE=$(basename $sample1 "_1.fastq.gz")
#   sample2=./data/raw/${dataset}/${BASE}_2.fastq.gz
#     if [[ -f $sample2 ]]; then
#       ska fastq -o $HOME/IDSeq_tick/out/${dataset}/${BASE}_full $sample1 $sample2
#     else
#       ska fastq -o $HOME/IDSeq_tick/out/${dataset}/${BASE}_full $sample1
#     fi
#   done
#
# exit

for sample1 in $(find ./data/raw/${dataset} -maxdepth 1 -name "*_R1.fastq.gz")
do
  BASE=$(basename $sample1 "_R1.fastq.gz")
  sample2=./data/raw/${dataset}/${BASE}_2.fastq.gz
  seqtk sample -s100 $sample1 $reads > "./data/raw/${dataset}/sub/${BASE}_1_sub.fastq.gz"
  if [[ -f $sample2 ]]; then
    seqtk sample -s100 $sample2 $reads > "./data/raw/${dataset}/sub/${BASE}_2_sub.fastq.gz"
  fi
done

for sample1 in $(find ./data/raw/${dataset}/sub -maxdepth 1 -name "*_1_sub.fastq.gz")
do
  BASE=$(basename $sample1 "_1_sub.fastq.gz")
  sample2=./data/raw/${dataset}/sub/${BASE}_2_sub.fastq.gz
  if [[ -f $sample2 ]]; then
    ska fastq -o $HOME/IDSeq_tick/out/${dataset}/${BASE} $sample1 $sample2
  else
    ska fastq -o $HOME/IDSeq_tick/out/${dataset}/${BASE} $sample1
  fi
done
