# IMPORTAMOS LA LIBRERIA RANDOM Y DATETIME
import random
import datetime

# INDICAMOS LA FECHA DE CREACIÓN

def date():
    today = datetime.datetime.now()
    a = str(today)
    new_date = ""
    for x in range(len(a)):
        if a[x] == " ":
            new_date += " at "
        if a[x] == ".":
            return new_date
        else:
            new_date += a[x]
    return new_date


# INDICAMOS LA PATH DONDE QUEREMOS CREAR LA FILE
path = ""
# DECLARAMOS LA SIGUIETEN VARIABLE PARA EMPEZAR EL WHILE
z = "y"
# DEINIMOS LA ENTIDAD QUE TENDRÁ LA PASSWORD PARA ALMACENAR
user = ""
# DEFINIMOS EL CONTADOR DE LAS PASSWORDS
timer = 0
# ARRAY DE CONTRASEÑAS GENERADAS
passwords = []
# FUNNCIÓN PARA CREAR CONTRASEÑAS


def password(passwords):
    # VARIABLES QUE EMPLEAREMOS A LA HORA DE CREAR LA PASSWORD
    lower_char = "abcdefghijklmnñopqrstuvwxyz"

    upper_char = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZ"

    numbersa = "1234567890"

    especial = "!·$%&/()*_:;¨`º"

    validation = ""

    # VARIABLE PARA REALIZAR UN BUCLE WHILE
    test = 0
    while test == 0:
        # VALIDACIÓN PARA INDICAR QUE SE HA DE INTRODUCIR UN INT
        amm = input("Define the length of the password ")
        for x in range(len(amm)):
            for y in range(len(numbersa)):
                if amm[x] == numbersa[y]:
                    validation += numbersa[y]
        if validation == amm and validation != "":
            amm = int(amm)
            test = 1
        else:
            print("You can only type numbers...\n You typed this " + amm)
    # SUMAS LAS VARIABLES ENTRE SI
    lower_char = lower_char + lower_char + lower_char + \
        lower_char + lower_char + lower_char + lower_char + lower_char
    lower_char += lower_char + lower_char
    upper_char = upper_char + upper_char + upper_char + \
        upper_char + upper_char + upper_char + upper_char + upper_char
    upper_char = upper_char + upper_char
    numbersa = numbersa + numbersa + numbersa + numbersa + \
        numbersa + numbersa + numbersa + numbersa + numbersa + numbersa
    numbersa = numbersa + numbersa
    especial = especial + especial + especial + especial + \
        especial + especial + especial + especial + especial + especial
    especial = especial + especial + especial + especial + \
        especial + especial + especial + especial + especial + especial
    # INIZIALIZAMOS UNA VARIABLE INDICANDO QUE ES LA COMBINACIÓN DE LAS ANTERIORES
    comb = lower_char + upper_char + numbersa + especial
    # IMPLEMENTAMOS UN RANDOM PARA CREAR UNA PASSWORD
    password = "".join(random.sample(comb, amm))
    # AÑADIMOS LA PASSWORD AL ARRAY
    passwords.append(password)
    # VERIFICAMOS SI QUIERE SEGUIR AÑADIENDO PASSWORDS O NO
    z = input(
        "Type Y if you wanna create another password or press another character to exit ")
    return z


# CREAMOS UNA NUEVA FILE DENOMINADA PASS.TXT CON CODIFICACIÓN UTF-8
f = open(path+"pass.txt", "w", encoding='utf8')
# DAMOS PERMISOS DE ESCRITURA AL ARCHIVO
f = open(path+"pass.txt", "r+", encoding='utf8')
# VERIFICAMOS SI SE HA DE VOLVER A CREAR UNA PASSWORD
while z == "y" or z == "Y":
    # INDICAMOS QUE EL RETURN DE LA FUNCTION = Z PARA COMPROBAR SI CONTINUAR O NO
    z = password(passwords)
# RECORREMOS EL ARRAY DE PASSWORDS PARA INCREMENTAR EL CONTADOR DE PASSWORDS Y ESCRIBIRLAS DENTRO DE LA FILE
for i in range(len(passwords)):
    timer = timer + 1
    f.write(
        f"{timer}| LENGTH = {len(passwords[i])} | User : {user} Password : {passwords[i]}\n\n")
f.write(f"PASSWORDS GENERATED {date()}")
