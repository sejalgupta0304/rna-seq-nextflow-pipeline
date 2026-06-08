#!/usr/bin/env Rscript

library(pheatmap)

args <- commandArgs(trailingOnly = TRUE)

deg <- read.csv(args[1])

deg <- deg[order(deg$padj), ]

top_genes <- head(deg, 50)

mat <- as.matrix(
  top_genes[, "log2FoldChange", drop = FALSE]
)

rownames(mat) <- top_genes[,1]

png(
  "heatmap.png",
  width = 1000,
  height = 1200
)

pheatmap(
  mat,
  cluster_rows = TRUE,
  cluster_cols = FALSE
)
