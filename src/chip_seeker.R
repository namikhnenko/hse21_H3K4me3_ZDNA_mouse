setwd('C:/Users/User/Desktop/Bioinformatics/H3K4me3_ES_E14/')
source('lib.R')

###

if (!requireNamespace("BiocManager", quietly = TRUE))
   install.packages("BiocManager")
BiocManager::install("TxDb.Mmusculus.UCSC.mm10.knownGene")
BiocManager::install("ChIPseeker")
BiocManager::install("clusterProfiler")
BiocManager::install("ChIPpeakAnno")
BiocManager::install("org.Mm.eg.db")

 
library(ChIPseeker)
library(TxDb.Mmusculus.UCSC.mm10.knownGene)
library(clusterProfiler)
library(org.Mm.eg.db)

###

NAME <- 'mouseZ-DNA1'
#NAME <- 'H3K4me3_ES_E14.ENCFF993IIG.mm10.filtered'
#NAME <- 'H3K4me3_ES_E14.ENCFF899LDH.mm10.filtered'
BED_FN <- paste0(DATA_DIR, NAME, '.bed')

###

txdb <- TxDb.Mmusculus.UCSC.mm10.knownGene
peakAnno <- annotatePeak(BED_FN, tssRegion=c(-3000, 3000), TxDb=txdb, annoDb="org.Mm.eg.db")

pdf(paste0(OUT_DIR, 'chip_seeker.', NAME, '.annopie.pdf'))
plotAnnoPie(peakAnno)
dev.off()

peak <- readPeakFile(BED_FN)
pdf(paste0(OUT_DIR, 'chip_seeker.', NAME, '.covplot.pdf'))
covplot(peak, weightCol="V5")
dev.off()
