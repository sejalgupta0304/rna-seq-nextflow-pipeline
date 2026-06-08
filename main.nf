nextflow.enable.dsl=2

include { FASTQC } from './modules/fastqc'
include { FASTP } from './modules/fastp'
include { HISAT2 } from './modules/hisat2'
include { FEATURECOUNTS } from './modules/featurecounts'
include { DESEQ2 } from './modules/deseq2'
include {GO_ENRICHMENT} from './modules/go_enrichment'
include {KEGG_ENRICHMENT} from './modules/kegg_enrichment'
include {VOLCANO_PLOT} from './modules/volcano_plot'
include {HEATMAP} from './modules/heatmap'

workflow {

    reads_ch = Channel.fromFilePairs("data/*_{R1,R2}.fastq.gz")

    FASTQC(reads_ch)

    trimmed_reads = FASTP(reads_ch)

    aligned_bam = HISAT2(trimmed_reads)

    counts = FEATURECOUNTS(aligned_bam)

    deg_results = DESEQ2(counts)

    GO_ENRICHMENT (deg_results)

    KEGG_ENRICHMENT (deg_results)

    VOLCANO_PLOT (deg_results)

    HEATMAP (deg_results)
}
