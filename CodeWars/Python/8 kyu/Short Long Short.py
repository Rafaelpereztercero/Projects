def solution(a, b):
    respuesta =""
    if len(a) < len(b):
        respuesta = a +b +a
    elif len(b) < len(a):
        respuesta = b +a +b
    return respuesta
