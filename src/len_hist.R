library(ggplot2)
library(dplyr)
library(tidyr)   # replace_na
library(tibble)  # column_to_rownames

###

DATA_DIR <- 'C:/Users/User/Desktop/Bioinformatics/H3K4me3_ES_E14/data/'
OUT_DIR <- 'C:/Users/User/Desktop/Bioinformatics/H3K4me3_ES_E14/images'

#NAME <- 'H3K4me3_ES_E14.ENCFF993IIG.mm10'
#NAME <- 'H3K4me3_ES_E14.ENCFF899LDH.mm10'

###

bed_df <- read.delim(paste0(DATA_DIR, NAME, '.bed'), as.is = TRUE, header = FALSE)
#colnames(bed_df) <- c('chrom', 'start', 'end', 'name', 'score')
colnames(bed_df) <- c('chrom', 'start', 'end')
bed_df$len <- bed_df$end - bed_df$start

ggplot(bed_df) +
  aes(x = len) +
  geom_histogram() +
  ggtitle(NAME, subtitle = sprintf('Number of peaks = %s', nrow(bed_df))) +
  theme_bw()
ggsave(paste0('len_hist.', NAME, '.pdf'), path = OUT_DIR)
