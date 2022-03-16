def how_much_i_love_you(nb_petals):
    while nb_petals>6:
        nb_petals=nb_petals-6
    if nb_petals==1:
        return 'I love you'
    elif nb_petals==2:
        return 'a little'
    elif nb_petals==3:
        return 'a lot'
    elif nb_petals==4:
        return 'passionately'
    elif nb_petals==5:
        return 'madly'
    else:
        return 'not at all'
