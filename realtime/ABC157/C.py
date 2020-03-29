def main():
    sc = {}
    N,M = map(int,input().split())
    for _ in range(M):
        s,c = input().split()
        s = int(s)
        if s not in sc:
            sc[s] = c
        else:
            if sc[s] != c:
                return -1

    if 1 in sc and sc[1] == '0' and N != 1:
        return -1

    ans = ["0"] * N

    for k,n in sc.items():
        ans[k-1] = n

    result = ''.join(ans)
    if result[0] != '0' or result == '0':
        return result
    else:
        result = '1' + result[1:]    
        return int(result)


print(main())