def abbrev_name(name):
    separador = " "
    palabra = ""
    resultado = ""
    for i in range(len(name)):
        if separador != name[i]:
            palabra += name[i].upper() 
        else:
            resultado = resultado +palabra[0].upper() + "."
            palabra= ""
    resultado+=palabra[0]
    

    return resultado
