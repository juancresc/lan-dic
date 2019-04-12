#convert gff3 to gtf
./gffread/gffread data/genomes/zavitan.gff3 -T -o data/genomes/zavitan.gtf

#are CDS in paolo's file actually exons?
sed -i 's/CDS/exon/g' data/genomes/zavitan.gtf

#create indexes
hisat2-build data/genomes/zavitan.fa data/index/zavitan
hisat2-build data/genomes/svevo.fa data/index/svevo

