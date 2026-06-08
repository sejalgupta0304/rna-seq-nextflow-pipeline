nextflow.enable.dsl=2

include { FASTQC } from './modules/fastqc'
include { FASTP } from './modules/fastp'
include { HISAT2 } from './modules/hisat2'
include { FEATURECOUNTS } from './modules/featurecounts'
include { DESEQ2 } from './modules/deseq2'

workflow {

    reads_ch = Channel.fromFilePairs("data/*_{R1,R2}.fastq.gz")

    FASTQC(reads_ch)

    trimmed_reads = FASTP(reads_ch)

    aligned_bam = HISAT2(trimmed_reads)

    counts = FEATURECOUNTS(aligned_bam)

    DESEQ2(counts)
}
