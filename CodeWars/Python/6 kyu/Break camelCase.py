def solution(s):
    list = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZ"
    palabra = ""
    for i in range(len(s)):
        
        if s[i] in list:
            palabra += " "+s[i]
        else:
            palabra += s[i]
    
    return palabra
