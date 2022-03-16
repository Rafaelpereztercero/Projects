def high_and_low(numbers):
   
    splitnum = numbers.split (' ')
    arraynum = []
    
    for num in splitnum:
        
        arraynum.append(int(num))
    
    new = arraynum.sort()
    
    return f'{arraynum[-1]} {arraynum[0]}'
