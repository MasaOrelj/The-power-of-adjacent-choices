library(tidyverse)
#uvoz podatkov za nk zog in n kosev
poskusi <- 1:100
dim1_10000_10000_1 <- read.csv("podatki/maksimalno_stevilo_zogic_100_100_10000_10000_1_1.csv")
dim1_20000_10000_1 <- read.csv("podatki/maksimalno_stevilo_zogic_100_100_20000_10000_1_1.csv")
dim1_30000_10000_1 <- read.csv("podatki/maksimalno_stevilo_zogic_100_100_30000_10000_1_1.csv")
dim1_40000_10000_1 <- read.csv("podatki/maksimalno_stevilo_zogic_100_100_40000_10000_1_1.csv")
dim1_50000_10000_1 <- read.csv("podatki/maksimalno_stevilo_zogic_100_100_50000_10000_1_1.csv")
#dim1_60000_10000_1 <- read.csv("maksimalno_stevilo_zogic_100_100_60000_10000_1_1.csv")

plot(x=c(1:100), dim1_10000_10000_1$Maksimum)
abline(h=mean(dim1_10000_10000_1$Maksimum))
plot(x=c(1:100), dim1_20000_10000_1$Maksimum)
abline(h=mean(dim1_20000_10000_1$Maksimum))
plot(x=c(1:100), dim1_30000_10000_1$Maksimum)
abline(h=mean(dim1_30000_10000_1$Maksimum))
plot(x=c(1:100), dim1_40000_10000_1$Maksimum)
abline(h=mean(dim1_40000_10000_1$Maksimum))
plot(x=c(1:100), dim1_50000_10000_1$Maksimum)
abline(h=mean(dim1_50000_10000_1$Maksimum))

maksimumi_st_zog_1dim_1 <- dplyr::bind_rows(dim1_10000_10000_1, dim1_20000_10000_1)
maksimumi_st_zog_1dim_1 <- dplyr::bind_rows(maksimumi_st_zog_1dim_1, dim1_30000_10000_1)
maksimumi_st_zog_1dim_1 <- dplyr::bind_rows(maksimumi_st_zog_1dim_1, dim1_40000_10000_1)
maksimumi_st_zog_1dim_1 <- dplyr::bind_rows(maksimumi_st_zog_1dim_1, dim1_50000_10000_1)
#maksimumi_st_zog_1dim_1 <- dplyr::bind_rows(maksimumi_st_zog_1dim_1, dim1_60000_10000_1)

plot(x=c(1:500), maksimumi_st_zog_1dim_1$Maksimum, type="p", pch=20, cex=0.5)
plot(x=c(1:500), maksimumi_st_zog_1dim_1$Delez_kosev_z_maksimalnim_stevilom_zog, type="p", pch=20, cex=0.5)
plot(x=c(1:500), maksimumi_st_zog_1dim_1$Casovna_zahtevnost, type="p", pch=20, cex=0.5)


#uvoz podatkov za n zog, n kosev in k razdalje
dim1_10000_10000_2 <- read.csv("podatki/maksimalno_stevilo_zogic_100_100_10000_10000_2_1.csv")
dim1_10000_10000_3 <- read.csv("podatki/maksimalno_stevilo_zogic_100_100_10000_10000_3_1.csv")
dim1_10000_10000_4 <- read.csv("podatki/maksimalno_stevilo_zogic_100_100_10000_10000_4_1.csv")
dim1_10000_10000_5 <- read.csv("podatki/maksimalno_stevilo_zogic_100_100_10000_10000_5_1.csv")
dim1_10000_10000_6 <- read.csv("podatki/maksimalno_stevilo_zogic_100_100_10000_10000_6_1.csv")

plot(x=c(1:100), dim1_10000_10000_1$Maksimum)
abline(h=mean(dim1_10000_10000_1$Maksimum))
plot(x=c(1:100), dim1_10000_10000_2$Maksimum)
abline(h=mean(dim1_10000_10000_2$Maksimum))
plot(x=c(1:100), dim1_10000_10000_3$Maksimum)
abline(h=mean(dim1_10000_10000_3$Maksimum))
plot(x=c(1:100), dim1_10000_10000_4$Maksimum)
abline(h=mean(dim1_10000_10000_4$Maksimum))
plot(x=c(1:100), dim1_10000_10000_5$Maksimum)
abline(h=mean(dim1_10000_10000_5$Maksimum))

maksimumi_st_zog_1dim_k <- dplyr::bind_rows(dim1_10000_10000_1, dim1_10000_10000_2)
maksimumi_st_zog_1dim_k <- dplyr::bind_rows(maksimumi_st_zog_1dim_k, dim1_10000_10000_3)
maksimumi_st_zog_1dim_k <- dplyr::bind_rows(maksimumi_st_zog_1dim_k, dim1_10000_10000_4)
maksimumi_st_zog_1dim_k <- dplyr::bind_rows(maksimumi_st_zog_1dim_k, dim1_10000_10000_5)
#maksimumi_st_zog_1dim_1 <- dplyr::bind_rows(maksimumi_st_zog_1dim_1, dim1_60000_10000_1)

plot(x=c(1:500), maksimumi_st_zog_1dim_k$Maksimum, type="p", pch=20, cex=0.5)
plot(x=c(1:500), maksimumi_st_zog_1dim_k$Delez_kosev_z_maksimalnim_stevilom_zog, type="p", pch=20, cex=0.5)
plot(x=c(1:500), maksimumi_st_zog_1dim_k$Casovna_zahtevnost, type="p", pch=20, cex=0.5)
