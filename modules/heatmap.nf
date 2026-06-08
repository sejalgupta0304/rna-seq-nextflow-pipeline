process HEATMAP {

    publishDir "results/plots", mode: 'copy'

    input:
    path deg_file

    output:
    path "heatmap.png"

    script:
    """
    Rscript scripts/heatmap.R ${deg_file}
    """
}
