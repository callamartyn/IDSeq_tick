esearch -db protein -query "((cox1 ) NOT partial) AND (ixodes[Organism] OR \
dermacentor[Organism] OR amblyomma[Organism] OR rhipicephalus[Organism]) " \
| efetch -format fasta > cox1_prot.fasta

esearch -db gene -query "((cox1 ) NOT partial) AND (ixodes[Organism] OR \
dermacentor[Organism] OR amblyomma[Organism] OR rhipicephalus[Organism]) " \
| efetch -format fasta > cox1_gene.fasta
