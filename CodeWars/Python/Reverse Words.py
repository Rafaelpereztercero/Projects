def reverse_words(text):
    separador= " "
    resultado= []
    palabra=""
    fin = ""
    for i in range(len(text)):
        if (text[i] != separador):
            palabra= palabra+text[i] 
        else:
            resultado=resultado+[palabra]
            palabra=""
    resultado=resultado+[palabra] 
    for word in resultado:
        fin+= word[::-1] + " "
    return fin[0:(len(fin)-1)]
