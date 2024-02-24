import bisect
import heapq

def main():
    N, A = map(int, input().split())
    X = list(map(int, input().split()))

    T = int(input())

    pusht = [[] for _ in range(N + 1)]
    popt = [[] for _ in range(N + 1)]

    L = []
    R = []
    for _ in range(T):
        l, r = map(int, input().split())
        L.append(l)
        R.append(r)

    for t, (l, r) in enumerate(zip(L, R)):
        left_index = bisect.bisect_left(X, l)
        right_index = bisect.bisect_right(X, r) 
        pusht[left_index].append(t + 1)
        popt[right_index].append(t + 1)


    current = [(1, 1)]
    heapq.heapify(current)

    for i in range(N):
        if pusht[i]:
            for t in pusht[i]:
                heapq.heappush(current, (-t, -t))
        
        if popt[i]:
            for t in popt[i]:
                heapq.heappop(current

        print(current)

        ans = -heapq.heappop(current)[0]
        print(ans)


        heapq.heappush(current, (-ans, -ans))



main()
