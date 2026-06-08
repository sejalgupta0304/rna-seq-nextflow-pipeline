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

gene_df <- bitr(
  genes,
  fromType = "SYMBOL",
  toType = "ENTREZID",
  OrgDb = org.Mm.eg.db
)

kegg <- enrichKEGG(
  gene = gene_df$ENTREZID,
  organism = "mmu"
)

write.csv(
  as.data.frame(kegg),
  "KEGG_results.csv"
)
