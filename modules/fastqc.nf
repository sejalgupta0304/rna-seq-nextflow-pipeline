process FASTQC {

    publishDir "results/fastqc", mode: 'copy'

    input:
    tuple val(sample_id), path(reads)

    output:
    path "*_fastqc.zip"
    path "*_fastqc.html"

    script:
    """
    fastqc ${reads[0]} ${reads[1]}
    """
}
