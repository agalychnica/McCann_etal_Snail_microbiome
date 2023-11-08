mbSet<-Init.mbSetObj()
mbSet<-SetModuleType(mbSet, "mdp")
mbSet<-ReadSampleTable(mbSet, "MicrobiomeAnalyst - Metadata 2.txt");
mbSet<-Read16SAbundData(mbSet, "Decont_Taxonomy_abundances_table.csv","text","SILVA","T","false");
mbSet<-SanityCheckData(mbSet, "text");
mbSet<-SanityCheckSampleData(mbSet);
mbSet<-SetMetaAttributes(mbSet, "1")
mbSet<-PlotLibSizeView(mbSet, "norm_libsizes_0","png");
mbSet<-CreatePhyloseqObj(mbSet, "text","SILVA","T" , "false")
smpl.nm.vec <- c("11JAN22-GTEXT1-09","12JAN22-GTEXT10-09","12JAN22-GTEXT2-09","12JAN22-GTEXT5-09","12JAN22-GTEXT6-09","12JAN22-GTEXT7-09","12JAN22-GTEXT8-09","12JAN22-GTEXT9-09","13JAN22-GTEXT1-09","13JAN22-GTEXT2-09","13JAN22-GTEXT3-09","13JAN22-GTEXT4-09","13JAN22-GTEXT5-09","13JAN22-GTEXT6-09","13JAN22-GTEXT7-09","13JAN22-GTEXT8-09","13JAN22-GTEXT9-09","28JAN22-GTEXT02-09","28JAN22-GTEXT03-09","28JAN22-GTEXT05-09","28JAN22-GTEXT06-09","28JAN22-GTEXT07-09","28JAN22-GTEXT08-09","28JAN22-GTEXT09-09","28JAN22-GTEXT10-09","28JAN22-GTEXT11-09","28JAN22-GTEXT12-09","28JAN22-GTEXT13-09","28JAN22-GTEXT14-09")
mbSet<-UpdateSampleItems(mbSet);
mbSet<-ApplyAbundanceFilter(mbSet, "prevalence", 4, 0.2);
mbSet<-ApplyVarianceFilter(mbSet, "iqr", 0.1);
smpl.nm.vec <- c("11JAN22-GTEXT1-09","12JAN22-GTEXT10-09","12JAN22-GTEXT2-09","12JAN22-GTEXT5-09","12JAN22-GTEXT6-09","12JAN22-GTEXT7-09","12JAN22-GTEXT8-09","12JAN22-GTEXT9-09","13JAN22-GTEXT1-09","13JAN22-GTEXT2-09","13JAN22-GTEXT3-09","13JAN22-GTEXT4-09","13JAN22-GTEXT5-09","13JAN22-GTEXT6-09","13JAN22-GTEXT7-09","13JAN22-GTEXT8-09","13JAN22-GTEXT9-09","28JAN22-GTEXT02-09","28JAN22-GTEXT05-09","28JAN22-GTEXT06-09","28JAN22-GTEXT07-09","28JAN22-GTEXT08-09","28JAN22-GTEXT10-09","28JAN22-GTEXT11-09","28JAN22-GTEXT12-09","28JAN22-GTEXT13-09","28JAN22-GTEXT14-09")
mbSet<-UpdateSampleItems(mbSet);
mbSet<-ApplyAbundanceFilter(mbSet, "prevalence", 4, 0.2);
mbSet<-ApplyVarianceFilter(mbSet, "iqr", 0.1);
mbSet<-PerformNormalization(mbSet, "rarewi", "colsum", "none", "true");
mbSet<-PlotRarefactionCurve(mbSet, "filt","Farm","Farm","Farm","5","rarefaction_curve_0","png");
mbSet<-PlotRarefactionCurve(mbSet, "filt","Farm","Farm","Infection","5","rarefaction_curve_1","png");
mbSet<-PlotAlphaData(mbSet, "filt","alpha_diver_0","Chao1","Farm","OTU", "default", "png");
mbSet<-PlotAlphaBoxData(mbSet, "alpha_diverbox_0","Chao1","Farm","default", "png");
mbSet<-PerformAlphaDiversityComp(mbSet, "tt","Farm","false");
mbSet<-PlotAlphaData(mbSet, "filt","alpha_diver_1","Chao1","Farm","Genus", "default", "png");
mbSet<-PlotAlphaBoxData(mbSet, "alpha_diverbox_1","Chao1","Farm","default", "png");
mbSet<-PerformAlphaDiversityComp(mbSet, "nonpar","Farm","false");
mbSet<-PlotAlphaData(mbSet, "filt","alpha_diver_2","Observed","Farm","Genus", "default", "png");
mbSet<-PlotAlphaBoxData(mbSet, "alpha_diverbox_2","Observed","Farm","default", "png");
mbSet<-PerformAlphaDiversityComp(mbSet, "nonpar","Farm","false");
mbSet<-PlotAlphaData(mbSet, "filt","alpha_diver_3","Shannon","Farm","Genus", "default", "png");
mbSet<-PlotAlphaBoxData(mbSet, "alpha_diverbox_3","Shannon","Farm","default", "png");
mbSet<-PerformAlphaDiversityComp(mbSet, "nonpar","Farm","false");
mbSet<-PlotAlphaData(mbSet, "filt","alpha_diver_4","Simpson","Farm","Genus", "default", "png");
mbSet<-PlotAlphaBoxData(mbSet, "alpha_diverbox_4","Simpson","Farm","default", "png");
mbSet<-PerformAlphaDiversityComp(mbSet, "nonpar","Farm","false");
mbSet<-PlotAlphaData(mbSet, "filt","alpha_diver_5","Fisher","Farm","Genus", "default", "png");
mbSet<-PlotAlphaBoxData(mbSet, "alpha_diverbox_5","Fisher","Farm","default", "png");
mbSet<-PerformAlphaDiversityComp(mbSet, "nonpar","Farm","false");
mbSet<-PlotAlphaData(mbSet, "filt","alpha_diver_6","Observed","Infection","Genus", "default", "png");
mbSet<-PlotAlphaBoxData(mbSet, "alpha_diverbox_6","Observed","Infection","default", "png");
mbSet<-PerformAlphaDiversityComp(mbSet, "nonpar","Infection","false");
mbSet<-PlotAlphaData(mbSet, "filt","alpha_diver_7","Chao1","Infection","Genus", "default", "png");
mbSet<-PlotAlphaBoxData(mbSet, "alpha_diverbox_7","Chao1","Infection","default", "png");
mbSet<-PerformAlphaDiversityComp(mbSet, "nonpar","Infection","false");
mbSet<-PlotAlphaData(mbSet, "filt","alpha_diver_8","Shannon","Infection","Genus", "default", "png");
mbSet<-PlotAlphaBoxData(mbSet, "alpha_diverbox_8","Shannon","Infection","default", "png");
mbSet<-PerformAlphaDiversityComp(mbSet, "nonpar","Infection","false");
mbSet<-PlotAlphaData(mbSet, "filt","alpha_diver_9","Simpson","Infection","Genus", "default", "png");
mbSet<-PlotAlphaBoxData(mbSet, "alpha_diverbox_9","Simpson","Infection","default", "png");
mbSet<-PerformAlphaDiversityComp(mbSet, "nonpar","Infection","false");
mbSet<-PlotAlphaData(mbSet, "filt","alpha_diver_10","Fisher","Infection","Genus", "default", "png");
mbSet<-PlotAlphaBoxData(mbSet, "alpha_diverbox_10","Fisher","Infection","default", "png");
mbSet<-PerformAlphaDiversityComp(mbSet, "nonpar","Infection","false");
mbSet<-PerformBetaDiversity(mbSet, "beta_diver_0","PCoA","bray","expfac","Infection","none","OTU","","Fisher", "yes", "adonis", "png", 72, "default", "false");
mbSet<-PCoA3D.Anal(mbSet, "PCoA","bray","OTU","expfac","Infection","","Fisher","beta_diver3d_0.json")
mbSet<-PerformCategoryComp(mbSet, "OTU", "adonis","bray","Infection","false");
mbSet<-PerformBetaDiversity(mbSet, "beta_diver_1","PCoA","bray","expfac","Infection","none","Genus","","Fisher", "yes", "adonis", "png", 72, "default", "false");
mbSet<-PCoA3D.Anal(mbSet, "PCoA","bray","Genus","expfac","Infection","","Fisher","beta_diver3d_1.json")
mbSet<-PerformCategoryComp(mbSet, "Genus", "adonis","bray","Infection","false");
mbSet<-PerformBetaDiversity(mbSet, "beta_diver_2","PCoA","jsd","expfac","Infection","none","Genus","","Fisher", "yes", "adonis", "png", 72, "default", "false");
mbSet<-PCoA3D.Anal(mbSet, "PCoA","jsd","Genus","expfac","Infection","","Fisher","beta_diver3d_2.json")
mbSet<-PerformCategoryComp(mbSet, "Genus", "adonis","jsd","Infection","false");
mbSet<-PerformBetaDiversity(mbSet, "beta_diver_3","PCoA","jaccard","expfac","Infection","none","Genus","","Fisher", "yes", "adonis", "png", 72, "default", "false");
mbSet<-PCoA3D.Anal(mbSet, "PCoA","jaccard","Genus","expfac","Infection","","Fisher","beta_diver3d_3.json")
mbSet<-PerformCategoryComp(mbSet, "Genus", "adonis","jaccard","Infection","false");
mbSet<-PerformBetaDiversity(mbSet, "beta_diver_4","PCoA","jaccard","expfac","Infection","none","Genus","","Fisher", "yes", "adonis", "png", 72, "default", "false");
mbSet<-PCoA3D.Anal(mbSet, "PCoA","jaccard","Genus","expfac","Infection","","Fisher","beta_diver3d_4.json")
mbSet<-PerformCategoryComp(mbSet, "Genus", "adonis","jaccard","Infection","false");
mbSet<-PerformBetaDiversity(mbSet, "beta_diver_5","PCoA","bray","expfac","Farm","none","Genus","","Fisher", "yes", "adonis", "png", 72, "default", "false");
mbSet<-PCoA3D.Anal(mbSet, "PCoA","bray","Genus","expfac","Farm","","Fisher","beta_diver3d_5.json")
mbSet<-PerformCategoryComp(mbSet, "Genus", "adonis","bray","Farm","false");
mbSet<-PerformBetaDiversity(mbSet, "beta_diver_6","PCoA","jsd","expfac","Farm","none","Genus","","Fisher", "yes", "adonis", "png", 72, "default", "false");
mbSet<-PCoA3D.Anal(mbSet, "PCoA","jsd","Genus","expfac","Farm","","Fisher","beta_diver3d_6.json")
mbSet<-PerformCategoryComp(mbSet, "Genus", "adonis","jsd","Farm","false");
mbSet<-PerformBetaDiversity(mbSet, "beta_diver_7","PCoA","jaccard","expfac","Farm","none","Genus","","Fisher", "yes", "adonis", "png", 72, "default", "false");
mbSet<-PCoA3D.Anal(mbSet, "PCoA","jaccard","Genus","expfac","Farm","","Fisher","beta_diver3d_7.json")
mbSet<-PerformCategoryComp(mbSet, "Genus", "adonis","jaccard","Farm","false");
mbSet<-PerformLefseAnal(mbSet,  0.1, "fdr", 2.0,  "Farm","F","NA","OTU");
mbSet<-PlotLEfSeSummary(mbSet, 15, "dot",  "bar_graph_0","png");
mbSet<-PerformLefseAnal(mbSet,  0.05, "raw", 2.0,  "Infection","F","NA","Phylum");
mbSet<-PlotLEfSeSummary(mbSet, 15, "dot",  "bar_graph_1","png");
mbSet<-PerformLefseAnal(mbSet,  0.05, "raw", 2.0,  "Infection","F","NA","Class");
mbSet<-PlotLEfSeSummary(mbSet, 15, "dot",  "bar_graph_2","png");
mbSet<-PerformLefseAnal(mbSet,  0.05, "raw", 2.0,  "Infection","F","NA","Order");
mbSet<-PlotLEfSeSummary(mbSet, 15, "dot",  "bar_graph_3","png");
mbSet<-PerformLefseAnal(mbSet,  0.05, "raw", 2.0,  "Infection","F","NA","Family");
mbSet<-PlotLEfSeSummary(mbSet, 15, "dot",  "bar_graph_4","png");
mbSet<-PerformLefseAnal(mbSet,  0.05, "raw", 2.0,  "Infection","F","NA","Genus");
mbSet<-PlotLEfSeSummary(mbSet, 15, "dot",  "bar_graph_5","png");
mbSet<-PerformLefseAnal(mbSet,  0.05, "raw", 2.0,  "Farm","F","NA","Phylum");
mbSet<-PlotLEfSeSummary(mbSet, 15, "dot",  "bar_graph_6","png");
mbSet<-PerformLefseAnal(mbSet,  0.05, "raw", 2.0,  "Farm","F","NA","Class");
mbSet<-PlotLEfSeSummary(mbSet, 15, "dot",  "bar_graph_7","png");
mbSet<-PerformLefseAnal(mbSet,  0.05, "raw", 2.0,  "Farm","F","NA","Order");
mbSet<-PlotLEfSeSummary(mbSet, 15, "dot",  "bar_graph_8","png");
mbSet<-PerformLefseAnal(mbSet,  0.05, "raw", 2.0,  "Farm","F","NA","Family");
mbSet<-PlotLEfSeSummary(mbSet, 15, "dot",  "bar_graph_9","png");
mbSet<-PerformLefseAnal(mbSet,  0.05, "raw", 2.0,  "Farm","F","NA","Genus");
mbSet<-PlotLEfSeSummary(mbSet, 15, "dot",  "bar_graph_10","png");
