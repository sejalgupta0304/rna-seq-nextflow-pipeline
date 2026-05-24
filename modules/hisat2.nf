process HISAT2 {

    publishDir "results/aligned", mode: 'copy'

    input:
    tuple val(sample_id), path(reads)

    output:
    path "${sample_id}.bam"

    script:
    """
    hisat2 \
        -x genome_index \
        -1 ${reads[0]} \
        -2 ${reads[1]} \
        | samtools view -bS - > ${sample_id}.bam
    """
}
