

for i in $(seq 1 3);
do 
    echo 'Working in '${i}
    
    #align against first genome
    hisat2 -p 3 -x data/index/svevo -1 data/reads/TD${i}.R1.fastq.gz -2 data/reads/TD${i}.R2.fastq.gz -S data/res/landic_svevo_${i}.sam --un-conc data/res/landic_svevo_${i}.un.fastq --summary-file data/res/landic_svevo_${i}.sam.info

    #align unmapped against second genome
    hisat2 -p 3 -x data/index/zavitan -1 data/res/landic_svevo_${i}.un.1.fastq -2 data/res/landic_svevo_${i}.un.2.fastq -S data/res/landic_un_zavitan_${i}.sam --un-conc data/res/landic_un_zavitan_${i}.un.fastq --summary-file data/res/landic_un_zavitan_${i}.sam.info

    #count reads mapped on genes
    htseq-count -s no data/res/landic_un_zavitan_${i}.sam data/genomes/zavitan.gtf > data/res/landic_un_zavitan_${i}.counts.txt
done

