def bumps(road):
    a= 0
    b= 0
    for i in range(len(road)):
        if "n" == road[i]:
            a+=1
        if "_" == road[i]:
            b+=1
    if a <= 15:
        return ("Woohoo!")
    else:
        return ("Car Dead")
    if b <= 15:
        return ("Woohoo!")
    else:
        return ("Car Dead")
