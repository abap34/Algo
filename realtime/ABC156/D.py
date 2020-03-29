n,a,b = map(int, input().split())

def cmb(n, r, mod):
    if ( r<0 or r>n ):
        return 0
    r = min(r, n-r)
    return g1[n] * g2[r] * g2[n-r] % mod

mod = 10**9+7 #出力の制限
N = 10**4
g1 = [1, 1] # 元テーブル
g2 = [1, 1] #逆元テーブル
inverse = [0, 1] #逆元テーブル計算用テーブル

for i in range( 2, N + 1 ):
    g1.append( ( g1[-1] * i ) % mod )
    inverse.append( ( -inverse[mod % i] * (mod//i) ) % mod )
    g2.append( (g2[-1] * inverse[-1]) % mod )

mod = 10**9 + 7 
r = 0
ans = 1
for  i in range(1,n):
        ans *= 2
        if r > 30:
            ans %= (10**9 +7)
            r = 0
        r += 1
ans = ans % (10^9 + 7)
ans = ans - (cmb(n,a,mod)+cmb(n,b,mod)+1)
print(ans)