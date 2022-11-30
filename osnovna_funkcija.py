import random
import time


#B...seznam kosaric
#x...stevilo razdejenih zogic
#n...stevilo zogic
#s...stevilo levih (oz. desnih) sosedov

#ce ima vec sosedov minimalno stevilo zogic vzame tistega, ki ima najmanjsi indeks

def maksimalno_stevilo_zogic(n):
    B = [0]*n
    x = 0
    print(B)
    for x in range(n):
        izbrana_kosarica = random.randrange(n)
        if izbrana_kosarica == 0:
            sosedi = [B[-1]] + B[0:2]
            minimalni_sosed = min(sosedi)
            indeks = sosedi.index(minimalni_sosed)
            if indeks == 0:
                B[-1] += 1
            else:
                B[izbrana_kosarica -1] += 1
        elif izbrana_kosarica == n-1:
            sosedi = B[n-2:n] + [B[0]]
            minimalni_sosed = min(sosedi)
            indeks = sosedi.index(minimalni_sosed)
            if indeks == 0:
                B[0] += 1
            else:
                B[izbrana_kosarica-2] +=1
        else:
            minimalni_sosed = min(B[izbrana_kosarica -1 : izbrana_kosarica +2])
            indeks = B[izbrana_kosarica - 1 : izbrana_kosarica + 2].index(minimalni_sosed)
            B[izbrana_kosarica -1 + indeks] += 1
    print(B)
    return max(B)

def najdi_sosede_1d(kosi,izbrana_kosarica, razdalja=1):
    sosedi = {}
    st_kosov = len(kosi)
    for j in range((-razdalja),(razdalja+1)):
        indeks_soseda = (izbrana_kosarica + j) % st_kosov
        sosedi[indeks_soseda] = kosi[indeks_soseda]
    min_vrednost = min(sosedi.values())
    return sosedi, min_vrednost


def maksimalno_stevilo_zogic2(st_zogic, st_kosov, razdalja=1):
    zacetek = time.time()
    kosi = [0]*st_kosov
    for i in range(st_zogic):
        izbrana_kosarica = random.randrange(st_kosov)
        sosedi, min_vrednost = najdi_sosede_1d(kosi, izbrana_kosarica, razdalja)
        kandidati = [k for k,v in sosedi.items() if v == min_vrednost]
        min_sosed = min(kandidati)
        kosi[min_sosed] += 1
        #print(izbrana_kosarica)
        #print(sosedi)
        #print(kandidati)
    konec = time.time()
    print("Časovna zahtevnost:" f'{konec - zacetek}')
    print(max(kosi))

#maksimalno_stevilo_zogic2(3000000,1000000,4)
#maksimalno_stevilo_zogic2(1000000,1000000,2)
#maksimalno_stevilo_zogic2(1000000,1000000,3)


def najdi_sosede_2d(kosi,izbrana_kosarica, razdalja=1):
    vrstica = izbrana_kosarica[0]
    stolpec = izbrana_kosarica[1]
    sosedi = {}
    st_kosov = len(kosi)
    for vr in range((-razdalja),(razdalja+1)):
        indeks_soseda_vrstica = (izbrana_kosarica[0] + vr) % st_kosov
        sosedi[indeks_soseda_vrstica,stolpec] = kosi[indeks_soseda_vrstica][stolpec]
    for st in range((-razdalja),(razdalja+1)):
        indeks_soseda_stolpec = (izbrana_kosarica[1] + st) % st_kosov
        sosedi[vrstica,indeks_soseda_stolpec] = kosi[vrstica][indeks_soseda_stolpec]        
    min_vrednost = min(sosedi.values())
    return sosedi, min_vrednost


def maksimalno_stevilo_zogic_2d(st_zogic, st_kosov):
    kosi = [st_kosov*[0] for count in range(st_kosov)]
    for i in range(st_zogic):
        izbrana_kosarica = [random.randrange(st_kosov), random.randrange(st_kosov)]
        sosedi, min_vrednost = najdi_sosede_2d(kosi, izbrana_kosarica)
        kandidati = [k for k,v in sosedi.items() if v == min_vrednost]
        #print(kandidati)
        min_sosed = list(min(kandidati)) #vzame se sosed z najmanjsim prvim indexom, leksikografsko
        vrstica = min_sosed[0]
        stolpec = min_sosed[1]
        #print(min_sosed)  
        #print(vrstica, stolpec)
        #print(kosi[stolpec][vrstica])
        kosi[vrstica][stolpec] += 1
    print(max(max(vrstica for vrstica in kosi)))
maksimalno_stevilo_zogic_2d(10000,100)