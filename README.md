# McCann_etal_Snail_microbiome
 Scripts used for the Snail Microbiome analysis of McCann et al. (submitted).
 Check out the Wiki webpage for more details about the scripts.

 The bioinformatic analysis in the McCann et al. paper consisted of:

 1) Preparing data from read file to feature table for <a href="https://github.com/agalychnica/McCann_etal_Snail_microbiome/blob/main/QIIME2_PIPELINE%20.txt">QIIME2</a>
 2) A decontamination identification and removal step (Decontam analysis) which consisted of:
     - <a href="https://github.com/agalychnica/McCann_etal_Snail_microbiome/blob/main/Linux_commands.txt">Linux scripts</a> to convert data for Decontam
     - <a href="https://github.com/agalychnica/McCann_etal_Snail_microbiome/blob/main/Microbiome_analyst_commands.R">Decontam script</a> in R.
     - More <a href="https://github.com/agalychnica/McCann_etal_Snail_microbiome/blob/main/Linux_commands.txt">linux scripts</a> to get the data ready for analysing in <a href="https://www.microbiomeanalyst.ca/">Microbiome Analyst</a>.
     - The input files for this step are provided in the "<a href="https://github.com/agalychnica/McCann_etal_Snail_microbiome/tree/main/Input_files_Decontam">Input_files_Decontam</a>" folder
 3) Statistical analyses in <a href="https://github.com/agalychnica/McCann_etal_Snail_microbiome/blob/main/Microbiome_analyst_commands.R">Microbiome Analyst</a>

