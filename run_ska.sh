dataset=$1
mkdir -p ./out/${dataset}
mkdir -p ./data/raw/${dataset}/sub
for sample1 in $(find ./data/raw/${dataset} -maxdepth 1 -name "*_1.fastq.gz")
do
  BASE=$(basename $sample1 "_1.fastq.gz")
  sample2=./data/raw/${dataset}/${BASE}_2.fastq.gz
  seqtk sample -s100 $sample1 100000 > "./data/raw/${dataset}/sub/${BASE}_1_sub.fastq.gz"
  seqtk sample -s100 $sample2 100000 > "./data/raw/${dataset}/sub/${BASE}_2_sub.fastq.gz"
done

for sample1 in $(find ./data/raw/${dataset}/sub -maxdepth 1 -name "*_1_sub.fastq.gz")
do
  BASE=$(basename $sample1 "_1_sub.fastq.gz")
  sample2=./data/raw/${dataset}/sub/${BASE}_2_sub.fastq.gz
  ska fastq -o $HOME/IDSeq_tick/out/${dataset}/${BASE} $sample1 $sample2
done
