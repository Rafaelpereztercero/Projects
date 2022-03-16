def is_divide_by(number, a, b):
    c = number / a
    while number % a == 0 and number % b == 0:
        return True
    
    return False
