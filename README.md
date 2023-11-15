# McCann_etal_Snail_microbiome
 Scripts used for the Snail Microbiome analysis of McCann et al. (submitted).
 Check out the Wiki webpage for more details about the scripts.

 The bioinformatic analysis in the McCann et al. paper consisted of:

 1) A preparation from read file to feature table for QIIME2
 2) A decontamination identification and removal step (Decontam analysis) which consisted of:
     - Linux scripts to convert data for Decontam
     - Decontam script in R.
     - More linux scripts to get the data ready for analysing in Microbiome Analyst
     - The input files for this step are provided in the "Input_files_Decontam" folder
 3) Statistical analyses in Microbiome Analyst
