import random
import time
import csv

#ce ima vec sosedov minimalno stevilo zogic vzame tistega, ki ima najmanjsi indeks

def najdi_sosede_1d(kosi,izbrana_kosarica, razdalja=1):
    sosedi = {}
    st_kosev = len(kosi)
    for j in range((-razdalja),(razdalja+1)):
        indeks_soseda = (izbrana_kosarica + j) % st_kosev #najde indeks soseda v listu s pomocjo modula, da velja kroznost
        sosedi[indeks_soseda] = kosi[indeks_soseda] #v slovar sosedov dodamo njegov indeks kot kljuc in njegovo stevilo zog kot vrednost
    min_vrednost = min(sosedi.values()) #izmed sosedov poiscemo minimalno vrednost
    return sosedi, min_vrednost

def maksimalno_stevilo_zogic(st_zogic, st_kosev, razdalja=1):
    zacetek = time.time()
    kosi = [0]*st_kosev
    for i in range(st_zogic):
        izbrana_kosarica = random.randrange(st_kosev) 
        sosedi, min_vrednost = najdi_sosede_1d(kosi, izbrana_kosarica, razdalja) #iz nase pomozne funkcije dobimo sosede in minimalno vrednost
        kandidati = [k for k,v in sosedi.items() if v == min_vrednost] #poiscemo vse kandidate, ki so sosedi in imajo minimalno vrednost
        min_sosed = min(kandidati) #izmed kandidatov vzamemo tistega z najnizjim indeksom
        kosi[min_sosed] += 1 #minimalnemu sosedu dodamo zogo
    maksimum = max(kosi) #poiscemo maksimalno stevilo zog v posameznem kosu
    st_kosev_z_max_vrednostjo = kosi.count(max(kosi)) #prestejemo stevilo kosev, ki imajo maksimalno stevilo zog
    delez_kosev = st_kosev_z_max_vrednostjo / st_kosev #izracunamo delez kosev z maksimalnim stevilom zog
    konec = time.time()
    casovna_zahtevnost = f'{konec-zacetek}' #izracunamo casovno zahtevnost algoritma
    return maksimum, casovna_zahtevnost, delez_kosev

def najdi_sosede_2d(kosi,izbrana_kosarica, razdalja=1):
    vrstica = izbrana_kosarica[0]
    stolpec = izbrana_kosarica[1]
    sosedi = {}
    st_kosev = len(kosi)
    for vr in range((-razdalja),(razdalja+1)): #pogledamo sosede v vrstici
        indeks_soseda_vrstica = (izbrana_kosarica[0] + vr) % st_kosev #poiscemo index vrstice sosedov
        sosedi[indeks_soseda_vrstica,stolpec] = kosi[indeks_soseda_vrstica][stolpec] #v slovar sosedov dodamo (vrstico, stolpec) posameznega soseda in njegovo vrednost
    for st in range((-razdalja),(razdalja+1)): #pogledamo sosede v stolpcu
        indeks_soseda_stolpec = (izbrana_kosarica[1] + st) % st_kosev #poiscemo index stolpca sosedov
        sosedi[vrstica,indeks_soseda_stolpec] = kosi[vrstica][indeks_soseda_stolpec] #v slovar sosedov dodamo (vrstico, stolpec) posameznega soseda in njegovo vrednost       
    min_vrednost = min(sosedi.values()) #poiscemo minimalno vrednost sosedov
    return sosedi, min_vrednost

def maksimalno_stevilo_zogic_2d(st_zogic, st_kosev, razdalja=1):
    zacetek = time.time()
    kosi = [st_kosev*[0] for count in range(st_kosev)] #dodamo count, ker [[0]*st_kosev]*st_kosev dela probleme pri dodajanju zog v kose, saj spreminja vsako vrstico namesto posameznega elementa
    for i in range(st_zogic):
        izbrana_kosarica = [random.randrange(st_kosev), random.randrange(st_kosev)]
        sosedi, min_vrednost = najdi_sosede_2d(kosi, izbrana_kosarica, razdalja) #pridobimo sosede in minimalno vrednost iz pomozne funkcije
        kandidati = [k for k,v in sosedi.items() if v == min_vrednost] #poiscemo kandidate iz sosedov z minimalno vrednostjo
        min_sosed = list(min(kandidati)) #vzame se sosed z najmanjsim prvim indexom, leksikografsko
        vrstica = min_sosed[0]
        stolpec = min_sosed[1]
        kosi[vrstica][stolpec] += 1 #minimalnemu sosedu dodamo zogo
    maksimum = max(max(vrstica for vrstica in kosi)) #poiscemo maksimalno stevilo zog v posameznem kosu
    st_kosev_z_max_vrednostjo = sum([vrstica.count(maksimum) for vrstica in kosi]) #prestejemo stevilo kosev, ki imajo maksimalno vrednost
    delez_kosev = st_kosev_z_max_vrednostjo / (st_kosev*st_kosev) #izracunamo delez kosev z maksimalno vrednostjo
    konec = time.time()
    casovna_zahtevnost = f'{konec-zacetek}' #izracunamo casovno zahtevnost algoritma
    return maksimum, casovna_zahtevnost, delez_kosev

def ponovi_maksimalno_stevilo_zogic(st_ponovitev, st_zogic, st_kosev, razdalja=1, dimenzija=1): #funkcija, ki ponovi nakljucno razporejanje zogic st_ponovitev-krat
    max_vrednosti = []
    casovne_zahtevnosti = []
    delezi_kosev = []
    if dimenzija == 1: #racunamo za eno dimenzijo
        for i in range(st_ponovitev):
            max_vrednost, casovna_zahtevnost, delez_kosev = maksimalno_stevilo_zogic(st_zogic, st_kosev, razdalja) #izracunamo maksimalno vrednost, casovno zahtevnost in delez kosev z maksimalnim stevilom zog
            max_vrednosti.append(max_vrednost) #dodamo maksimalne vrednosti 
            casovne_zahtevnosti.append(float(casovna_zahtevnost)) #dodamo casovne zahtevnosti
            delezi_kosev.append(delez_kosev) #dodamo deleze kosov z maksimalnim stevilom zog
        povprecna_max_vrednost = sum(max_vrednosti) / len(max_vrednosti) #izracunamo povprecno maksimalno vrednost
        casovna_zahtevnost = sum(casovne_zahtevnosti) #izracunamo skupno casovno zahtevnost
        povprecni_delez_kosev = sum(delezi_kosev) / len(delezi_kosev) #izracunamo povprecni delez kosev z maksimalno vrednostjo
    elif dimenzija == 2:
        for i in range(st_ponovitev): #enako kot za eno dimenzijo
            max_vrednost, casovna_zahtevnost, delez_kosev = maksimalno_stevilo_zogic_2d(st_zogic, st_kosev, razdalja) 
            max_vrednosti.append(max_vrednost)
            casovne_zahtevnosti.append(float(casovna_zahtevnost))
            delezi_kosev.append(delez_kosev)
        povprecna_max_vrednost = sum(max_vrednosti) / len(max_vrednosti)
        casovna_zahtevnost = sum(casovne_zahtevnosti)
        povprecni_delez_kosev = sum(delezi_kosev) / len(delezi_kosev)
    else:
        raise ValueError("Neveljavna dimenzija")
    return povprecna_max_vrednost, casovna_zahtevnost, povprecni_delez_kosev

def zapisi_rezultate(st_poskusov, st_ponovitev, st_zogic, st_kosev, razdalja=1, dimenzija=1): #zapisemo nase poizkuse v csv datoteke
    datoteka = "podatki/maksimalno_stevilo_zogic_%d_%d_%d_%d_%d_%d.csv" % (st_poskusov, st_ponovitev, st_zogic, st_kosev, razdalja, dimenzija) #shranimo datoteko glede na razlicne parametre
    with open(datoteka, "w") as f:
        writer = csv.writer(f)
        writer.writerow(["Maksimum", "Delez_kosev_z_maksimalnim_stevilom_zog", "Casovna_zahtevnost"]) #zapisemo naslove stolpcev
        for i in range(st_poskusov):
            max, casovna_zahtevnost, delez_kosev = ponovi_maksimalno_stevilo_zogic(st_ponovitev,st_zogic, st_kosev, razdalja, dimenzija) #izracunamo povprecne maksimume, casovne zahtevnosti in deleze kosev
            writer.writerow([max, delez_kosev, casovna_zahtevnost]) #zapisemo v vrstico
            f.flush()  #zapise takoj brez bufferja




#zapisi_rezultate(100,100, 10000, 10000,1,1)
#zapisi_rezultate(100,100, 20000, 10000,1,1)
#zapisi_rezultate(100,100, 30000, 10000,1,1)
#zapisi_rezultate(100,100, 40000, 10000,1,1)
#zapisi_rezultate(100,100, 50000, 10000,1,1)
#zapisi_rezultate(100,100, 10000, 10000,2,1)
#zapisi_rezultate(100,100, 10000, 10000,3,1)
#zapisi_rezultate(100,100, 10000, 10000,4,1)
#zapisi_rezultate(100,100, 10000, 10000,5,1)

#zapisi_rezultate(100,100, 10000, 100,1,2)
#zapisi_rezultate(100,100, 20000, 100,1,2)
#zapisi_rezultate(100,100, 30000, 100,1,2)
#zapisi_rezultate(100,100, 40000, 100,1,2)
#zapisi_rezultate(100,100, 50000, 100,1,2)
#zapisi_rezultate(100,100, 10000, 100,2,2)
#zapisi_rezultate(100,100, 10000, 100,3,2)
#zapisi_rezultate(100,100, 10000, 100,4,2)
#zapisi_rezultate(100,100, 10000, 100,5,2)




