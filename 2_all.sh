

for i in $(seq 1 3);
do 
    echo 'Working in '${i}
    
    #align against first genome
    hisat2 -p 3 -x data/index/svevo -1 data/reads/TD${i}.R1.fastq.gz -2 data/reads/TD${i}.R2.fastq.gz -S data/res/${i}_landic_svevo.sam --un-conc data/res/${i}_landic_svevo.un.fastq --summary-file data/res/${i}_landic_svevo.sam.info

    #align unmapped against second genome
    hisat2 -p 3 -x data/index/zavitan -1 data/res/${i}_landic_svevo.un.1.fastq -2 data/res/${i}_landic_svevo.un.2.fastq -S data/res/${i}_landic_un_zavitan.sam --un-conc data/res/${i}_landic_un_zavitan.un.fastq --summary-file data/res/${i}_landic_un_zavitan.sam.info

    #count reads mapped on genes
    htseq-count -s no data/res/${i}_landic_un_zavitan.sam data/genomes/zavitan.gtf > data/res/${i}_landic_un_zavitan.counts.txt
done

