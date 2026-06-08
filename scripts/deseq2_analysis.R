#!/usr/bin/env Rscript

library(DESeq2)

args <- commandArgs(trailingOnly = TRUE)

count_file <- args[1]

counts <- read.table(
  count_file,
  header = TRUE,
  row.names = 1,
  check.names = FALSE
)

counts <- counts[,6:ncol(counts)]

sample_info <- data.frame(
  condition = c("Control","Control","Tumor","Tumor")
)

rownames(sample_info) <- colnames(counts)

dds <- DESeqDataSetFromMatrix(
  countData = counts,
  colData = sample_info,
  design = ~ condition
)

dds <- DESeq(dds)

res <- results(dds)

write.csv(
  as.data.frame(res),
  "DEG_results.csv"
)
