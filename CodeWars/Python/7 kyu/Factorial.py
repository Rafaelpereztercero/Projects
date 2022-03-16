def factorial(n):
    if n < 0 or n > 12:raise ValueError
    d =1
    for i in (range(1,n+1)):d = d * i 
    return d
