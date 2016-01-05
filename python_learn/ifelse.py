def getMax(a, b):
    if a > b :
        return a
    else :
        return b


def getMin(a, b):
    if a < b :
        return a
    else :
        return b

print getMax(1, 3)
print getMin(1, 3)

def greater_less_equals(a, b):
    if a > b:
        return 1
    elif a < b:
        return -1
    else:
        return 0

print greater_less_equals(1, 3)
print greater_less_equals(1, 1)
print greater_less_equals(1, 0)
