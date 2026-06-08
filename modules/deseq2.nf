process DESEQ2 {

    publishDir "results/deseq2", mode: 'copy'

    input:
    path count_matrix

    output:
    path "DEG_results.csv"

    script:
    """
    Rscript scripts/deseq2_analysis.R ${count_matrix}
    """
}
