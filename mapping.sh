for gzname in "data/raw/*fastq.gz"; do
  gzip -d $gzname
done;

#STAR 
pre_fix='/work/yama/singlecell/'
for target_fastq in data/raw/*fastq; do
    echo $target_fastq
    outfile=$pre_fix${target_fastq/raw/STAR_results}

    ~/opt/STAR-2.7.10a/source/STAR --runThreadN 30 --outSAMtype BAM SortedByCoordinate --quantMode TranscriptomeSAM GeneCounts --genomeDir ~/opt/ref_genome/STAR_ref/UCSC_mm10 --readFilesIn $target_fastq --outFileNamePrefix ${outfile/.fastq/_}

done


#featureCounts(Rsubread)
ref_gene='/home/yama/opt/ref_genome/Mus_musculus/UCSC/mm10/Annotation/Genes/genes.gtf'
featureCounts -T 30 -t exon -g gene_id -a $ref_gene -o all_counts.csv /work/yama/singlecell/data/STAR_results/*.sortedByCoord.out.bam
featureCounts -T 30 -t exon -g gene_id -a $ref_gene -O -o all_Multi-overlapping_counts.txt /work/yama/singlecell/data/STAR_results/*.sortedByCoord.out.bam
