def isprime(n):
    if n == 1:
        return False
    if n == 2:
        return True
    if n % 2 == 0:
        return False
    p = 3
    while p * p <= n:
        if n % p == 0:
            return False
        p += 2
    return True

def is_like(N):
    for i in range(1, 10**5):
        if isprime(i):
            div, rem = divmod(N, i**2)
            if div == i:
                continue
            
            if rem == 0 and isprime(div):
                return True
            
    return False


def main():
    N = int(input())
    if is_like(N):
        print("Yes")
    else:
        print("No")

if __name__ == "__main__":
    main()