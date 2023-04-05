library(readr)
pca_data_raw <- read_csv("pca_data_91_surfactants.csv")
View(pca_data_raw)

df = subset(pca_data_raw, select = -c(Name))
pca_data <- scale(df)

library(pcaMethods)
for (x in 1:100) {
 	print(x)
	nipals_fit <- pca(pca_data, nPcs=3, method="nipals", maxSteps=100)
	nipals_scores <- nipals_fit@scores
	filename <- paste("nipals_run",x,"trimmed_noC16E6.csv",sep = '_')
	write.csv(nipals_scores, filename, row.names = TRUE)
} 