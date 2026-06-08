#!/usr/bin/env Rscript

library(clusterProfiler)
library(org.Mm.eg.db)

args <- commandArgs(trailingOnly = TRUE)

deg <- read.csv(args[1])

sig <- subset(
  deg,
  padj < 0.05 &
  abs(log2FoldChange) > 1
)

genes <- rownames(sig)

go <- enrichGO(
  gene = genes,
  OrgDb = org.Mm.eg.db,
  keyType = "SYMBOL",
  ont = "BP"
)

write.csv(
  as.data.frame(go),
  "GO_results.csv"
)
