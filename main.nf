nextflow.enable.dsl=2

include { FASTQC } from './modules/fastqc'
include { FASTP } from './modules/fastp'
include { HISAT2 } from './modules/hisat2'
include { FEATURECOUNTS } from './modules/featurecounts'

workflow {

    reads_ch = Channel.fromFilePairs("data/*_{R1,R2}.fastq.gz")

    FASTQC(reads_ch)

    trimmed_reads = FASTP(reads_ch)

    aligned_bam = HISAT2(trimmed_reads)

    FEATURECOUNTS(aligned_bam)
}
