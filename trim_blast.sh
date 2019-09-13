trimmomatic PE test_1.fastq test_2.fastq test_1_trim.fastq test_2_trim.fastq \
test_1_unpaired.fastq test_2_unpaired.fastq LEADING:3 TRAILING:3 \
SLIDINGWINDOW:4:15 MINLEN:36

seqtk seq -a test_1_trim.fastq > test_1.fasta

blastx -query test_1.fasta -db  db/cox1_prot.fasta -outfmt '7' -out test_1.blastx.out 
