# ================================================================
# Project: Hierarchical Clustering with Complete Linkage
# Author : Nabila
# ================================================================

# 📦 Load required packages
library(dplyr)
library(REdaS) 
library(psych)
library(car)
library(cluster)
library(factoextra)
library(tidyverse)
library(readxl)

# ================================================================
# 1. Import Data
# ================================================================
Data <- read_excel("C:/Users/user/Downloads/Data bio.xlsx")
datanew <- as.data.frame(Data[,-1])   # Hapus kolom pertama (Kecamatan)
rownames(datanew) <- Data$Kecamatan   # Set nama baris sesuai kecamatan

# ================================================================
# 2. Descriptive Statistics
# ================================================================
describe(datanew)

# ================================================================
# 3. Preprocessing
# ================================================================
# Cek missing values
sapply(datanew, function(x) sum(is.na(x)))

# Cek outlier dengan boxplot
num_cols <- unlist(lapply(datanew, is.numeric)) 
df_num   <- datanew[, num_cols]  
boxplot(df_num, main = "Boxplot Data Numerik")

# Uji Barlett dan KMO-MSA
bart_spher(datanew)
KMO(datanew)

# Uji multikolinearitas
cor_matrix <- cor(datanew) 
vif_values <- diag(solve(cor_matrix)) 
vif_values

# Standarisasi data (Z-score)
scaled <- scale(datanew)
head(scaled)

# ================================================================
# 4. Hierarchical Clustering - Complete Linkage
# ================================================================
# Hitung jarak Euclidean
jarak <- dist(x = scaled, method = "euclidean")

# Model clustering dengan complete linkage
hc_complete <- hclust(d = jarak, method = "complete")

# Plot dendrogram
plot(hc_complete, cex = 0.6, hang = -1, main = "Dendrogram - Complete Linkage")
abline(h = 4, col = 'red')  # Potong dendrogram di ketinggian 4

# Tentukan cluster (misal: 2 cluster)
cut_point <- cutree(hc_complete, k = 2)
table(cut_point)

# ================================================================
# 5. Cluster Validation - Silhouette Method
# ================================================================
silhouette_score <- function(k) {
  clusters <- cutree(hc_complete, k)
  sil <- silhouette(clusters, dist(scaled))
  mean(sil[, 3])
}

# Coba jumlah cluster 2–6
sil_scores <- sapply(2:6, silhouette_score)
print(sil_scores)

# Plot silhouette scores
plot(2:6, sil_scores, type = "b", pch = 19,
     xlab = "Number of Clusters", ylab = "Average Silhouette Width",
     main = "Silhouette Method")

# ================================================================
# 6. Visualisasi Cluster
# ================================================================
fviz_dend(hc_complete, k = 2, k_colors = "jco", rect = TRUE,
          main = "Cluster Dendrogram (Complete Linkage)")

# ================================================================
# 7. Rata-rata variabel per cluster
# ================================================================
datanew %>% 
  mutate(Klaster = cut_point) %>% 
  group_by(Klaster) %>% 
  summarise(
    Mean_Produksi = round(mean(`Produksi Kunyit  (kg)`), 3), 
    Mean_Luas     = round(mean(`Luas Panen Kunyit (ha)`), 3)
  )
