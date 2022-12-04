library(tidyverse)
library(ggplot2)
library(ggrepel)
library(ggpubr)


############################################################
# dim = 1, stevilo_zog = k*10000 (k=1,2,3,4,5), razdalja = 1
############################################################

#Uvoz podatkov
poskusi <- 1:100
dim1_10000_10000_1 <- read.csv("podatki/maksimalno_stevilo_zogic_100_100_10000_10000_1_1.csv")
dim1_20000_10000_1 <- read.csv("podatki/maksimalno_stevilo_zogic_100_100_20000_10000_1_1.csv")
dim1_30000_10000_1 <- read.csv("podatki/maksimalno_stevilo_zogic_100_100_30000_10000_1_1.csv")
dim1_40000_10000_1 <- read.csv("podatki/maksimalno_stevilo_zogic_100_100_40000_10000_1_1.csv")
dim1_50000_10000_1 <- read.csv("podatki/maksimalno_stevilo_zogic_100_100_50000_10000_1_1.csv")

#uvoz za minimalno stevilo zog
dim1_10000_10000_1_min <- read.csv("podatki/minimalno_stevilo_zogic_100_100_10000_10000_1_1.csv")
dim1_20000_10000_1_min <- read.csv("podatki/minimalno_stevilo_zogic_100_100_20000_10000_1_1.csv")
dim1_30000_10000_1_min <- read.csv("podatki/minimalno_stevilo_zogic_100_100_30000_10000_1_1.csv")
dim1_40000_10000_1_min <- read.csv("podatki/minimalno_stevilo_zogic_100_100_40000_10000_1_1.csv")
dim1_50000_10000_1_min <- read.csv("podatki/minimalno_stevilo_zogic_100_100_50000_10000_1_1.csv")

#plot(x=c(1:100), dim1_10000_10000_1$Maksimum)
#abline(h=mean(dim1_10000_10000_1$Maksimum))
#plot(x=c(1:100), dim1_20000_10000_1$Maksimum)
#abline(h=mean(dim1_20000_10000_1$Maksimum))
#plot(x=c(1:100), dim1_30000_10000_1$Maksimum)
#abline(h=mean(dim1_30000_10000_1$Maksimum))
#plot(x=c(1:100), dim1_40000_10000_1$Maksimum)
#abline(h=mean(dim1_40000_10000_1$Maksimum))
#plot(x=c(1:100), dim1_50000_10000_1$Maksimum)
#abline(h=mean(dim1_50000_10000_1$Maksimum))

#Urejanje podatkov

maksimumi_st_zog_1dim_1 <- rbind(dim1_10000_10000_1, dim1_20000_10000_1, dim1_30000_10000_1,dim1_40000_10000_1, dim1_50000_10000_1)
minimumi_st_zog_1dim_1 <- rbind(dim1_10000_10000_1_min, dim1_20000_10000_1_min, dim1_30000_10000_1_min, dim1_40000_10000_1_min, dim1_50000_10000_1_min)

#Vizualizacija

maks_zdruzena_dim1_zogice <- cbind(dim1_10000_10000_1[1], dim1_20000_10000_1[1], dim1_30000_10000_1[1], dim1_40000_10000_1[1],dim1_50000_10000_1[1])
colnames(maks_zdruzena_dim1_zogice) <- c("maks_10000", "maks_20000", "maks_30000", "maks_40000", "maks_50000")

povp1 <- apply(maks_zdruzena_dim1_zogice, 2, mean)
#
graf_povp_1 <- enframe(povp1) %>% ggplot(
  mapping = aes(x=c(1:5), y = value)
)+
  geom_line()+
  geom_point(size = 3)+
  geom_label_repel(aes(label = value))+
  labs(
    x = "Število žog (v 10000)",
    y = "Povprečnen maksimum",
    title = "Povprečen maksimum glede na število žog"
  ) 
graf_povp_1

par(mfrow=c(2,2))

plot(x=c(1:500), maksimumi_st_zog_1dim_1$Maksimum, type="p", pch=20, cex=0.5, main = "Maksimalna vrednost glede na število žog", ylab = "Maksimalno število žog v košu", xlab= "Število žog", xaxt = "n")
axis(1, at=seq(50, 450, by=100), labels = c(10000, 20000, 30000, 40000, 50000))
plot(x=c(1:500), maksimumi_st_zog_1dim_1$Delez_kosev_z_maksimalnim_stevilom_zog, type="p", pch=20, cex=0.5, main = "Delež košev z maksimalno vrednostjo glede na število žog", ylab = "Delež košev z maksimlanim številom žog", xlab = "Število žog", xaxt = "n" )
axis(1, at=seq(50, 450, by=100), labels = c(10000, 20000, 30000, 40000, 50000))
plot(x=c(1:500), maksimumi_st_zog_1dim_1$Casovna_zahtevnost, type="p", pch=20, cex=0.5, main = "Časovna zahtevnost glede na število žog", ylab = "Časovna zahtevnost", xlab = "Število žog", xaxt = "n")
axis(1, at=seq(50, 450, by=100), labels = c(10000, 20000, 30000, 40000, 50000))

#########################################################
# dim = 1, stevilo_zog = 10000, razdalja = k (k=1,2,3,4,5)
##########################################################

#Uvoz podatkov
dim1_10000_10000_2 <- read.csv("podatki/maksimalno_stevilo_zogic_100_100_10000_10000_2_1.csv")
dim1_10000_10000_3 <- read.csv("podatki/maksimalno_stevilo_zogic_100_100_10000_10000_3_1.csv")
dim1_10000_10000_4 <- read.csv("podatki/maksimalno_stevilo_zogic_100_100_10000_10000_4_1.csv")
dim1_10000_10000_5 <- read.csv("podatki/maksimalno_stevilo_zogic_100_100_10000_10000_5_1.csv")

#plot(x=c(1:100), dim1_10000_10000_1$Maksimum)
#abline(h=mean(dim1_10000_10000_1$Maksimum))
#plot(x=c(1:100), dim1_10000_10000_2$Maksimum)
#abline(h=mean(dim1_10000_10000_2$Maksimum))
#plot(x=c(1:100), dim1_10000_10000_3$Maksimum)
#abline(h=mean(dim1_10000_10000_3$Maksimum))
#plot(x=c(1:100), dim1_10000_10000_4$Maksimum)
#abline(h=mean(dim1_10000_10000_4$Maksimum))
#plot(x=c(1:100), dim1_10000_10000_5$Maksimum)
#abline(h=mean(dim1_10000_10000_5$Maksimum))

#Urejanje podatkov
maksimumi_st_zog_1dim_k <- rbind(dim1_10000_10000_1, dim1_10000_10000_2,dim1_10000_10000_3,dim1_10000_10000_4,dim1_10000_10000_5)

#Vizualizacija
maks_zdruzena_dim1_razdalja <- cbind(dim1_10000_10000_1[1], dim1_10000_10000_2[1], dim1_10000_10000_3[1], dim1_10000_10000_4[1],dim1_10000_10000_5[1])
povp2 <- apply(maks_zdruzena_dim1_razdalja, 2, mean)

graf_povp_2 <- enframe(povp2) %>% ggplot(
  mapping = aes(x=c(1:5), y = value)
)+
  geom_line()+
  geom_point(size = 3)+
  geom_label_repel(aes(label = value))+
  labs(
    x = "Razdalja",
    y = "Povprečno maksimalno število žog",
    title = "Povprečen maksimum glede na razdaljo"
  ) 
graf_povp_2


par(mfrow=c(2,2))
plot(x=c(1:500), maksimumi_st_zog_1dim_k$Maksimum, type="p", pch=20, cex=0.5, main = "Maksimalna vrednost", ylab = "Maksimalno število žog v košu", xlab = "Razdalja", xaxt = "n")
axis(1, at=seq(50, 450, by=100), labels = c(1, 2, 3, 4, 5))
plot(x=c(1:500), maksimumi_st_zog_1dim_k$Delez_kosev_z_maksimalnim_stevilom_zog, type="p", pch=20, cex=0.5, main = "Delež košev z maksimalno vrednostjo", ylab = "Delež košev z maksimumom", xlab = "Razdalja", xaxt = "n")
axis(1, at=seq(50, 450, by=100), labels = c(1, 2, 3, 4, 5))
plot(x=c(1:500), maksimumi_st_zog_1dim_k$Casovna_zahtevnost, type="p", pch=20, cex=0.5, main = "Časovna zahtevnost", ylab = "Časovna zahtevnost", xlab = "Razdalja", xaxt = "n")
axis(1, at=seq(50, 450, by=100), labels = c(1, 2, 3, 4, 5))
mtext("Odvisnost od razdalje", side=3, line=-1, outer= TRUE, col="darkred")

graf_povp_1dim <-ggarrange(graf_povp_1, graf_povp_2, 
                           ncol = 2, nrow = 1)
graf_povp_1dim

############################################################
# dim = 2, stevilo_zog = k*10000 (k=1,2,3,4,5), razdalja = 1
############################################################

#Uvoz podatkov
dim2_10000_100_1 <- read.csv("podatki/maksimalno_stevilo_zogic_100_100_10000_100_1_2.csv")
dim2_20000_100_1 <- read.csv("podatki/maksimalno_stevilo_zogic_100_100_20000_100_1_2.csv")
dim2_30000_100_1 <- read.csv("podatki/maksimalno_stevilo_zogic_100_100_30000_100_1_2.csv")
dim2_40000_100_1 <- read.csv("podatki/maksimalno_stevilo_zogic_100_100_40000_100_1_2.csv")
dim2_50000_100_1 <- read.csv("podatki/maksimalno_stevilo_zogic_100_100_50000_100_1_2.csv")

#Urejanje podatkov
maksimumi_st_zog_2dim_1 <- rbind(dim2_10000_100_1, dim2_20000_100_1, dim2_30000_100_1, dim2_40000_100_1, dim2_50000_100_1)

#Vizualizacija

maks_zdruzena_dim2_zogice <- cbind(dim2_10000_100_1[1], dim2_20000_100_1[1], dim2_30000_100_1[1], dim2_40000_100_1[1],dim2_50000_100_1[1])
povp3 <- apply(maks_zdruzena_dim2_zogice, 2, mean)

graf_povp_3 <- enframe(povp3) %>% ggplot(
  mapping = aes(x=c(1:5), y = value)
)+
  geom_line()+
  geom_point(size = 3)+
  geom_label_repel(aes(label = value))+
  labs(
    x = "Število žog (v 10000)",
    y = "Povprečno maksimalno število žog",
    title = "Povprečen maksimum glede na število žog"
  ) 
graf_povp_3

par(mfrow=c(2,2))
plot(x=c(1:500), maksimumi_st_zog_2dim_1$Maksimum, type="p", pch=20, cex=0.5, main = "Maksimalna vrednost", ylab = "Maksimalno število žog v košu", xlab= "Število žog", xaxt = "n")
axis(1, at=seq(50, 450, by=100), labels = c(10000, 20000, 30000, 40000, 50000))
plot(x=c(1:500), maksimumi_st_zog_2dim_1$Delez_kosev_z_maksimalnim_stevilom_zog, type="p", pch=20, cex=0.5, main = "Delež košev z maksimalno vrednostjo", ylab = "Delež košev z maksimumom", xlab = "Število žog", xaxt = "n")
axis(1, at=seq(50, 450, by=100), labels = c(10000, 20000, 30000, 40000, 50000))
plot(x=c(1:500), maksimumi_st_zog_2dim_1$Casovna_zahtevnost, type="p", pch=20, cex=0.5, main = "Časovna zahtevnost", ylab = "Časovna zahtevnost", xlab = "Število žog", xaxt = "n")
axis(1, at=seq(50, 450, by=100), labels = c(10000, 20000, 30000, 40000, 50000))
mtext("Odvisnost od števila žog", side=3, line=-1, outer= TRUE, col="darkred")
##########################################################
# dim = 2, stevilo_zog = 10000, razdalja = k (k=1,2,3,4,5)
##########################################################

#Uvoz podatkov
dim2_10000_100_2 <- read.csv("podatki/maksimalno_stevilo_zogic_100_100_10000_100_2_2.csv")
dim2_10000_100_3 <- read.csv("podatki/maksimalno_stevilo_zogic_100_100_10000_100_3_2.csv")
dim2_10000_100_4 <- read.csv("podatki/maksimalno_stevilo_zogic_100_100_10000_100_4_2.csv")
dim2_10000_100_5 <- read.csv("podatki/maksimalno_stevilo_zogic_100_100_10000_100_5_2.csv")

#Urejanje podatkov
maksimumi_st_zog_2dim_k <- rbind(dim2_10000_100_1, dim2_10000_100_2, dim2_10000_100_3, dim2_10000_100_4,dim2_10000_100_5)

#Vizualizacija
maks_zdruzena_dim2_razdalja <- cbind(dim2_10000_100_1[1], dim2_10000_100_2[1], dim2_10000_100_3[1], dim2_10000_100_4[1],dim2_10000_100_5[1])
povp4 <- apply(maks_zdruzena_dim2_razdalja, 2, mean)

graf_povp_4 <- enframe(povp4) %>% ggplot(
  mapping = aes(x=c(1:5), y = value)
)+
  geom_line()+
  geom_point(size = 3)+
  geom_label_repel(aes(label = value))+
  labs(
    x = "Razdalja",
    y = "Povprečno maksimalno število žog",
    title = "Povprečen maksimum glede na razdaljo"
  ) 
graf_povp_4

par(mfrow=c(2,2))
plot(x=c(1:500), maksimumi_st_zog_2dim_k$Maksimum, type="p", pch=20, cex=0.5, main = "Maksimalna vrednost", ylab = "Maksimalno število žog v košu", xlab= "Razdalja", xaxt = "n")
axis(1, at=seq(50, 450, by=100), labels = c(1, 2, 3, 4, 5))
plot(x=c(1:500), maksimumi_st_zog_2dim_k$Delez_kosev_z_maksimalnim_stevilom_zog, type="p", pch=20, cex=0.5, main = "Delež košev z maksimalno vrednostjo", ylab = "Delež košev z maksimumom", xlab = "Razdalja", xaxt = "n")
axis(1, at=seq(50, 450, by=100), labels = c(1, 2, 3, 4, 5))
plot(x=c(1:500), maksimumi_st_zog_2dim_k$Casovna_zahtevnost, type="p", pch=20, cex=0.5, main = "Časovna zahtevnost", ylab = "Časovna zahtevnost", xlab = "Razdalja", xaxt = "n")
axis(1, at=seq(50, 450, by=100), labels = c(1, 2, 3, 4, 5))
mtext("Odvisnost od razdalje", side=3, line=-1, outer= TRUE, col="darkred")


graf_povp_2dim <-ggarrange(graf_povp_3, graf_povp_4, 
                           ncol = 2, nrow = 1)
graf_povp_2dim


###################################################################
# dim = 1, stevilo_zog = k*10000 (k=1,2,3,4,5), razdalja = 1, minimum
###################################################################


#minimum
min_zdruzena_dim1_zogice <- cbind(dim1_10000_10000_1_min[1], dim1_20000_10000_1_min[1], dim1_30000_10000_1_min[1], dim1_40000_10000_1_min[1],dim1_50000_10000_1_min[1])
colnames(min_zdruzena_dim1_zogice) <- c("min_10000", "min_20000", "min_30000", "min_40000", "min_50000")
povp1_min <- apply(min_zdruzena_dim1_zogice, 2, mean)
#
graf_povp_1_min <- enframe(povp1_min) %>% ggplot(
  mapping = aes(x=c(1:5), y = value)
)+
  geom_line()+
  geom_point(size = 3)+
  geom_label_repel(aes(label = value))+
  labs(
    x = "Število žog (v 10000)",
    y = "Povprečno minimalno število žog",
    title= "Delež minimalnih vrednosti"
  ) 
graf_povp_1_min


min_zdruzena_dim1_zogice_delezi <- cbind(dim1_10000_10000_1_min[2], dim1_20000_10000_1_min[2], dim1_30000_10000_1_min[2], dim1_40000_10000_1_min[2],dim1_50000_10000_1_min[2])
colnames(min_zdruzena_dim1_zogice) <- c("delez_10000", "delez_20000", "delez_30000", "delez_40000", "delez_50000")
povp2_min <-apply(min_zdruzena_dim1_zogice_delezi, 2, mean)
#
graf_povp_2_min <- enframe(povp2_min) %>% ggplot(
  mapping = aes(x=c(1:5), y = value)
)+
  geom_line()+
  geom_point(size = 3)+
  geom_label_repel(aes(label = value))+
  labs(
    x = "Število žog (v 10000)",
    y = "Delež košev z minimalnim številom žog",
    title="Minimalna vrednost"
  ) 
graf_povp_2_min

graf_min <- ggarrange(graf_povp_1_min, graf_povp_2_min, 
                      ncol = 2, nrow = 1)
graf_min



###################################################################
# dim = 3, stevilo_zog = k*8000 (k=1,2,3,4,5), razdalja = 1,
###################################################################
#Uvoz podatkov
dim3_8000_100_1 <- read.csv("podatki/maksimalno_stevilo_zogic_100_100_8000_20_1_3.csv")
dim3_16000_100_1 <- read.csv("podatki/maksimalno_stevilo_zogic_100_100_16000_20_1_3.csv")
dim3_24000_100_1 <- read.csv("podatki/maksimalno_stevilo_zogic_100_100_24000_20_1_3.csv")
dim3_32000_100_1 <- read.csv("podatki/maksimalno_stevilo_zogic_100_100_32000_20_1_3.csv")
dim3_40000_100_1 <- read.csv("podatki/maksimalno_stevilo_zogic_100_100_40000_20_1_3.csv")

#Urejanje podatkov
maksimumi_st_zog_3dim_k <- rbind(dim3_8000_100_1, dim3_16000_100_1,dim3_24000_100_1, dim3_32000_100_1,dim3_40000_100_1)

#Vizualizacija
maks_zdruzena_dim3_razdalja <- cbind(dim3_8000_100_1[1], dim3_16000_100_1[1],dim3_24000_100_1[1], dim3_32000_100_1[1],dim3_40000_100_1[1])
delez_zdruzena_dim3_razdalja <- cbind(dim3_8000_100_1[2], dim3_16000_100_1[2],dim3_24000_100_1[2], dim3_32000_100_1[2],dim3_40000_100_1[2])
cas_zdruzena_dim3_razdalja <- cbind(dim3_8000_100_1[3], dim3_16000_100_1[3],dim3_24000_100_1[3], dim3_32000_100_1[3],dim3_40000_100_1[3])

povp3d_maks <- round(apply(maks_zdruzena_dim3_razdalja, 2, mean), 2)
povp3d_delez <- round(apply(delez_zdruzena_dim3_razdalja, 2, mean), 3)
povp3d_cas <- round(apply(cas_zdruzena_dim3_razdalja, 2, mean), 2)

#
graf_povp_3d_maks <- enframe(povp3d_maks) %>% ggplot(
  mapping = aes(x=c(1:5), y = value)
)+
  geom_line()+
  geom_point(size = 3)+
  geom_label_repel(aes(label = value))+
  labs(
    x = "Število žog (v 8000)",
    y = "Maksimum zog",
    title="Povprečna maksimalna vrednost"
  ) 
graf_povp_3d_maks

#
graf_povp_3d_delez <- enframe(povp3d_delez) %>% ggplot(
  mapping = aes(x=c(1:5), y = value)
)+
  geom_line()+
  geom_point(size = 3)+
  geom_label_repel(aes(label = value))+
  labs(
    x = "Število žog (v 8000)",
    y = "Delež maksimalnih košar",
    title="Delež košev z maksimalno vrednostjo"
  ) 
graf_povp_3d_delez

#
graf_povp_3d_cas <- enframe(povp3d_cas) %>% ggplot(
  mapping = aes(x=c(1:5), y = value)
)+
  geom_line()+
  geom_point(size = 3)+
  geom_label_repel(aes(label = value))+
  labs(
    x = "Število žog (v 8000)",
    y = "Časovna zahtevnost",
    title="Povprečna časovna zahtevnost"
  ) 
graf_povp_3d_cas


graf_3d <- ggarrange(graf_povp_3d_maks, graf_povp_3d_delez, graf_povp_3d_cas,
                     ncol = 2, nrow = 2)
graf_3d

