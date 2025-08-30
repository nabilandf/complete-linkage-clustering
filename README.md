# 🌿 Complete Linkage Clustering - Data Produksi Kunyit

Proyek ini berisi analisis **pengelompokan hierarki (hierarchical clustering)** menggunakan metode **Complete Linkage** pada data produksi kunyit per kecamatan. Analisis dilakukan dengan R dan mencakup preprocessing data, uji asumsi, pembentukan cluster, serta validasi menggunakan **Silhouette Method**.

---

## 📊 Dataset
- **Source**: Production data of turmeric per district (`data_bio.xlsx`)  
- **Variables**:
  - Production (kg)  
  - Harvested Area (ha) 

---

## 🛠️ Tools & Packages
Implemented in **R** with the following packages: 

```r
library(dplyr)
library(REdaS) 
library(psych)
library(car)
library(cluster)
library(factoextra)
library(tidyverse)
library(readxl)


## 📊 Results
The analysis successfully identified production clusters, which can be used for **agricultural planning and policy recommendations**.

### 📌 Clustering Dendrogram
![Clustering Result](Clustering_result.png)

## ✅ Key Insight
- Districts with similar production and harvested area characteristics are grouped into the same cluster.  
- These findings can guide **resource allocation** and **development focus**.
