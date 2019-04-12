#convert gff3 to gtf
./gffread/gffread data/genomes/zavitan.gff3 -T -o data/genomes/zavitan.gtf

#create indexes
hisat2-build data/genomes/zavitan.fa data/index/zavitan
hisat2-build data/genomes/svevo.fa data/index/svevo