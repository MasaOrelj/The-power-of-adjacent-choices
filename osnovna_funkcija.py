import random


#B...seznam kosaric
#x...stevilo razdejenih zogic
#n...stevilo zogic
#s...stevilo levih (oz. desnih) sosedov

#ce ima vec sosedov minimalno stevilo zogic vzame tistega, ki ima najmanjsi indeks

def maksimalno_stevilo_zogic(n, s=1):
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




def maksimalno_stevilo_zogic2(st_zogic, st_kosov, razdalja=1):
    kosi = [0]*st_kosov
    for i in range(st_zogic):
        izbrana_kosarica = random.randrange(st_kosov)
        sosedi = {}
        for j in range((-razdalja),(razdalja+1)):
            indeks_soseda = (izbrana_kosarica + j) % st_kosov
            sosedi[indeks_soseda] = kosi[indeks_soseda]
            min_vrednost = min(sosedi.values())
        kandidati = [k for k,v in sosedi.items() if v == min_vrednost]
        min_sosed = min(kandidati)
        kosi[min_sosed] += 1
        print(izbrana_kosarica)
        print(sosedi)
        print(kandidati)
        print(kosi)
maksimalno_stevilo_zogic2(10,10,4)
