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



#stevila <- rep(1:100, 5)
maks_zdruzena_dim1_zogice <- cbind(dim1_10000_10000_1[1], dim1_20000_10000_1[1], dim1_30000_10000_1[1], dim1_40000_10000_1[1],dim1_50000_10000_1[1])
colnames(maks_zdruzena_dim1_zogice) <- c("maks_10000", "maks_20000", "maks_30000", "maks_40000", "maks_50000")
#maks_zdruzena_dim1_zogice_preurejena <- maks_zdruzena_dim1_zogice %>% pivot_longer(c(1:5), names_to = "colname", values_to = "val") %>% arrange(colname)
#maks_zdruzena_dim1_zogice_preurejena <- cbind(stevila, maks_zdruzena_dim1_zogice_preurejena)
#
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
    y = "Povprečno maksimalno število žog",
    title = "Povprečno maksimalno število žog v košu glede na število žog"
  ) 
graf_povp_1

#
#graf1 <- maks_zdruzena_dim1_zogice_preurejena %>% filter(colname %in% maks_zdruzena_dim1_zogice_preurejena$colname)%>%
#  ggplot(
#    mapping = aes(x = stevila, y = val)
#  )+
#  geom_point()+
#  geom_smooth(method = lm, size=1)+
#  facet_wrap(. ~ colname)
#
#graf1
#
#
#graf1 <- ggplot(
#    mapping = aes(x = c(1:100), y = maks_zdruzena_dim1_zogice$maks_10000)
#  )+
#  geom_point()+
#  geom_smooth(method = lm, size=1)+
#  geom_point(aes(x = c(1:100), maks_zdruzena_dim1_zogice$maks_20000))+
#  geom_smooth(aes(x = c(1:100), maks_zdruzena_dim1_zogice$maks_20000),method = lm, size=1)+
#  geom_point(aes(x = c(1:100), maks_zdruzena_dim1_zogice$maks_30000))+
#  geom_smooth(aes(x = c(1:100), maks_zdruzena_dim1_zogice$maks_30000),method = lm, size=1)+
#  geom_point(aes(x = c(1:100), maks_zdruzena_dim1_zogice$maks_40000))+
#  geom_smooth(aes(x = c(1:100), maks_zdruzena_dim1_zogice$maks_40000),method = lm, size=1)+
#  geom_point(aes(x = c(1:100), maks_zdruzena_dim1_zogice$maks_50000))+
#  geom_smooth(aes(x = c(1:100), maks_zdruzena_dim1_zogice$maks_50000),method = lm, size=1)
#graf1
#
#preizkus histograma
#par(mfrow=c(1,1))
#maksimum_dim1_1000_1000_1 <- as.numeric(unlist(dim1_10000_10000_1[1]))
#h_dim1_1000_1000_1 <- hist(maksimum_dim1_1000_1000_1, xlim = c(min(maksimum_dim1_1000_1000_1)-0.05, max(maksimum_dim1_1000_1000_1)+0.05), ylim = c(0,25))
#abline(v = mean(maksimum_dim1_1000_1000_1), col = "red", lty = "dashed")
#text(x = mean(maksimum_dim1_1000_1000_1), y = 25, label = round(mean(maksimum_dim1_1000_1000_1),3), pos=2, col="red")
#legend('topright', legend = c("Povprečje"),
#       col = c("red"), cex=0.6, lty=c("dashed"))


par(mfrow=c(3,1))

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
    title = "Povprečno maksimalno število žog v košu glede razdaljo"
  ) 
graf_povp_2


par(mfrow=c(3,1))
plot(x=c(1:500), maksimumi_st_zog_1dim_k$Maksimum, type="p", pch=20, cex=0.5, main = "Maksimalna vrednost glede na razdaljo", ylab = "Maksimalno število žog v košu", xlab = "Razdalja", xaxt = "n")
axis(1, at=seq(50, 450, by=100), labels = c(1, 2, 3, 4, 5))
plot(x=c(1:500), maksimumi_st_zog_1dim_k$Delez_kosev_z_maksimalnim_stevilom_zog, type="p", pch=20, cex=0.5, main = "Delež košev z maksimalno vrednostjo glede razdaljo", ylab = "Delež košev z maksimlanim številom žog", xlab = "Razdalja", xaxt = "n")
axis(1, at=seq(50, 450, by=100), labels = c(1, 2, 3, 4, 5))
plot(x=c(1:500), maksimumi_st_zog_1dim_k$Casovna_zahtevnost, type="p", pch=20, cex=0.5, main = "Časovna zahtevnost glede na razdaljo", ylab = "Časovna zahtevnost", xlab = "Razdalja", xaxt = "n")
axis(1, at=seq(50, 450, by=100), labels = c(1, 2, 3, 4, 5))


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
    x = "Število žog (v 10000",
    y = "Povprečno maksimalno število žog",
    title = "Povprečno maksimalno število žog v košu glede število žog"
  ) 
graf_povp_3

par(mfrow=c(3,1))
plot(x=c(1:500), maksimumi_st_zog_2dim_1$Maksimum, type="p", pch=20, cex=0.5, main = "Maksimalna vrednost glede na število žog", ylab = "Maksimalno število žog v košu", xlab= "Število žog", xaxt = "n")
axis(1, at=seq(50, 450, by=100), labels = c(10000, 20000, 30000, 40000, 50000))
plot(x=c(1:500), maksimumi_st_zog_2dim_1$Delez_kosev_z_maksimalnim_stevilom_zog, type="p", pch=20, cex=0.5, main = "Delež košev z maksimalno vrednostjo glede na število žog", ylab = "Delež košev z maksimlanim številom žog", xlab = "Število žog", xaxt = "n")
axis(1, at=seq(50, 450, by=100), labels = c(10000, 20000, 30000, 40000, 50000))
plot(x=c(1:500), maksimumi_st_zog_2dim_1$Casovna_zahtevnost, type="p", pch=20, cex=0.5, main = "Časovna zahtevnost glede na število žog", ylab = "Časovna zahtevnost", xlab = "Število žog", xaxt = "n")
axis(1, at=seq(50, 450, by=100), labels = c(10000, 20000, 30000, 40000, 50000))

##########################################################
# dim = 1, stevilo_zog = 10000, razdalja = k (k=1,2,3,4,5)
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
    title = "Povprečno maksimalno število žog v košu glede razdaljo"
  ) 
graf_povp_4

par(mfrow=c(3,1))
plot(x=c(1:500), maksimumi_st_zog_2dim_k$Maksimum, type="p", pch=20, cex=0.5, main = "Maksimalna vrednost glede na razdaljo", ylab = "Maksimalno število žog v košu", xlab= "Razdalja", xaxt = "n")
axis(1, at=seq(50, 450, by=100), labels = c(1, 2, 3, 4, 5))
plot(x=c(1:500), maksimumi_st_zog_2dim_k$Delez_kosev_z_maksimalnim_stevilom_zog, type="p", pch=20, cex=0.5, main = "Delež košev z maksimalno vrednostjo glede na razdaljo", ylab = "Delež košev z maksimlanim številom žog", xlab = "Razdalja", xaxt = "n")
axis(1, at=seq(50, 450, by=100), labels = c(1, 2, 3, 4, 5))
plot(x=c(1:500), maksimumi_st_zog_2dim_k$Casovna_zahtevnost, type="p", pch=20, cex=0.5, main = "Časovna zahtevnost glede na razdaljo", ylab = "Časovna zahtevnost", xlab = "Razdalja", xaxt = "n")
axis(1, at=seq(50, 450, by=100), labels = c(1, 2, 3, 4, 5))



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
