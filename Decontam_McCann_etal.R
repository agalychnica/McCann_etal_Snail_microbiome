#Decontam analysis McCann et al.

library(phyloseq); packageVersion("phyloseq")
library(ggplot2); packageVersion("ggplot2")
library(decontam); packageVersion("decontam")
library("biomformat");

setwd("/Users/McCann_etal")

#First make sure to convert or have the correct input files. In this paper we started from a Qiime2 ASV table. Follow the "Linux Commands" script to convert the files so that they can be read in this script.

#read in data

ASV_tab<-read.csv("MA-sklearn_tax_ASVrenamed.csv", header=TRUE, sep = ",", row.names=1)

taxonomy_tab<-as.matrix(read.csv("taxonomy_table.csv", header=TRUE, row.names=1, sep=","))

sample_data_tab<-read.table("sample_data1.txt", header=TRUE, row.names=1, sep="\t")

# Create phyloseq object
OTU = otu_table(ASV_tab, taxa_are_rows = TRUE)
TAX = tax_table(taxonomy_tab)
sampledata = sample_data(sample_data_tab)

physeq = phyloseq(OTU, TAX, sampledata)

# Start decontam analysis
ps<-physeq
# inspect library sizes

df <- as.data.frame(sample_data(ps)) # Put sample_data into a ggplot-friendly data.frame
df$LibrarySize <- sample_sums(ps)
df <- df[order(df$LibrarySize),]
df$Index <- seq(nrow(df))
ggplot(data=df, aes(x=Index, y=LibrarySize, color=Sample_or_Control)) + geom_point()

#from this graph we can see that the True samples (which include the snail, soil and Mock positive controls) have well populated library sizes (1e+05)).
#as expected, the negative controls (in red in our case) have much lower reads. We are keeping them for now (as we use them to identify contaminants).

#Check graph adding sample labels
ggplot(data=df, aes(x=Index, y=LibrarySize, color=Sample_or_Control)) + geom_point() + 
  geom_text(
    label=rownames(df), 
    check_overlap = T
    )

# Identify Contaminants - Prevalence Method
# For a walk through of this method used, use the following link (scroll to Point 7) of
# https://benjjneb.github.io/decontam/vignettes/decontam_intro.html#putting-it-all-together

# The prevalence (presence/absence across samples) of each sequence feature in true positive samples is compared to the prevalence in negative controls to identify contaminants.

sample_data(ps)$is.neg <- sample_data(ps)$Sample_or_Control == "Control Sample"
contamdf.prev <- isContaminant(ps, method="prevalence", neg="is.neg")
table(contamdf.prev$contaminant)

#In this case, this method has identified 7 contaminants in the data (values under "True"). To check out the top 6 contaminants:

head(which(contamdf.prev$contaminant))

# Repeat with more aggressive threshold (0.5):

contamdf.prev05 <- isContaminant(ps, method="prevalence", neg="is.neg", threshold=0.5)
table(contamdf.prev05$contaminant)

#With the aggresive threshold the new analysis has found 13 contaminants.

#Let’s take a look at the number of times several of these taxa were observed in negative controls and positive samples.

# Make phyloseq object of presence-absence in negative controls and true samples
ps.pa <- transform_sample_counts(ps, function(abund) 1*(abund>0))
ps.pa.neg <- prune_samples(sample_data(ps.pa)$Sample_or_Control == "Control Sample", ps.pa)
ps.pa.pos <- prune_samples(sample_data(ps.pa)$Sample_or_Control == "True Sample", ps.pa)


# Make data.frame of prevalence in positive and negative samples
df.pa <- data.frame(pa.pos=taxa_sums(ps.pa.pos), pa.neg=taxa_sums(ps.pa.neg),
                    contaminant=contamdf.prev$contaminant)
ggplot(data=df.pa, aes(x=pa.neg, y=pa.pos, color=contaminant)) + geom_point() +
  xlab("Prevalence (Negative Controls)") + ylab("Prevalence (True Samples)")


# Remove likely contanimants from the phyloseq object
ps.noncontam <- prune_taxa(!contamdf.prev05$contaminant, ps)

ps.noncontam

# Save table with stats for each OTU/ASV from the prevalence analysis:
write.table(contamdf.prev05, file="ASV_contaminant_analysis_results.txt", sep='\t')

#Optional: Save new table (filtered from identified contaminants) in OTU style with abundances from the phyloseq object.
#Please note: this command only outputs table with ASV labels. To obtain table with the Classification lineages, check the Linux_commands script.

OTU_decont = as(otu_table(ps.noncontam), "matrix")

write.table(OTU_decont, file="ASV_abundance.csv", sep=',')







