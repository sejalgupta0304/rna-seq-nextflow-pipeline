process VOLCANO {

    publishDir "results/plots", mode: 'copy'

    input:
    path deg_file

    output:
    path "volcano_plot.png"

    script:
    """
    Rscript scripts/volcano.R ${deg_file}
    """
}
