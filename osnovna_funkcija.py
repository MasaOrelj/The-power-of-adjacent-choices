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

def maksimalno_stevilo_zogic_1d(st_zogic, st_kosev, razdalja=1, iscemo_min=False):
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
    if iscemo_min:
        minimum = min(kosi)
        st_kosev_z_min_vrednostjo = kosi.count(minimum)
        delez_kosev_min = st_kosev_z_min_vrednostjo / st_kosev
        
        return minimum, casovna_zahtevnost, delez_kosev_min
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
    kosi = [st_kosev*[0] for i in range(st_kosev)] #dodamo for loop, ker [[0]*st_kosev]*st_kosev dela probleme pri dodajanju zog v kose, saj spreminja vsako vrstico namesto posameznega elementa
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

def najdi_sosede_3d(kosi,izbrana_kosarica, razdalja=1):
    dolzina = izbrana_kosarica[0]
    sirina = izbrana_kosarica[1]
    visina = izbrana_kosarica[2]
    sosedi = {}
    st_kosev = len(kosi)
    for d in range((-razdalja),(razdalja+1)): #pogledamo sosede po dolzini
        indeks_soseda_dolzina = (izbrana_kosarica[0] + d) % st_kosev #poiscemo index vrstice sosedov
        sosedi[indeks_soseda_dolzina,sirina, visina] = kosi[indeks_soseda_dolzina][sirina][visina] #v slovar sosedov dodamo (vrstico, stolpec) posameznega soseda in njegovo vrednost
    for s in range((-razdalja),(razdalja+1)): #pogledamo sosede po dolzini
        indeks_soseda_sirina = (izbrana_kosarica[1] + s) % st_kosev #poiscemo index vrstice sosedov
        sosedi[dolzina,indeks_soseda_sirina, visina] = kosi[dolzina][indeks_soseda_sirina][visina] #v slovar sosedov dodamo (vrstico, stolpec) posameznega soseda in njegovo vrednost
    for v in range((-razdalja),(razdalja+1)): #pogledamo sosede v stolpcu
        indeks_soseda_visina = (izbrana_kosarica[2] + v) % st_kosev #poiscemo index stolpca sosedov
        sosedi[dolzina,sirina, indeks_soseda_visina] = kosi[dolzina][sirina][indeks_soseda_visina] #v slovar sosedov dodamo (vrstico, stolpec) posameznega soseda in njegovo vrednost       
    min_vrednost = min(sosedi.values()) #poiscemo minimalno vrednost sosedov
    return sosedi, min_vrednost

def maksimalno_stevilo_zogic_3d(st_zogic, st_kosev, razdalja=1):
    zacetek = time.time()
    kosi = [[st_kosev*[0] for i in range(st_kosev)] for j in range(st_kosev)] #podobno kot pri 2d nardimo dva for loopa
    for i in range(st_zogic):
        izbrana_kosarica = [random.randrange(st_kosev), random.randrange(st_kosev), random.randrange(st_kosev)]
        sosedi, min_vrednost = najdi_sosede_3d(kosi, izbrana_kosarica, razdalja) #pridobimo sosede in minimalno vrednost iz pomozne funkcije
        kandidati = [k for k,v in sosedi.items() if v == min_vrednost] #poiscemo kandidate iz sosedov z minimalno vrednostjo
        min_sosed = list(min(kandidati)) #vzame se sosed z najmanjsim prvim indexom, leksikografsko
        dolzina = min_sosed[0]
        sirina = min_sosed[1]
        visina = min_sosed[2]
        kosi[dolzina][sirina][visina] += 1 #minimalnemu sosedu dodamo zogo
    maksimum = max(max(max(vrstica for vrstica in kosi))) #poiscemo maksimalno stevilo zog v posameznem kosu
    st_kosev_z_max_vrednostjo = sum([vrstica.count(maksimum) for dolzine in kosi for vrstica in dolzine]) #prestejemo stevilo kosev, ki imajo maksimalno vrednost
    delez_kosev = st_kosev_z_max_vrednostjo / (st_kosev*st_kosev*st_kosev) #izracunamo delez kosev z maksimalno vrednostjo
    konec = time.time()
    casovna_zahtevnost = f'{konec-zacetek}' #izracunamo casovno zahtevnost algoritma
    return maksimum, casovna_zahtevnost, delez_kosev

def ponovi_maksimalno_stevilo_zogic(st_ponovitev, st_zogic, st_kosev, razdalja=1, dimenzija=1, iscemo_min=False): #funkcija, ki ponovi nakljucno razporejanje zogic st_ponovitev-krat
    max_vrednosti = []
    casovne_zahtevnosti = []
    delezi_kosev = []

    if iscemo_min: #ce racunamo minimum
        min_vrednosti = []
        if dimenzija != 1:
            raise ValueError("Neveljavna dimenzija")
        for i in range(st_ponovitev):
            min_vrednost, casovna_zahtevnost, delez_kosev = maksimalno_stevilo_zogic_1d(st_zogic, st_kosev, razdalja, iscemo_min) #izracunamo minimalno vrednost, casovno zahtevnost in delez kosev z minimalnim stevilom zog
            min_vrednosti.append(min_vrednost) #dodamo minimalne vrednosti 
            casovne_zahtevnosti.append(float(casovna_zahtevnost)) #dodamo casovne zahtevnosti
            delezi_kosev.append(delez_kosev) #dodamo deleze kosov z minimalnim stevilom zog
        povprecna_min_vrednost = sum(min_vrednosti) / len(min_vrednosti) #izracunamo povprecno minimalno vrednost
        casovna_zahtevnost = sum(casovne_zahtevnosti) #izracunamo skupno casovno zahtevnost
        povprecni_delez_kosev = sum(delezi_kosev) / len(delezi_kosev) #izracunamo povprecni delez kosev z minimalno vrednostjo 
        return povprecna_min_vrednost, casovna_zahtevnost, povprecni_delez_kosev           
    else: #normalno racunamo max
        for i in range(st_ponovitev):
            max_vrednost, casovna_zahtevnost, delez_kosev = globals()[f'maksimalno_stevilo_zogic_{dimenzija}d'](st_zogic, st_kosev, razdalja) #izracunamo maksimalno vrednost, casovno zahtevnost in delez kosev z maksimalnim stevilom zog
            max_vrednosti.append(max_vrednost) #dodamo maksimalne vrednosti 
            casovne_zahtevnosti.append(float(casovna_zahtevnost)) #dodamo casovne zahtevnosti
            delezi_kosev.append(delez_kosev) #dodamo deleze kosov z maksimalnim stevilom zog
        povprecna_max_vrednost = sum(max_vrednosti) / len(max_vrednosti) #izracunamo povprecno maksimalno vrednost
        casovna_zahtevnost = sum(casovne_zahtevnosti) #izracunamo skupno casovno zahtevnost
        povprecni_delez_kosev = sum(delezi_kosev) / len(delezi_kosev) #izracunamo povprecni delez kosev z maksimalno vrednostjo
    return povprecna_max_vrednost, casovna_zahtevnost, povprecni_delez_kosev

def zapisi_rezultate(st_poskusov, st_ponovitev, st_zogic, st_kosev, razdalja=1, dimenzija=1, iscemo_min= False): #zapisemo nase poizkuse v csv datoteke
    if iscemo_min and dimenzija == 1:
        datoteka = "podatki/minimalno_stevilo_zogic_%d_%d_%d_%d_%d_%d.csv" % (st_poskusov, st_ponovitev, st_zogic, st_kosev, razdalja, dimenzija) #shranimo datoteko glede na razlicne parametre
        with open(datoteka, "w") as f:
            writer = csv.writer(f)
            writer.writerow(["Minimum", "Delez_kosev_z_minimalnim_stevilom_zog", "Casovna_zahtevnost"]) #zapisemo naslove stolpcev
            for i in range(st_poskusov):
                min, casovna_zahtevnost, delez_kosev = ponovi_maksimalno_stevilo_zogic(st_ponovitev,st_zogic, st_kosev, razdalja, dimenzija, iscemo_min) #izracunamo povprecne maksimume, casovne zahtevnosti in deleze kosev
                writer.writerow([min, delez_kosev, casovna_zahtevnost]) #zapisemo v vrstico
                f.flush()  #zapise takoj brez bufferja  
    else:
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


#zapisi_rezultate(100,100, 10000, 10000,1,1, True)
#zapisi_rezultate(100,100, 20000, 10000,1,1, True)
#zapisi_rezultate(100,100, 30000, 10000,1,1, True)
#zapisi_rezultate(100,100, 40000, 10000,1,1, True)
#zapisi_rezultate(100,100, 50000, 10000,1,1, True)


#zapisi_rezultate(100,100, 8000, 20,1,3)
#zapisi_rezultate(100,100, 16000, 20,1,3)
#zapisi_rezultate(100,100, 24000, 20,1,3)
#zapisi_rezultate(100,100, 32000, 20,1,3)
#zapisi_rezultate(100,100, 40000, 20,1,3)