process KEGG_ENRICHMENT {

    publishDir "results/kegg", mode: 'copy'

    input:
    path deg_file

    output:
    path "KEGG_results.csv"

    script:
    """
    Rscript scripts/kegg_analysis.R ${deg_file}
    """
}
