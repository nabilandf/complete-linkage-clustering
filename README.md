# 🌿 Complete Linkage Clustering - Data Produksi Kunyit

Proyek ini berisi analisis **pengelompokan hierarki (hierarchical clustering)** menggunakan metode **Complete Linkage** pada data produksi kunyit per kecamatan. Analisis dilakukan dengan R dan mencakup preprocessing data, uji asumsi, pembentukan cluster, serta validasi menggunakan **Silhouette Method**.

---

## 📊 Dataset
- **Sumber:** Data produksi kunyit per kecamatan (file: `data_bio.xlsx`)  
- **Variabel utama:**
  - `Produksi Kunyit (kg)`
  - `Luas Panen Kunyit (ha)`

---

## 🛠️ Tools & Packages
Project ini menggunakan R dengan beberapa package berikut:

```r
library(dplyr)
library(REdaS) 
library(psych)
library(car)
library(cluster)
library(factoextra)
library(tidyverse)
library(readxl)

## Hasil Klaster Complete Linkage
![Hasil Klaster](Clustering_result.png)
