def char_to_arr(char):
    d = {
        'a':0,
        't':1,
        'c':2,
        'o':3,
        'd':4,
        'e':5,
        'r':6        
    }
    return d[char] 


s = input()

ppp = []
for char in s:
    ppp.append(char_to_arr(char))

def count_inversion(sequence):
    return sum(sum(m<n for m in sequence[i+1:]) for i,n in enumerate(sequence))

print(count_inversion(ppp))