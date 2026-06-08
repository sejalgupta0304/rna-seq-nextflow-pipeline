# RNA-Seq Nextflow DSL2 Pipeline

## Overview

This project demonstrates the conversion of a Bash-based RNA-Seq workflow into a modular Nextflow DSL2 pipeline.

The pipeline performs:

- Quality control using FastQC
- Read trimming using Fastp
- Alignment using HISAT2
- BAM generation using SAMtools
- Gene quantification using FeatureCounts
- Differential expression analysis using DESeq2

The objective is to create a scalable, reproducible, and modular RNA-Seq workflow following industry-standard workflow management practices.

---

## Workflow

```text
FASTQ
 ↓
FASTQC
 ↓
FASTP
 ↓
HISAT2
 ↓
SAMTOOLS
 ↓
FEATURECOUNTS
 ↓
DESEQ2
```

---

## Tools Used

| Step | Tool |
|--------|--------|
| Quality Control | FastQC |
| Read Trimming | Fastp |
| Alignment | HISAT2 |
| BAM Processing | SAMtools |
| Gene Quantification | FeatureCounts |
| Differential Expression | DESeq2 |
| Workflow Management | Nextflow DSL2 |

---

## Repository Structure

```text
rna-seq-nextflow-pipeline/

├── main.nf

├── modules/
│   ├── fastqc.nf
│   ├── fastp.nf
│   ├── hisat2.nf
│   ├── featurecounts.nf
│   └── deseq2.nf

├── scripts/
│   └── deseq2_analysis.R

└── README.md
```

---

## Nextflow Modules

### FastQC
Performs quality assessment of raw sequencing reads.

### Fastp
Removes adapters and low-quality bases from paired-end reads.

### HISAT2
Aligns cleaned reads to the reference genome.

### SAMtools
Converts SAM output to BAM format and supports downstream processing.

### FeatureCounts
Generates gene-level count matrices from aligned BAM files.

### DESeq2
Performs normalization and differential expression analysis to identify significantly altered genes.

---

## Example Execution

```bash
nextflow run main.nf
```

---

## Outputs

```text
results/

├── fastqc/
├── trimmed/
├── aligned/
├── counts/
└── deseq2/
```

---

## Future Enhancements

- GO Functional Enrichment Analysis
- KEGG Pathway Analysis
- Volcano Plot Generation
- Heatmap Visualization
- MultiQC Integration
- Docker Containerization
- Singularity Support
- Cloud Execution Support

---

## Author

Sejal Gupta

Project developed as part of learning workflow management and RNA-Seq pipeline automation using Nextflow DSL2.
