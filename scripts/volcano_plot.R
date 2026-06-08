#!/usr/bin/env Rscript

library(ggplot2)

args <- commandArgs(trailingOnly = TRUE)

deg <- read.csv(args[1])

deg$significant <- ifelse(
  deg$padj < 0.05 &
  abs(deg$log2FoldChange) > 1,
  "Significant",
  "Not Significant"
)

png(
  "volcano_plot.png",
  width = 1200,
  height = 1000
)

ggplot(
  deg,
  aes(
    x = log2FoldChange,
    y = -log10(padj),
    color = significant
  )
) +
geom_point() +
theme_bw() +
ggtitle("Volcano Plot")
