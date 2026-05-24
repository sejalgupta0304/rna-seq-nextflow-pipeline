process FEATURECOUNTS {

    publishDir "results/counts", mode: 'copy'

    input:
    path bam_file

    output:
    path "gene_counts.txt"

    script:
    """
    featureCounts \
        -a annotation.gtf \
        -o gene_counts.txt \
        ${bam_file}
    """
}
