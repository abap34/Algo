class Bit:
    def __init__(self, n):
        self.size = n
        self.tree = [0]*(n+1)

    def __iter__(self):
        psum = 0
        for i in range(self.size):
            csum = self.sum(i+1)
            yield csum - psum
            psum = csum
        raise StopIteration()

    def __str__(self):  # O(nlogn)
        return str(list(self))

    def sum(self, i):
        if not (0 <= i <= self.size): raise ValueError("error!")
        s = 0
        while i>0:
            s += self.tree[i]
            i -= i & -i
        return s

    def add(self, i, x):
        if not (0 <= i < self.size): raise ValueError("error!")
        i += 1
        while i <= self.size:
            self.tree[i] += x
            i += i & -i

    def __getitem__(self, key):
        if not (0 <= key < self.size): raise IndexError("error!")
        return self.sum(key+1) - self.sum(key)

    def __setitem__(self, key, value):
        if not (0 <= key < self.size): raise IndexError("error!")
        self.add(key, value - self[key])


def mergecount(A):
    if len(A) == 0:
        return 0
    bit = Bit(max(A)+1)
    ans = 0
    for i, a in enumerate(A):
        ans += i - bit.sum(a+1)
        bit.add(a, 1)
    return ans


N = int(input())
B = list(map(int, input().split()))
max_B = max(B)


max_B_idx = B.index(max_B)

print(max_B_idx)
A = B[0:max_B_idx]
C = B[max_B_idx+1:N]
C = C[::-1]

print(A)
print(C)

print(mergecount(A))
print(mergecount(C))

print(mergecount(A) + mergecount(C))