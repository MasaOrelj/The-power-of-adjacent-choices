import random


#B...seznam kosaric
#x...stevilo razdejenih zogic
#n...stevilo zogic
#s...stevilo levih (oz. desnih) sosedov

#ce ima vec sosedov minimalno stevilo zogic vzame tistega, ki ima najmanjsi indeks

def maksimalno_stevilo_zogic(n):
    B = [0]*n
    x = 0
    while x <= n-1:
        izbrana_kosarica = random.randrange(n)
        if izbrana_kosarica == 0:
            sosedi = [B[-1]] + B[0:2]
            minimalni_sosed = min(sosedi)
            indeks = sosedi.index(minimalni_sosed)
            if indeks == 0:
                B[-1] += 1
            else:
                B[izbrana_kosarica -1] += 1
            x += 1
        elif izbrana_kosarica == n-1:
            sosedi = B[n-2:n] + [B[0]]
            minimalni_sosed = min(sosedi)
            indeks = sosedi.index(minimalni_sosed)
            if indeks == 0:
                B[0] += 1
            else:
                B[izbrana_kosarica-2] +=1
            x += 1
        else:
            minimalni_sosed = min(B[izbrana_kosarica -1 : izbrana_kosarica +2])
            indeks = B[izbrana_kosarica - 1 : izbrana_kosarica + 2].index(minimalni_sosed)
            B[izbrana_kosarica -1 + indeks] += 1
            x += 1
    return max(B)
