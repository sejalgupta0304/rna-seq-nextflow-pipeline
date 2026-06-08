process GO_ENRICHMENT {

    publishDir "results/go", mode: 'copy'

    input:
    path deg_file

    output:
    path "GO_results.csv"

    script:
    """
    Rscript scripts/go_analysis.R ${deg_file}
    """
}
